<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        $carts = Cart::get();
        return view('cart.index', [
            'title' => 'Cart',
            'active' => 'cart',
            'carts' => $carts,
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required'
        ]); 

        Cart::create($validated);

        return redirect()->back()->with('cartSuccess', 'Produk Berhasil ditambahkan ke keranjang');
    }

    public function destroy($id) 
    {
        Cart::where('id', $id)->delete();

        return redirect()->back();
    }
}
