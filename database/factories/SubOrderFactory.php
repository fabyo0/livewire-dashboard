<?php

namespace Database\Factories;

use App\Models\Customer;
use App\Models\Order;
use App\Models\SubOrder;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\DB;
use Database\Factories\CustomerFactory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SubOrder>
 */
class SubOrderFactory extends Factory
{
    protected $model = SubOrder::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'order_id' => Order::inRandomOrder()->value('id'),
            'customer_id' => Customer::inRandomOrder()->value('id'),
            'status' => $this->faker->randomElement(['pending', 'processing', 'completed', 'decline']),
            'grand_total' => $this->faker->randomFloat(2, 50, 500),
            'item_count' => $this->faker->numberBetween(1, 10),
        ];
    }
}
