<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Nota</title>
    <style>
        table,
        th,
        td {
            border: 1px solid #222;
            border-collapse: collapse;
        }

        tfoot {
            font-weight: bold;
            text-align: center
        }
    </style>
</head>

<body onload="window.print()">
    <table>
        <thead>
            <tr>
                <th colspan="4">{{ $note->nama }}</th>
            </tr>
        </thead>
        <thead>
            <tr>
                <th>ID</th>
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

</body>

</html>
