<?php

namespace Database\Seeders;

use App\Models\Customer;
use App\Models\Order;
use App\Models\Transaction;
use Faker\Factory as Faker;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Nette\Utils\DateTime;

class OrdersTableSeeder extends Seeder
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
        $start_date = '2024-12-31 00:00:00';
        $end_date = '2010-01-01 00:00:00';

        $min = strtotime($start_date);
        $max = strtotime($end_date);

        // Generate random number using above bounds
        $val = rand($min, $max);
        $weeks = rand(1, 52);

        // Convert back to desired date format
        $start = new DateTime(date('Y-m-d H:i:s', $val));
        $end = $start->modify('+' . $weeks . ' weeks');
        for ($i = 1; $i <= 300; $i++) {

            $order = Order::create([
                'order_number' => strtoupper(uniqid()),
                'billing_name' => $faker->name(),
                'billing_surname' => $faker->name(),
                'billing_company' => $faker->company(),
                'email' => $faker->unique()->safeEmail(),
                'billing_address' => $faker->address(),
                'billing_phone' => $faker->phoneNumber(),
                'billing_city' => $faker->city(),
                'billing_vat' => $faker->randomNumber(),
                'billing_zipcode' => $faker->postcode(),
                'billing_province' => $faker->country(),
                'billing_country' => $faker->country(),
                'shipping_name' => $faker->name(),
                'shipping_surname' => $faker->name(),
                'shipping_company' => $faker->company(),
                'shipping_city' => $faker->city(),
                'shipping_address' => $faker->address(),
                'shipping_phone' => $faker->phoneNumber(),
                'shipping_zipcode' => $faker->postcode(),
                'shipping_province' => $faker->city(),
                'shipping_country' => $faker->country(),
                'grand_total' => mt_rand(99, 63999) / 100,
                'customer_id' => $this->customers[rand(0, count($this->customers) - 1)]->id,
                'status' => 'completed',
                'is_paid' => '1',
                'is_shipped' => '0',
                'payment_method' => 'card',
                'created_at' => $faker->dateTime(),
                'updated_at' => $faker->dateTime()
            ]);

        }
    }
}
