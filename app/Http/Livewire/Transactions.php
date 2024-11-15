<?php

namespace App\Http\Livewire;

use App\Models\Order;
use Livewire\Component;
use Livewire\WithPagination;

class Transactions extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';
    public $searchOrder;
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
        $getOrder = Order::with('items')->withCount('items');
        $this->applySearchFilter($getOrder->orderBy($this->sortColumnName, $this->sortDirection));
        $this->getData($getOrder);
        $getStatus = Order::with('items')->distinct('status')->pluck('status')->toArray();

        $orders = $getOrder->orderBy($this->sortByColumn(), $this->sortDirection())
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

    public function getData($getStatus)
    {
        if ($this->filters['processing']) {
            return $getStatus->whereRaw("status LIKE \"%processing%\"");
        }
        if ($this->filters['pending']) {
            return $getStatus->whereRaw("status LIKE \"%pending%\"");
        }
        if ($this->filters['completed']) {
            return $getStatus->whereRaw("status LIKE \"%completed%\"");
        }
        if ($this->filters['decline']) {
            return $getStatus->whereRaw("status LIKE \"%decline%\"");
        }
    }

    private function applySearchFilter($orders)
    {
        if ($this->searchOrder) {
            return $orders->whereRaw("order_number LIKE \"%$this->searchOrder%\"")
                ->orWhereRaw("email LIKE \"%$this->searchOrder%\"")
                ->orWhereRaw("status LIKE \"%$this->searchOrder%\"");
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
