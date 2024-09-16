<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        $carts = Cart::get();
        if(auth()->user()->user == 'admincetak') {
            return view('cart.index', [
                'title' => 'Cart',
                'active' => 'cart',
                'carts' => $carts,
            ]);
        } else {
            return redirect('/beranda');
        }
        
    }

    public function store(Request $request)
    {
        if(auth()->user()->user == 'admincetak') {
        $validated = $request->validate([
            'product_id' => 'required'
        ]); 

        Cart::create($validated);

        return redirect()->back()->with('cartSuccess', 'Produk Berhasil ditambahkan ke keranjang');
        
    } else {
        return redirect('/beranda');
    }
}

    public function destroy($id) 
    {
        Cart::where('id', $id)->delete();

        return redirect()->back();
    }
}
