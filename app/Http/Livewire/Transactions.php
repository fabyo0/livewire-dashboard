<?php

namespace App\Http\Livewire;

use App\Models\Order;
use Livewire\Component;
use Livewire\WithPagination;

class Transactions extends Component
{
    use WithPagination;
    protected $paginationTheme = 'bootstrap';
    public $filters = [];
    public $searchTransaction;
    public $perPage = 9;
    public $sort = 'created_at|desc';
    public $sortColumnName = 'created_at';
    public $sortDirection = 'desc';


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
        $transactions = Order::with('items')->where('is_paid', '=', 1)->withCount('items');
        $this->applySearchFilter($transactions->orderBy($this->sortColumnName, $this->sortDirection));

        $transactions = $transactions->orderBy($this->sortByColumn(), $this->sortDirection())
            ->paginate($this->perPage);

        return view('livewire.transactions', [
            'transactions' => $transactions
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


    private function applySearchFilter($transactions)
    {
        if ($this->searchTransaction) {
            return $transactions->whereRaw("order_number LIKE \"%$this->searchTransaction%\"")
                ->orWhereRaw("email LIKE \"%$this->searchTransaction%\"");
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
