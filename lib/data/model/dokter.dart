class Dokter {
  num id;
  String nama;
  String jenis;
  String tanggal;
  String jadwal;
  String? jarak;

  Dokter({
    required this.id,
    required this.nama,
    required this.jenis,
    required this.tanggal,
    required this.jadwal,
    this.jarak,
  });

  factory Dokter.fromJson(Map<String, dynamic> json) => Dokter(
        id: json["id"] as num,
        nama: json["nama"] as String,
        jenis: json["jenis"] as String,
        tanggal: json["tanggal"] as String,
        jadwal: json["jadwal"] as String,
        jarak: json["jarak"] as String?,
      );
}
