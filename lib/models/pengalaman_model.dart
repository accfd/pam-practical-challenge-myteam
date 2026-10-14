/// ==============================================================================
/// LAPISAN: DATA LAYER (MODEL)
/// ==============================================================================
/// [Data Layer / Model]:
/// Lapisan dalam arsitektur perangkat lunak yang bertugas murni mendefinisikan
/// bentuk dan struktur data bisnis (di sini: data "Pengalaman Mahasiswa"),
/// tanpa tercampur kode tampilan visual (UI) atau logika tombol.
/// Sesuai pola MVVM (Modul 3 Slide 18: "Model represents application data").
///
/// Menerapkan konsep OOP Dart, immutability, dan sound null safety (Modul 2 Slide 8-19).
class PengalamanModel {
  /// [Strongly-Typed]:
  /// Penentuan tipe data secara pasti dan ketat (di sini menggunakan tipe data 'String').
  /// Tujuannya agar compiler dapat langsung menemukan kesalahan (type error) saat kode
  /// sedang ditulis (Compile Time), bukan saat aplikasi sudah berjalan (Runtime).
  ///
  /// [Immutability]:
  /// Sifat objek yang nilainya "tetap / tidak dapat diubah lagi" setelah pertama kali dibuat.
  /// Di Dart, immutability diwujudkan dengan kata kunci 'final'.
  /// Mengapa ini penting?
  /// 1. Mencegah data diubah secara tidak sengaja oleh proses lain di latar belakang.
  /// 2. Menghindari 'bug' yang sulit dilacak akibat perubahan nilai variabel liar.
  /// 3. Jika data ingin diubah, cara yang benar adalah membuat objek baru dengan data baru.
  final String namaKegiatan;
  final String peran;
  final String tahun;
  final String deskripsi;

  /// [Named Constructor]:
  /// Cara pembuatan (instansiasi) objek dengan menyebutkan nama parameternya secara eksplisit
  /// (contoh: PengalamanModel(namaKegiatan: 'PIMNAS', peran: 'Ketua', ...)).
  /// Keunggulannya:
  /// - Nilai parameter tidak akan tertukar meskipun urutan penulisannya terbalik.
  /// - Kata kunci 'required' menjamin [Sound Null Safety], yaitu memastikan bahwa properti
  ///   wajib diisi dan tidak boleh dibiarkan kosong (null) yang bisa menyebabkan aplikasi crash.
  PengalamanModel({
    required this.namaKegiatan,
    required this.peran,
    required this.tahun,
    required this.deskripsi,
  });

  /// [Factory Constructor]:
  /// Konstruktor khusus di Dart yang fleksibel. Berbeda dari konstruktor biasa yang langsung
  /// mengalokasikan memori baru, factory constructor dapat memproses logika tertentu terlebih dahulu
  /// (seperti membedah data mentah atau memberikan nilai cadangan/fallback) sebelum mengembalikan objek.
  ///
  /// Di sini digunakan untuk [Deserialization] (Modul 3 Slide 16):
  /// Mengubah data mentah berformat Map / JSON (biasanya didapat dari internet/database)
  /// menjadi objek Dart yang aman (Strongly-Typed) agar terhindar dari salah ketik nama kolom.
  factory PengalamanModel.fromJson(Map<String, dynamic> json) {
    return PengalamanModel(
      namaKegiatan: json['namaKegiatan'] as String? ?? '',
      peran: json['peran'] as String? ?? '',
      tahun: json['tahun'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
    );
  }

  /// [Serializer / toJson]:
  /// Fungsi "penerjemah balik" (Modul 3 Slide 16):
  /// Mengubah objek PengalamanModel yang ada di memori aplikasi kembali menjadi struktur
  /// data umum berformat Map (pasangan key-value) / JSON.
  /// Tujuannya: Agar data riwayat pengalaman siap dikirim ke Web Service API (internet)
  /// atau disimpan secara permanen ke local storage HP.
  Map<String, dynamic> toJson() {
    return {
      'namaKegiatan': namaKegiatan,
      'peran': peran,
      'tahun': tahun,
      'deskripsi': deskripsi,
    };
  }
}