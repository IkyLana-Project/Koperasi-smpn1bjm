<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Nota</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .kembali{
            margin-top: 50px;
        }

        a:hover{
            padding: 15px 25px;
            transition-duration: 0.5s;
        }

        a {
            text-decoration: none;
            color: white;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
            font-size: 12px;
            background-color: rgb(9, 185, 9);
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
        }

        table,
        th,
        td {
            border: 1px solid #222;
            border-collapse: collapse;
            text-align: center;
            font-size: 11px;
            padding: 3px;
        }

        tfoot {
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body onload="window.print()" >
    <table class="mb-4">
        <thead>
            <tr>
                <th colspan="4">{{ $note->nama }}</th>
            </tr>
        </thead>
        <thead>
            <tr>
                <th>No</th>
                <th>Barang</th>
                <th>Jumlah Barang</th>
                <th>Total Harga</th>
            </tr>
        </thead>
        <tbody>
            @foreach (json_decode($note->barang_satuan, true) as $index => $barang)
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ $barang }}</td>
                    <td>{{ json_decode($note->jumlah_barang, true)[$index] }}</td>
                    <td>{{ json_decode($note->total_harga, true)[$index] }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4">Total: {{ $note->total_harga_keseluruhan }}</td>
            </tr>
        </tfoot>
    </table>
    <div class="kembali">
        <a href="/beranda" class="border border-blue-500 rounded-lg text-white text-center w-full hover:bg-blue-500 hover:text-white hover:duration-150"><i class="fa-solid fa-arrow-left"></i> Kembali </a>
    </div>
</body>
</html>
