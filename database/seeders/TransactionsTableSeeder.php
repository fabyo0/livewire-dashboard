<?php

namespace Database\Seeders;

use App\Models\Customer;
use App\Models\Order;
use App\Models\Transaction;
use Faker\Factory as Faker;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class TransactionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create();
        $this->customers = Customer::all();
        $this->orders = Order::all();
        for ($i = 1; $i <= 300; $i++) {

            Transaction::create([

                'sub_order_id' => $this->orders[rand(0, count($this->orders) - 1)]->id,
                'price' => mt_rand(99, 4999) / 100,
                'amount_paid' => mt_rand(99, 4999) / 100,
                'payer_email' =>$faker->unique()->safeEmail(),
                'customer_id' => $this->orders[rand(0, count($this->orders) - 1)]->id,
                'status' => 'completed'
            ]);


        }
    }
}
