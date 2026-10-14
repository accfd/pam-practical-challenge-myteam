/// Model data untuk menampung entitas Pengalaman Mahasiswa (FR-05)
/// Bagian dari Data Layer dalam arsitektur MVVM (Modul 3 Slide 16-18)
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

  /// Factory constructor untuk memetakan data dari Map/JSON ke objek model (Modul 3 Slide 16)
  factory PengalamanModel.fromJson(Map<String, dynamic> json) {
    return PengalamanModel(
      namaKegiatan: json['namaKegiatan'] as String? ?? '',
      peran: json['peran'] as String? ?? '',
      tahun: json['tahun'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
    );
  }

  /// Mengonversi objek model menjadi Map/JSON (Modul 3 Slide 16)
  Map<String, dynamic> toJson() {
    return {
      'namaKegiatan': namaKegiatan,
      'peran': peran,
      'tahun': tahun,
      'deskripsi': deskripsi,
    };
  }
}