@extends('layouts.auth')

@section('container')
<div class="bg-white w-full h-screen lg:w-max lg:h-max lg:rounded-lg lg:p-8">
<div class="flex flex-col text-center justify-center items-center p-8">
    <img src="{{ asset('logo.png') }}" alt="SMPN 1 Banjarmasin" class="w-20 object-cover">
        <h5 class="text-2xl font-medium text-green-600">Login Koperasi</h5>
        <p>SMPN 1 Banjarmasin</p>
    </div>
    <hr>
    @if(session('success'))
        <p class="text-green-600">{{ session('success') }}</p>
    @endif
    @if(session('loginError'))
        <p class="text-red-500">{{ session('loginError') }}</p>
    @endif
    <form action="" href="/beranda" class="px-8 flex flex-col gap-6 mt-8 lg:px-0" method="post">
        @method('post')
        @csrf
        <input type="email" name="email" id="email" class="w-full outline-none border-b focus:border-green-600" placeholder="Alamat Email">
        <input type="password" name="password" id="password" class="w-full outline-none border-b focus:border-green-600" placeholder="Kata Sandi">
        <div class="flex justify-end">
            <button class="bg-green-600 text-white rounded-lg px-3 py-2 hover:bg-green-500 hover:duration-150">Masuk</button>
        </div>
        <div class="kembali w-full h-1/2 flex items-end justify-center lg:h-max lg:mt-8">
            <a href="http://127.0.0.1:8000" class="text-green-500 border border-green-500 px-20  py-2 rounded-lg hover:bg-green-500 hover:text-white hover:duration-150"><i class="fa-solid fa-arrow-left"></i> Kembali </a>
        </div>
    </form>

</div>
@endsection
