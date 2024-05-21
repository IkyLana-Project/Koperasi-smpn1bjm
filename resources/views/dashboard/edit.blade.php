@extends('layouts.main')

@section('container')
<div class="w-full h-max bg-white p-4">
    <h6 class="text-xl font-medium">Ubah Data Barang</h6>
    @if(session('success'))
    <p class="text-blue-500">{{ session('success') }}</p>
    @endif
    <form action="/dashboard/{{ $product->id }}" class="flex flex-col gap-4 mt-6" method="post" enctype="multipart/form-data">
        @method('put')
        @csrf()
        <div class="flex flex-col">
            <label for="barang">Nama Barang</label>
            <input type="text" id="barang" name="barang" placeholder="Nama Barang" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-blue-500" value="{{ $product->barang }}">
        </div>
        <div class="flex flex-col">
            <label for="types">Kategori Barang</label>
            <select name="types" id="types" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
                <option value="{{ $product->types }}">{{ $product->types }}</option>
                @foreach ($typesD as $type)
                    <option value="{{ $type->type }}">{{ $type->type }}</option>
                @endforeach
            </select>
        </div>
        <div class="flex flex-col">
            <label for="harga">Harga Barang</label>
            <input type="number" id="harga" name="harga" placeholder="Harga Barang" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-blue-500" value="{{ $product->harga }}">
        </div>
        <div class="flex flex-col">
            <label for="stok">Jumlah Barang</label>
            <input type="number" id="stok" name="stok" placeholder="Jumlah Barang" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-blue-500" value="{{ $product->stok }}">
        </div>
        <div class="flex flex-col">
            <label for="stok">Gambar Barang</label>
            <img src="{{ asset('storage/'.$product->gambar) }}" alt="{{ $product->barang }}" class="w-full object-cover lg:w-32 lg:h-32">
            <input type="hidden" name="gambarLama" id="gambarLama" value="{{ $product->gambar }}">
            <input type="file" id="gambar" name="gambar" class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
        </div>
        <div class="flex justify-end">
            <button type="submit" class="bg-blue-500 hover:bg-blue-400 hover:duration-150 text-white rounded-lg px-3 py-2">Simpan</button>
        </div>
    </form>
</div>
@endsection
