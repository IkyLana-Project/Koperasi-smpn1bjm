<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Types;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        
        $productsQuery = Product::query();

        if ($request->input('barang')) {
             $productsQuery->where('barang', 'like', '%' . $request->input('barang') . '%');
        }

        if ($request->input('type')) {
            $productsQuery->where('types', 'like', '%' . $request->input('type') . '%');
        }

        $products = $productsQuery->paginate(100);

        $types = Types::get();
        return view('product.index', [
            'title' => 'Product',
            'active' => 'product',
            'products' => $products,
            'types' => $types
        ]);
    }

    public function indexuser(Request $request)
    {
        $productsQuery = Product::query();

        if ($request->input('barang')) {
             $productsQuery->where('barang', 'like', '%' . $request->input('barang') . '%');
        }

        if ($request->input('type')) {
            $productsQuery->where('types', 'like', '%' . $request->input('type') . '%');
        }

        $products = $productsQuery->paginate(100);

        $types = Types::get();
        return view('product.indexguest', [
            'title' => 'Product',
            'active' => 'product',
            'products' => $products,
            'types' => $types
        ]);
    }
}
