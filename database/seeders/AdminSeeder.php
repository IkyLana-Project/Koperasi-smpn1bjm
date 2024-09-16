<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'email' => 'Admindata@Gmail.com',
            'password' => Hash::make('admin123'),
            'user' => 'admindata'
        ]);
        User::create([
            'email' => 'Admincetak@Gmail.com',
            'password' => Hash::make('admin123'),
            'user' => 'admincetak'
        ]);
        //
    }
}
