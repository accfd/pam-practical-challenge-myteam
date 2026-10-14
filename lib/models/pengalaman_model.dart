// Model data entitas riwayat pengalaman mahasiswa (FR-05 Portofolio)
class PengalamanModel {
  final String namaKegiatan;
  final String peran;
  final String tahun;
  final String deskripsi;

  PengalamanModel({
    required this.namaKegiatan,
    required this.peran,
    required this.tahun,
    required this.deskripsi,
  });

  // Factory constructor: Mengonversi Map/JSON menjadi objek PengalamanModel
  factory PengalamanModel.fromJson(Map<String, dynamic> json) {
    return PengalamanModel(
      namaKegiatan: json['namaKegiatan'] as String? ?? '',
      peran: json['peran'] as String? ?? '',
      tahun: json['tahun'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
    );
  }

  // Serializer: Mengonversi objek ke format Map/JSON
  Map<String, dynamic> toJson() {
    return {
      'namaKegiatan': namaKegiatan,
      'peran': peran,
      'tahun': tahun,
      'deskripsi': deskripsi,
    };
  }
}