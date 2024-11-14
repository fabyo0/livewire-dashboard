<?php

namespace App\Http\Livewire;

use App\Models\Brand;
use App\Models\Product;
use Livewire\Component;
use Livewire\WithPagination;

class BrandProduct extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';
    public $category;
    public $searchTerm;
    public $filters = [];
    public $perPage = 9;
    public $sort = 'created_at|desc';
    public $sortColumnName = 'created_at';
    public $sortDirection = 'desc';
    public $field;


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

        $brands = Brand::with('products')->withCount('products');

        $this->applySearchFilter($brands->orderBy($this->sortColumnName, $this->sortDirection));


        $brands = $brands->orderBy($this->sortByColumn(), $this->sortDirection())
            ->paginate($this->perPage);

        return view('livewire.brand-product', [
            'brands' => $brands
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

    private function applySearchFilter($brands)
    {
        if ($this->searchTerm) {
            return $brands->whereRaw("name LIKE \"%$this->searchTerm%\"");

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
