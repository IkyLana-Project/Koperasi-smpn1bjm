<?php

namespace App\Http\Controllers;

use App\Models\Types;
use Illuminate\Http\Request;

class TypeController extends Controller
{
    public function index()
    {
        $types = Types::get();
        return view('dashboard.type', [
            'title' => 'Dashboard',
            'active' => 'dashboard',
            'types' => $types
        ]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'type' => 'required'
        ]);

        Types::create($validated);

        return redirect()->back()->with('success', 'Kategori Berhasil Ditambahkan');
    }

    public function destroy($id) {
        Types::where('id', $id)->delete();

        return redirect()->back()->with('success', 'success delete');
    }
}
