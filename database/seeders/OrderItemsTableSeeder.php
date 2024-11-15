<?php

namespace Database\Seeders;

use App\Models\Customer;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\Transaction;
use Faker\Factory as Faker;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OrderItemsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        $this->orders = Order::all();
        $this->products = Product::all();
        for ($i = 1; $i <= 300; $i++) {

            OrderItem::create([

                'product_id' => $this->products[rand(0, count($this->products) - 1)]->id,
                'order_id' => $this->orders[rand(0, count($this->orders) - 1)]->id,
                'price' => mt_rand(99, 4999) / 100,
                'quantity' =>$faker->randomNumber(1,252),
            ]);


        }
    }
}
