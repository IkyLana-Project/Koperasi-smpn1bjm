@extends('layouts.main')

@section('container')

    <div class="bg-white w-full h-max lg:rounded-xl shadow-sm p-4 lg:p-8">
        
        <div class="w-full gap-3 flex flex-row">
            <h5 class="text-xl font-medium w-full">Histori Pembelian</h5>
            <div class="container">
                <form action="/filter" method="GET">
                    <div class="pb-3 flex flex-row w-full">
                        <div class="p-2 border border-green-600" style="border-radius: 15px; ">
                            <label class="text-green-600"> Start Date: </label>
                            <input type="date" name="start_date" >
                        </div>
                        <div class="ml-5 p-2 border border-green-600" style="border-radius: 15px; color:white; margin-right: 3px;">
                            <label class="text-green-600"> End Date: </label>
                            <input type="date" name="end_date" style="color: black;">
                        </div>
                    </div>
                    <div class="p-2 bg-green-600 hover:bg-green-500  text-white font-semibold text-center w-32" style="font-size: 16px; border-radius: 15px;">
                        <button type="submit" class="text"><i class="fa-solid fa-filter pt-2"></i> Filter</button>
                    </div>
                </form>
            </div>
        </div>
        <table class="mt-5 border-collapse border border-black w-full">
            <thead>
                <tr style="background-color:rgba(21, 161, 63, 0.788); color: white;">
                    <th class="border border-black ...">Nama Pembeli</th>
                    <th class="border border-black ...">Nama Barang</th>
                    <th class="border border-black ...">Total Harga</th>
                    <th class="border border-black ...">Tanggal Pembelian</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data_transaksi as $item)
                <tr class="border border-black ..." style="text-align: center">
                    <td class="border border-black ..." width="30%">{{ $item['nama'] }}</td>
                    <td class="border border-black ..." width="40%">{{ $item['barang_satuan'] }}</td>
                    <td class="border border-black ..." width="15%">Rp.{{ $item['total_harga_keseluruhan'] }}</td>
                    <td class="border border-black ..." width="15%">{{ $item['updated_at'] }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    
@endsection
