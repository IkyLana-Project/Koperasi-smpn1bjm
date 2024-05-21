// Inisialisasi variabel total harga semua barang
let totalHargaSemuaBarang = 0;

// Mendapatkan jumlah produk dari panjang array carts
let jumlahProduk = carts.length;

// Fungsi untuk menghitung total harga setiap barang
function totalHarga(index) {
    let jumlahBarang = parseFloat(document.getElementById('jumlah_barang_' + index).value);
    let hargaSatuan = parseFloat(document.getElementById('harga_satuan_' + index).value);
    let total = jumlahBarang * hargaSatuan;
    document.getElementById('total_harga_' + index).value = total;

    // Panggil fungsi untuk menghitung total harga semua barang setiap kali ada perubahan
    hitungTotalHargaSemuaBarang();
}

// Fungsi untuk menghitung total harga semua barang
function hitungTotalHargaSemuaBarang() {
    totalHargaSemuaBarang = 0; // Reset nilai total harga semua barang
    // Loop melalui setiap barang untuk menghitung total harga
    for (let i = 0; i < jumlahProduk; i++) {
        let jumlahBarang = parseFloat(document.getElementById('jumlah_barang_' + i).value);
        let hargaSatuan = parseFloat(document.getElementById('harga_satuan_' + i).value);
        totalHargaSemuaBarang += jumlahBarang * hargaSatuan;
    }

    // Tampilkan total harga semua barang di elemen HTML
    // console.log(totalHargaSemuaBarang)
    document.getElementById('total_harga_keseluruhan').value = totalHargaSemuaBarang
    document.getElementById('total_harga_semua_barang').textContent = totalHargaSemuaBarang.toFixed(2); // Menampilkan total dengan dua desimal
}
