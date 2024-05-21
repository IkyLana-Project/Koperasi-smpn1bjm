<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use App\Models\Notes;
use App\Models\Product;
use Illuminate\Http\Request;

class NoteController extends Controller
{
    public function show($id)
    {
        $note = Notes::where('id', $id)->first();
        return view('cart.note', [
            'title' => 'Nota',
            'note' => $note
        ]);
    }

    public function store(Request $request)
    {
        $barangSatuan = $request->input('barang_satuan');
        $jumlahBarang = $request->input('jumlah_barang');
        $totalHarga = $request->input('total_harga');

        $data = [
            'nama' => $request->input('nama'),
            'barang_satuan' => json_encode($barangSatuan),
            'jumlah_barang' => json_encode($jumlahBarang),
            'total_harga' => json_encode($totalHarga),
            'total_harga_keseluruhan' => $request->input('total_harga_keseluruhan')
        ];

        $note = Notes::create($data);

        foreach ($barangSatuan as $index => $namaBarang) {
            $jumlahTerjual = $jumlahBarang[$index];
            $barang = Product::where('barang', $namaBarang)->firstOrFail();
            $barang->stok -= $jumlahTerjual;
            $barang->save();
        }

        Cart::truncate();

        return redirect('/note/' . $note->id)->with('success', 'Transaksi tersimpan');
    }
}
