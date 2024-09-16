<!-- Sidebar for mobile view -->
<nav class="bg-white w-full h-max px-6 py-3 border-b shadow-sm lg:hidden sticky top-0 mb-10">
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
                <a href="/beranda" class="w-full flex px-3 py-2 rounded-lg {{ $active == 'product' ? 'bg-slate-200' : 'text-slate-500' }}">Produk</a>
            </li>
            
                <li>
            @if(auth()->user()->user == 'admindata')
                    <li>
                        <a href="/dashboard" class="w-full flex px-3 py-2 rounded-lg {{ $active == 'dashboard' ? 'bg-slate-200' : 'text-slate-500' }}">Halaman Admin</a>
                    </li>
            @endif
            @if(auth()->user()->user == 'admincetak')
                    <li>
                        <a href="/carts" class="w-full flex px-3 py-2 rounded-lg {{ $active == 'cart' ? 'bg-slate-200' : 'text-slate-500' }}">Keranjang</a>
                    </li>
                    <li>
                        <a href="/history" class="w-full flex px-3 py-2 rounded-lg {{ $active == 'history' ? 'text-green-600' : '' }}">History</a>
                    </li>
            @endif
                </li>
                
            
        </ul>
    </div>
    <div class="w-full h-3/4 flex justify-end items-end">
        <a href="/logout" class="w-full text-center text-red-500 rounded-lg border border-red-500 py-2 mb-3 hover:bg-red-500 hover:text-white hover:duration-150">Keluar</a>
    </div>
</div>
