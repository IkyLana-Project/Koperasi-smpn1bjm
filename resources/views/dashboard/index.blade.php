@extends('layouts.main')

@section('container')
    <div class="bg-white w-full h-max lg:rounded-xl shadow-sm p-4 lg:p-8">
        <div class="flex flex-row gap-4">
            <a href="/dashboard/create" class="bg-green-600 px-3 py-2 rounded-lg text-white hover:bg-green-500 hover:duration-150"><i class="fa-solid fa-plus"></i> Tambah Data</a>
            <a href="/types" class="border border-red-500 px-3 py-2 rounded-lg text-red-500 hover:bg-red-500 hover:text-white hover:duration-150">Tambah Kategori</a>
        </div>
        <h5 class="text-xl font-medium mt-5 mb-3">Data Produk</h5>
        <div class="w-full gap-3 flex flex-row">
            <form action="/cariNama" class="w-1/2 mt-4 flex flex-row">
                <input type="text" id="barang" name="barang" placeholder="Cari Barang..." class="w-full border px-3 py-2 border-green-600 rounded-l-lg outline-none placeholder:text-green-600">
                <button class="bg-green-600 rounded-r-lg px-3 py-2 text-white hover:bg-green-500 hover:duration-150"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <form action="/kategori" class="w-1/2 mt-4 flex flex-row">
                <select id="type" name="type" class="w-full border px-3 py-2 border-green-600 rounded-l-lg outline-none placeholder:text-green-600">
                    <option value="">Semua</option>
                    @foreach ($types as $type)
                    <option value="{{ $type->type }}">{{ $type->type }}</option>
                    @endforeach
                </select>
                <button class="bg-green-600 rounded-r-lg px-3 py-2 text-white hover:bg-green-500 hover:duration-150"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        @if(session('success'))
        <p class="text-red-500 mt-2">{{ session('success') }}</p>
        @endif
        <div class="w-full flex flex-col lg:grid lg:grid-cols-4 gap-4 mt-6">
            @foreach ($products as $product)
            <div class="bg-white border-green-600 w-full h-max border rounded-lg shadow-md">
                <div class="flex flex-row gap-3 px-3">
                    <div class="w-1/2 p-1 lg:p-2">
                        <div class="flex justify-start">
                            <img src="{{ asset('storage/'.$product->gambar) }}" alt="{{ $product->barang }}" class="w-32 h-32 object-cover">
                        </div>
                        <div class="mt-2 w-56">
                            <h6 class="font-medium">{{ $product->barang }}</h6>
                            <p>@currency($product->harga)</p>
                            <p class="text-slate-400 text-sm">Stok: {{ $product->stok }}</p>
                        </div>
                    </div>
                    <div class="w-1/2 flex flex-col gap-3 pt-3">
                        <a href="/dashboard/{{ $product->id }}/edit" class="border border-blue-500 rounded-lg text-blue-500 text-center py-1 w-full hover:bg-blue-500 hover:text-white hover:duration-150"><i class="fa-solid fa-pen-to-square"></i> Ubah</a>
                        <form action="/dashboard/{{ $product->id }}" method="post">
                            @method('delete')
                            @csrf
                            <button type="submit" onclick="return confirm('Apakah anda yakin ingin menghapus data barang ini?')" class="border border-red-500 rounded-lg text-red-500 text-center py-1 w-full hover:bg-red-500 hover:text-white hover:duration-150"><i class="fa-solid fa-delete-left"></i> Hapus</button>
                        </form>
                    </div>
                </div>
                <svg class="lg:hidden" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="#16a34a" fill-opacity="1" d="M0,192L48,165.3C96,139,192,85,288,80C384,75,480,117,576,122.7C672,128,768,96,864,106.7C960,117,1056,171,1152,170.7C1248,171,1344,117,1392,90.7L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>
            </div>
            @endforeach
        </div>
    </div>
@endsection
