@extends('layouts.main')

@section('container')
<div class="w-full h-max bg-white p-4">
    <h6 class="text-xl font-medium">Tambah Data Barang</h6>
    @if(session('success'))
    <p class="text-green-600">{{ session('success') }}</p>
    @endif
    <form action="/dashboard" method="post" class="flex flex-col gap-4 mt-6" enctype="multipart/form-data">
        @method('post')
        @csrf
        <div class="flex flex-col">
            <label for="barang">Nama Barang</label>
            <input type="text" id="barang" name="barang" placeholder="Nama Barang" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
        </div>
        <div class="flex flex-col">
            <label for="types">Kategori Barang</label>
            <select name="types" id="types" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
                @foreach ($types as $type)
                    <option value="{{ $type->type }}">{{ $type->type }}</option>
                @endforeach
            </select>
        </div>
        <div class="flex flex-col">
            <label for="harga">Harga Barang</label>
            <input type="number" id="harga" name="harga" placeholder="Harga Barang" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
        </div>
        <div class="flex flex-col">
            <label for="stok">Jumlah Barang</label>
            <input type="number" id="stok" name="stok" placeholder="Jumlah Barang" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
        </div>
        <div class="flex flex-col">
            <label for="gambar">Gambar Barang</label>
            <input type="file" id="gambar" name="gambar" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
        </div>
        <div class="flex justify-end">
            <button type="submit" class="bg-green-600 hover:bg-green-400 hover:duration-150 text-white rounded-lg px-3 py-2">Simpan</button>
        </div>
    </form>
</div>
@endsection
