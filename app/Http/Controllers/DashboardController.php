<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\Types;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        if(auth()->user()->user == 'admindata') {            
            $products = Product::paginate(100);
            $types = Types::get();
            return view('dashboard.index', [
                'title' => 'Dashboard',
                'active' => 'dashboard',
                'products' => $products,
                'types' => $types
            ]);
        } else (auth()->user()->user == 'admincetak'); {    
            $products = Product::paginate(100);
            $types = Types::get();        
            return view('product.index', [
                'title' => 'Product',
                'active' => 'product',
                'products' => $products,
                'types' => $types
            ]);
        }
    }

    public function cariNama(Request $request)
    {
        $products = Product::where('barang', 'like', '%' . $request->input('barang') . '%')->paginate(100);
        $types = Types::get();
        return view('dashboard.index', [
            'title' => 'Dashboard',
            'active' => 'dashboard',
            'products' => $products,
            'types' => $types
        ]);
    }

    public function kategori(Request $request)
    {
        $products = Product::where('types', 'like', '%' . $request->input('type') . '%')->paginate(100);
        $types = Types::get();
        return view('dashboard.index', [
            'title' => 'Dashboard',
            'active' => 'dashboard',
            'products' => $products,
            'types' => $types
        ]);
    }

    public function create()
    {
        if(auth()->user()->user == 'admindata') {
            $types = Types::get();
            return view('dashboard.create', [
                'title' => 'Create',
                'active' => 'dashboard',
                'types' => $types
            ]);
        } else {
            return redirect('/beranda');
        }
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'barang' => 'required',
            'types' => 'required',
            'harga' => 'required',
            'stok' => 'required',
            'gambar' => 'required|mimes:png,jpg,jpeg|max:7000'
        ]);

        $validatedData['gambar'] = $request->file('gambar')->store('product-images');

        Product::create($validatedData);

        return redirect()->back()->with('success', 'Data Barang Berhasil ditambahkan');
    }

    public function edit($id)
    {
        if(auth()->user()->user == 'admindata') {
            $product = Product::where('id', $id)->first();
            $typesD = Types::get();
            return view('dashboard.edit', [
                'title' => 'Edit',
                'active' => 'dashboard',
                'product' => $product,
                'typesD' => $typesD
            ]);
        } else {
            return redirect('/beranda');
        }
    }

    public function update(Request $request, $id)
    {
        $rules = [
            'barang' => 'required',
            'types' => 'required',
            'harga' => 'required',
            'stok' => 'required',
        ];

        if ($request->hasFile('gambar')) {
            $rules['gambar'] = 'file';
        }

        $validated = $request->validate($rules);

        if ($request->hasFile('gambar')) {
            if ($request->gambarLama) {
                Storage::delete($request->gambarLama);
            }
            $validated['gambar'] = $request->file('gambar')->store('product-images');
        }

        Product::where('id', $id)->update($validated);

        return redirect()->back()->with('success', 'Data Barang berhasil diperbarui');
    }

    public function destroy($id)
    // ini coding untuk menghapus
    {
        $product = Product::where('id', $id)->first();
        if($product->gambar) {
            Storage::delete($product->gambar);
        }

        Product::destroy('id', $id);

        return redirect('/dashboard')->with('success', 'Data Barang berhasil dihapus');
    }
};
