<?php

namespace Database\Seeders;

use App\Models\Customer;
use App\Models\Order;
use App\Models\SubOrder;
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

                'sub_order_id' => SubOrder::inRandomOrder()->value('id'),
                'amount_paid' => mt_rand(99, 4999) / 100,
                'payer_email' => $this->customers[rand(0, count($this->customers) - 1)]->email,
                'customer_id' => $this->customers[rand(0, count($this->customers) - 1)]->id,
                'status' => 'completed'
            ]);


        }
    }
}
