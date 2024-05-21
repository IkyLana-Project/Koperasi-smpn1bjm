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
        if(auth()->user()->user == 'admin') {            
            $products = Product::paginate(8);
            $types = Types::get();
            return view('dashboard.index', [
                'title' => 'Dashboard',
                'active' => 'dashboard',
                'products' => $products,
                'types' => $types
            ]);
        } else {
            return redirect('/');
        }
    }

    public function cariNama(Request $request)
    {
        $products = Product::where('barang', 'like', '%' . $request->input('barang') . '%')->paginate(8);
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
        $products = Product::where('types', 'like', '%' . $request->input('type') . '%')->paginate(8);
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
        if(auth()->user()->user == 'admin') {
            $types = Types::get();
            return view('dashboard.create', [
                'title' => 'Create',
                'active' => 'dashboard',
                'types' => $types
            ]);
        } else {
            return redirect('/');
        }
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'barang' => 'required',
            'types' => 'required',
            'harga' => 'required',
            'stok' => 'required',
            'gambar' => 'required|mimes:png,jpg,jpeg|max:4000'
        ]);

        $validatedData['gambar'] = $request->file('gambar')->store('product-images');

        Product::create($validatedData);

        return redirect()->back()->with('success', 'Data Barang Berhasil ditambahkan');
    }

    public function edit($id)
    {
        if(auth()->user()->user == 'admin') {
            $product = Product::where('id', $id)->first();
            $typesD = Types::get();
            return view('dashboard.edit', [
                'title' => 'Edit',
                'active' => 'dashboard',
                'product' => $product,
                'typesD' => $typesD
            ]);
        } else {
            return redirect('/');
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
    {
        $product = Product::where('id', $id)->first();
        if($product->gambar) {
            Storage::delete($product->gambar);
        }

        Product::destroy('id', $id);

        return redirect('/dashboard')->with('success', 'Data Barang berhasil dihapus');
    }
};
