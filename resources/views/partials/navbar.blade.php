<!-- Navbar for desktop view -->
<nav class="w-full h-max bg-white px-20 py-3 border-b shadow-sm hidden lg:block">
    <div class="flex flex-row justify-between items-center">
        <div class="flex flex-row items-center gap-3">
            <img src="{{ asset('logo.png') }}" alt="SMPN 1 Banjarmasin" class="w-12">
            <h5 class="font-medium">Koperasi SMP Negeri 1 Banjarmasin</h5>
        </div>
        <ul class="flex flex-row gap-8">
            <li>
                <a href="/" class="{{ $active == 'product' ? 'text-green-600' : '' }}">Produk</a>
            </li>
            @if(auth()->user()->user == 'admin')
            <li>
                <a href="/dashboard" class="{{ $active == 'dashboard' ? 'text-green-600' : '' }}">Halaman Admin</a>
            </li>
            @endif
            <li>
                <a href="/carts" class="{{ $active == 'cart' ? 'text-green-600' : '' }}">Keranjang</a>
            </li>
            <li>
                <a href="#contact" class="{{ $active == 'contact' ? 'text-green-600' : '' }}">Kontak</a>
            </li>
            <li>
                <a href="/logout" class="text-red-500 border border-red-500 px-3 py-2 rounded-lg hover:bg-red-500 hover:text-white hover:duration-150">Keluar</a>
            </li>
        </ul>
    </div>
</nav>
