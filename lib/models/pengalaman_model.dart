/// ==============================================================================
/// LAPISAN: DATA LAYER (MODEL)
/// ==============================================================================
/// Merepresentasikan entitas data murni "Pengalaman Mahasiswa" (FR-05 Portofolio).
/// Menerapkan konsep OOP Dart, immutability, dan sound null safety (Modul 2 Slide 8-19).
/// Sesuai pola arsitektur MVVM (Modul 3 Slide 18: Model represents application data).
class PengalamanModel {
  // Properti bertipe data tegas (Strongly-Typed) dan 'final' untuk menjamin immutability
  final String namaKegiatan;
  final String peran;
  final String tahun;
  final String deskripsi;

  /// Named Constructor: Memudahkan instansiasi objek dengan parameter yang jelas (Modul 2 Slide 17 & 19)
  PengalamanModel({
    required this.namaKegiatan,
    required this.peran,
    required this.tahun,
    required this.deskripsi,
  });

  /// Factory Constructor: Mengonversi data Map/JSON menjadi objek Dart strongly-typed (Modul 3 Slide 16).
  /// Mencegah runtime error akibat akses key Map mentah yang salah ketik.
  factory PengalamanModel.fromJson(Map<String, dynamic> json) {
    return PengalamanModel(
      namaKegiatan: json['namaKegiatan'] as String? ?? '',
      peran: json['peran'] as String? ?? '',
      tahun: json['tahun'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
    );
  }

  /// Serializer: Mengonversi objek model kembali ke format Map/JSON (Modul 3 Slide 16)
  /// Berguna saat data perlu dikirim ke Web Service API atau disimpan ke local storage.
  Map<String, dynamic> toJson() {
    return {
      'namaKegiatan': namaKegiatan,
      'peran': peran,
      'tahun': tahun,
      'deskripsi': deskripsi,
    };
  }
}