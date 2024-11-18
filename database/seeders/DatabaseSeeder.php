<?php

namespace Database\Seeders;

use App\Http\Livewire\Transactions;
use App\Models\Customer;
use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        Customer::factory(50)->create();
        $this->call(UsersTableSeeder::class);
        $this->call(CategoriesTableSeeder::class);
        $this->call(AttributesTableSeeder::class);
        $this->call(BrandsTableSeeder::class);
        $this->call(ProductsTableSeeder::class);
        $this->call(OrdersTableSeeder::class);
        $this->call(SubOrdersTableSeeder::class);
        $this->call(OrderItemsTableSeeder::class);
        $this->call(SliderTableSeeder::class);
        $this->call(CouponTableSeeder::class);
        $this->call(TransactionsTableSeeder::class);

    }
}
