@extends('layouts.main')

@section('container')
    <div class="w-full h-max bg-white p-4 lg:rounded-lg">
        <h6 class="text-xl font-medium">Tambahkan Kategori</h6>
        @if (session('success'))
            <p class="text-green-600">{{ session('success') }}</p>
        @endif
        <form action="" method="post" class="flex flex-col gap-4 mt-6" enctype="multipart/form-data">
            @method('post')
            @csrf
            <div class="flex flex-col">
                <label for="type">Masukkan Kategori</label>
                <input type="text" id="type" name="type" placeholder="Kategori"
                    class="w-full border px-3 py-2 rounded-lg outline-none focus:border-green-600">
            </div>
            <div class="flex justify-end">
                <button type="submit"
                    class="bg-green-600 hover:bg-green-400 hover:duration-150 text-white rounded-lg px-3 py-2">Simpan</button>
            </div>
        </form>
    </div>
    <div class="w-full h-max bg-white p-4 lg:rounded-lg">
        <div class="overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50  dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-6 py-3">
                            Nama Kategori Produk
                        </th>
                        <th scope="col" class="px-6 py-3">
                            <span class="sr-only"></span>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($types as $type)                        
                    <tr
                        class="bg-white border-b hover:bg-gray-50 ">
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap">
                            {{ $type->type }}
                        </th>
                        <td class="px-6 py-4 text-right" >
                            <form action="/types/{{ $type->id }}" method="post">
                                @method('delete')
                                @csrf
                                <button type="submit" class="font-medium text-red-500 hover:underline" onclick="return confirm('yakin mau hapus data ini?')">Hapus</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection
