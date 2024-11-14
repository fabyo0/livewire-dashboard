<?php

namespace Database\Seeders;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use Illuminate\Support\Str;

class ProductsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(Faker $faker)
    {
        $faker = Faker::create();
        $this->users = User::all();
        for ($i = 1; $i <= 8000; $i++) {
            $title = $faker->sentence(1);
            $slug = Str::slug($title);
            $categories = Category::whereHas('childCategories')->pluck('id');
            $brands = Brand::with('products')->pluck('id');

            $product = Product::create([

                'item_name' => $title,
                'slug' => $slug,
                'user_id' => $this->users[rand(0, count($this->users) - 1)]->id,
                'price' => mt_rand(99, 4999) / 100,
                'item_code' =>$faker->unique()->numberBetween(1, 10512),
                'img_01' => fake()->image('public/storage',640,480, null, false),
                'published' => (bool)rand(0, 1),
                'purchasable' => (bool)rand(0, 1),
                'quantity' => $faker->numberBetween(1, 1846),
                'stock_qty' => $faker->numberBetween(1, 5846),
            ]);

            $product->categories()->sync($categories->random(mt_rand(1, 2)));
            $product->brands()->sync($brands->random(mt_rand(1, 2)));

        }
    }
}
