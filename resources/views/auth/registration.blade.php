@extends('layouts.auth')

@section('container')
<div class="bg-white w-full h-screen lg:w-max lg:h-max lg:rounded-lg lg:p-8">
    <div class="flex flex-col text-center justify-center items-center p-8">
        <img src="{{ asset('logo.png') }}" alt="SMPN 1 Banjarmasin" class="w-20 object-cover">
        <h5 class="text-2xl font-medium text-green-600">Daftar Koperasi</h5>
        <p>SMPN 1 Banjarmasin</p>
    </div>
    <hr>
    <form action="" class="px-8 flex flex-col gap-6 mt-8 lg:px-0" method="post">
        @method('post')
        @csrf
        <input type="email" name="email" id="email" class="w-full outline-none border-b focus:border-green-600" placeholder="Alamat Email">
        <input type="password" name="password" id="password" class="w-full outline-none border-b focus:border-green-600" placeholder="Kata Sandi">
        <input type="password" name="confirm" id="confirm" class="w-full outline-none border-b focus:border-green-600" placeholder="Konfirmasi Kata Sandi">
        <div class="flex justify-end">
            <button class="bg-green-600 text-white rounded-lg px-3 py-2 hover:bg-green-500 hover:duration-150">Daftar</button>
        </div>
    </form>
    <div class="w-full h-1/2 flex items-end justify-center lg:h-max lg:mt-8">
        <a href="/login" class="font-medium text-slate-400 hover:underline hover:duration-150">Masuk</a>
    </div>
</div>
@endsection
