<?php

namespace App\Http\Livewire;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Support\Facades\Request;
use Livewire\Component;
use Livewire\WithPagination;

class CategorySearch extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';
    public $category;
    public $categorySearch;
    public $filters = [];
    public $perPage = 20;
    public $sort = 'created_at|desc';
    public $sortDirection = 'desc';
    public $sortColumnName = 'created_at';
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
        $categories = Category::with('products')->withCount('products');

        $this->applySearchFilter($categories->orderBy($this->sortColumnName, $this->sortDirection));

        $this->applyCategoryFilter($categories);

        $categories = $categories->orderBy($this->sortByColumn(), $this->sortDirection())
            ->paginate($this->perPage);

        return view('livewire.category-search', [
            'categories' => $categories

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

    private function applySearchFilter($categories)
    {
        if ($this->categorySearch) {
            return $categories->whereRaw("name LIKE \"%$this->categorySearch%\"");

        }

        return null;
    }

    private function applyCategoryFilter($categories)
    {
        if ($this->filters) {

            foreach ($this->filters as $filter) {
                $categories->whereHas('products', function ($query) use ($filter) {
                    $query->where('products.id', $filter);

                });
            }

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
