@extends('layouts.main')

@section('container')
    <div class="w-full h-max bg-white p-4 rounded-lg">
        <div class="text-xl font-medium mb-4">Keranjang</div>
        <form action="/note" method="post" class="flex flex-col gap-3">
            @method('post')
            @csrf
            @php
                $totalHargaSemuaProduk = 0;
            @endphp
            <input type="text" placeholder="Nama Pembeli" name="nama" class="border px-1 py-2 rounded-lg shadow-md" required>
            @foreach ($carts as $index => $cart)
                @php
                    // Hitung total harga untuk produk saat ini
                    $totalHargaProduk = $cart->product->harga * $cart->jumlah_barang;
                    // Tambahkan total harga produk ke total harga semua produk
                    $totalHargaSemuaProduk += $totalHargaProduk;
                @endphp
                <div class="bg-white w-full h-max border rounded-lg shadow-md flex flex-row gap-3 px-3 py-6 mt-3">
                    <div>
                        <img src="{{ asset('storage/' . $cart->product->gambar) }}" alt=""
                            class="w-20 h-20 lg:w-32 lg:h-32 object-cover rounded-lg">
                    </div>
                    <div class="lg:w-full">
                        <h5 class="font-medium lg:text-xl">{{ $cart->product->barang }}</h5>
                        <small class="text-slate-400 lg:text-lg">Harga Satuan: {{ $cart->product->harga }}</small>
                        <br>
                        <small class="text-slate-400 lg:text-lg">Stok: {{ $cart->product->stok }}</small>
                        <div class="flex flex-col gap-2 mt-2">
                            <input type="hidden" name="barang_satuan[]" value="{{ $cart->product->barang }}">
                            <input type="hidden" 
                                id="harga_satuan_{{ $index }}" value="{{ $cart->product->harga }}"
                                onchange="totalHarga('{{ $index }}')">
                            <input type="number" name="jumlah_barang[]"
                                id="jumlah_barang_{{ $index }}" placeholder="Jumlah Barang" min="1" max="{{ $cart->product->stok}}"
                                class="border px-1 py-2 rounded-lg shadow-md"
                                onchange="totalHarga('{{ $index }}')" required>
                            <input type="number" name="total_harga[]"
                                id="total_harga_{{ $index }}" placeholder="Total Harga"
                                class="border px-1 py-2 rounded-lg shadow-md" value="{{ $cart->product->harga }}" readonly>
                            <a class="bg-red-500 w-full text-white py-2 rounded-lg mt-4 hover:bg-red-400 hover:duration-150 lg:w-max lg:px-4 lg:py-2 text-center" href="/cart/{{ $cart->id }}">Hapus Barang</a>
                        </div>
                    </div>
                </div>
            @endforeach
            <div class="mt-3">
                <input type="hidden" name="total_harga_keseluruhan" id="total_harga_keseluruhan">
                Total Harga: <span id="total_harga_semua_barang"></span>
            </div>
                @if(auth()->user()->user == 'admincetak')
            <button class="bg-green-600 w-full text-white mt-4 px-3 py-2 rounded-lg hover:bg-green-500 hover:duration-150 lg:w-max lg:px-8">Simpan</button>
                @endif
        </form>
    </div>
    <script>
        // Inisialisasi array carts dari data PHP
        let carts = {!! json_encode($carts) !!};    
    </script>
@endsection
