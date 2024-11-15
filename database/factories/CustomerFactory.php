<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Customer>
 */
class CustomerFactory extends Factory
{
    public function definition()
    {
        return [
            'billing_name' => $this->faker->name(),
            'billing_surname' => $this->faker->name(),
            'billing_company' => $this->faker->company(),
            'email' => $this->faker->unique()->safeEmail(),
            'email_verified_at' => now(),
            'billing_address' => $this->faker->unique()->address(),
            'billing_phone' => $this->faker->unique()->phoneNumber(),
            'billing_city' => $this->faker->unique()->city(),
            'billing_vat' => $this->faker->unique()->randomNumber(),
            'billing_zipcode' => $this->faker->unique()->postcode(),
            'billing_province' => $this->faker->unique()->country(),
            'billing_country' => $this->faker->unique()->country(),
            'shipping_name' => $this->faker->unique()->name(),
            'shipping_surname' => $this->faker->unique()->name(),
            'shipping_company' => $this->faker->unique()->company(),
            'shipping_city' => $this->faker->unique()->city(),
            'shipping_address' => $this->faker->unique()->address(),
            'shipping_phone' => $this->faker->unique()->phoneNumber(),
            'shipping_zipcode' => $this->faker->unique()->postcode(),
            'shipping_province' => $this->faker->unique()->city(),
            'shipping_country' => $this->faker->unique()->country(),
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'remember_token' => Str::random(10),
        ];
    }

    /**
     * Indicate that the model's email address should be unverified.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function unverified()
    {
        return $this->state(function (array $attributes) {
            return [
                'email_verified_at' => null,
            ];
        });
    }
}
