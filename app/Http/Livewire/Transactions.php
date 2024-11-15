<?php

namespace App\Http\Livewire;

use App\Models\Order;
use Livewire\Component;
use Livewire\WithPagination;

class Transactions extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';
    public $searchTransaction;
    public $perPage = 9;
    public $sort = 'created_at|desc';
    public $sortColumnName = 'created_at';
    public $sortDirection = 'desc';
    public $filters = [
        'processing' => false,
        'pending' => false,
        'completed' => false,
        'decline' => false,
    ];
    public $selected;

    public function mount()
    {
    }

    /*
     * Reset pagination when doing a search
     */
    public function updated()
    {
        $this->resetPage();
    }

    public function render()
    {
        $getTransaction = Order::with('items')->withCount('items');
        $this->applySearchFilter($getTransaction->orderBy($this->sortColumnName, $this->sortDirection));
        $getStatus = Order::with('items')->distinct('status')->pluck('status');

        $orders = $getTransaction->orderBy($this->sortByColumn(), $this->sortDirection())
            ->where('is_paid', '=', 1)
            ->paginate($this->perPage);

        return view('livewire.transactions', [
            'orders' => $orders,
            'getStatus' => $getStatus
        ]);
    }

    public function sortByColumn()
    {
        $sort = explode("|", $this->sort);

        if (!$sort[0]) {
            return;
        }

        return $sort[0];
    }

    public function sortDirection()
    {
        $sort = explode("|", $this->sort);

        return $sort[1] ?? 'asc';
    }


    private function applySearchFilter($orders)
    {
        if ($this->searchTransaction) {
            return $orders->whereRaw("sub_order_id LIKE \"%$this->searchTransaction%\"")
                ->orWhereRaw("payer_email LIKE \"%$this->searchTransaction%\"")
                ->orWhereRaw("status LIKE \"%$this->searchTransaction%\"");
        }

        return null;
    }


    public function sortBy($columnName)
    {
        if ($this->sortColumnName === $columnName) {
            $this->sortDirection = $this->swapSortDirection();
        } else {
            $this->sortDirection = 'asc';
        }

        $this->sortColumnName = $columnName;
    }

    public function swapSortDirection()
    {
        return $this->sortDirection === 'asc' ? 'desc' : 'asc';
    }
}
