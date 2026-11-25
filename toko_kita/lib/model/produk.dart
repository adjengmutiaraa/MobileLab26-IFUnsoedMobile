class Produk {
  int? id;
  String? kodeProduk;
  String? namaProduk;
  int? hargaProduk;

  Produk({this.id, this.kodeProduk, this.namaProduk, this.hargaProduk});

  // API CodeIgniter mengirim id & harga sebagai string ("5700000"),
  // jadi dikonversi dulu ke int agar tidak error.
  factory Produk.fromJson(Map<String, dynamic> obj) {
    return Produk(
        id: int.tryParse(obj['id'].toString()),
        kodeProduk: obj['kode_produk'],
        namaProduk: obj['nama_produk'],
        hargaProduk: int.tryParse(obj['harga'].toString()));
  }
}
