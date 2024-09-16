<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{ $title }}</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  @vite('resources/css/app.css')
  
  {{-- <link rel="stylesheet" href="{{ asset('build/assets/app-CiQlHYby.css') }}"> --}}
</head>
<body class="bg-slate-100">
  <div id="overlay" class="fixed inset-0 bg-black opacity-50 hidden"></div>
  <!-- Navbar for desktop view -->
<nav class="w-full h-max bg-white px-20 py-3 border-b shadow-sm hidden lg:block sticky top-0">
    <div class="flex flex-row justify-between items-center">
        <div class="flex flex-row items-center gap-3">
            <img src="{{ asset('logo.png') }}" alt="SMPN 1 Banjarmasin" class="w-12">
            <h5 class="font-medium">Koperasi SMP Negeri 1 Banjarmasin</h5>
        </div>
        <ul class="flex flex-row gap-8">
            <li>
                <a href="/" class="{{ $active == 'product' ? 'text-green-600' : '' }}">Produk</a>
            </li>
            <li>
                <a href="/login" class="text-green-500 border border-green-500 px-3 py-2 rounded-lg hover:bg-green-500 hover:text-white hover:duration-150">Kunci Admin</a>
            </li>
        </ul>
    </div>
</nav>


<!-- Sidebar for mobile view -->
<nav class="bg-white w-full h-max px-6 py-3 border-b shadow-sm lg:hidden sticky top-0">
    <div>
        <button class="text-2xl" onclick="toggleSidebar()"><i class="fa-solid fa-bars"></i></button>
    </div>
</nav>

<div id="sidebar" class="bg-white w-2/3 h-screen fixed top-0 p-4 hidden flex-col">
    <div class="flex flex-row justify-between">
        <div class="flex items-center gap-2">
            <img src="{{ asset('logo.png') }}" alt="SMPN 1 Banjarmasin" class="w-8 object-cover">
            <h6 class="text-xl font-medium">Koperasi SMPN 1 BJM</h6>
        </div>
        <div>
            <button onclick="closeSidebar()" class="font-medium bg-slate-100 w-max h-max px-3 py-1 rounded-full">X</button>
        </div>
    </div>
    <div class="mt-8 w-full flex flex-col">
        <span class="font-bold text-slate-400 text-lg">Pilihan</span>
        <ul class="mt-4 w-full px-3 flex flex-col">
            <li>
                <a href="/" class="w-full flex px-3 py-2 rounded-lg {{ $active == 'product' ? 'bg-slate-200' : 'text-slate-500' }}">Produk</a>
            </li>
        </ul>
    </div>
    <div class="w-full h-3/4 flex justify-end items-end">
        <a href="/logout" class="w-full text-center text-green-500 rounded-lg border border-green-500 py-2 mb-3 hover:bg-green-500 hover:text-white hover:duration-150">Kunci Admin</a>
    </div>
</div>

  <div class="w-full min-h-screen py-10 lg:px-20 lg:py-10">
    <div class="bg-white w-full h-max lg:rounded-xl shadow-sm p-4 lg:p-8">
        <h5 class="text-xl font-medium">Produk Koperasi</h5>
        <div class="w-full gap-3 flex flex-row">
            <form action="" class="w-1/2 mt-4 flex flex-row">
                <input type="text" id="barang" name="barang" placeholder="Cari Barang..." class="w-full border px-3 py-2 border-green-600 rounded-l-lg outline-none placeholder:text-green-600">
                <button class="bg-green-600 rounded-r-lg px-3 py-2 text-white hover:bg-green-500 hover:duration-150"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <form action="" class="w-1/2 mt-4 flex flex-row">
                <select id="type" name="type" class="w-full border px-3 py-2 border-green-600 rounded-l-lg outline-none placeholder:text-green-600">
                    <option value="">Semua</option>
                    @foreach ($types as $type)
                    <option value="{{ $type->type }}">{{ $type->type }}</option>
                    @endforeach
                </select>
                <button class="bg-green-600 rounded-r-lg px-3 py-2 text-white hover:bg-green-500 hover:duration-150"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
        @if(session('cartSuccess'))
            <p class="text-green-500 mt-5 font-bold">{{ session('cartSuccess') }}</p>
        @endif
        <div class="mt-8 grid grid-cols-2 lg:grid-cols-4 xl:grid-cols-6 gap-6">
            @foreach ($products as $product)
            <div class="bg-white border-green-600 w-full h-max p-3 border rounded-lg shadow-md">
                <div class="flex justify-center">
                    <img src="{{ asset('storage/'.$product->gambar) }}" alt="{{ $product->barang }}" class="w-32 h-32 object-cover">
                </div>
                <div class="flex flex-row justify-between w-full">
                    <div class="flex flex-col">
                        <div>
                            <h6 class="font-medium w-36">{{ $product->barang }}</h6>
                            <p>@currency($product->harga)</p>
                            <p class="text-slate-400 text-sm">Stok: {{ $product->stok }}</p>
                        </div>
                    </div>
                    <div class="flex flex-col justify-end">
                        <form action="/cart" method="post">
                            @if ( $product->stok < 1)
                                <b class=" text-red-500 px-3 rounded-lg bg-red-100 text-center p-1 -ml-16">Habis</b>
                            @endif
                            @if ( $product->stok >= 1 )
                                @csrf
                                @method('post')
                                <input type="hidden" name="product_id" value="{{ $product->id }}">
                                <button class="-ml-6">🛒</button>
                            @endif
                        </form>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>

</div>

<footer id="contact" class="bg-white w-full h-max shadow-sm p-6">
    <div class="flex justify-center">
        <img src="{{ asset('logo.png') }}" alt="SMPN 1 Banjarmasin" class="w-10 object-cover mb-2">
    </div>
    <h6 class="font-medium text-xs text-slate-400 text-center">Copyright © Koperasi Online SMP Negeri 1 Banjarmasin. </h6>
    <div class="mt-8 font-medium text-xs text-slate-400 text-center">
        <p>Contact Developer</p>
        <ul>
            <li>
                <a class="text-sky-500" href="https://www.instagram.com/fherikyy" target="_blank">Instagram</a>
            </li>
        </ul>
    </div>
</footer>

   <script src="{{ asset('build/assets/app-D2jpX1vH.js') }}"></script>
   <script src="{{ asset('js/sidebar.js') }}"></script>
   <script src="{{ asset('js/cart.js') }}"></script>
</body>
</html>
