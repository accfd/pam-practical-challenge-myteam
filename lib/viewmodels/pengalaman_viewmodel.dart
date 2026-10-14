import 'package:flutter/foundation.dart';
import '../models/pengalaman_model.dart';

/// ==============================================================================
/// LAPISAN: BUSINESS LOGIC LAYER (VIEWMODEL)
/// ==============================================================================
/// Mengelola state riwayat pengalaman, logika bisnis, dan aturan validasi aplikasi.
/// Sesuai pola arsitektur MVVM (Modul 3 Slide 18 & Section 3: "Tugas: Mengelola state, memfilter data, validasi alur").
///
/// Menerapkan ChangeNotifier murni bawaan Flutter tanpa package eksternal,
/// selaras dengan arahan Modul 4 Slide 10: "focus on local interactive state before introducing state-management packages".
class PengalamanViewModel extends ChangeNotifier {
  // State Privat: Menampung kumpulan data pengalaman di memori lokal (Enkapsulasi OOP - Modul 2 Slide 20)
  final List<PengalamanModel> _listPengalaman = [];

  /// Getter List yang bersifat Unmodifiable (Read-Only) dari luar class.
  /// Mencegah manipulasi state langsung tanpa melalui method resmi ViewModel.
  List<PengalamanModel> get listPengalaman => List.unmodifiable(_listPengalaman);

  /// Getter daftar nama kegiatan (lowercase) untuk diteruskan ke layar form (Modul 4 Slide 28: Data Passing)
  /// Digunakan oleh form untuk memvalidasi agar tidak terjadi duplikasi entri data.
  List<String> get daftarNamaKegiatan =>
      _listPengalaman.map((item) => item.namaKegiatan.toLowerCase().trim()).toList();

  /// Getter pembantu untuk memeriksa apakah data masih kosong (Empty State evaluation)
  bool get isEmpty => _listPengalaman.isEmpty;

  /// Getter untuk menghitung total pengalaman yang telah tersimpan
  int get totalPengalaman => _listPengalaman.length;

  /// Aksi Bisnis: Menambahkan data pengalaman baru ke dalam state.
  /// Memanggil notifyListeners() untuk mengumumkan perubahan data ke View (UI).
  void tambahPengalaman(PengalamanModel pengalaman) {
    _listPengalaman.add(pengalaman);

    // Memberitahu seluruh widget pendengar (ListenableBuilder) agar merender ulang UI (Modul 4 Slide 10-11)
    notifyListeners();
  }

  // ==============================================================================
  // ATURAN VALIDASI BISNIS (BUSINESS RULES VALIDATION - MODUL 3 SECTION 3)
  // ==============================================================================
  // Menempatkan fungsi aturan validasi di ViewModel memisahkan logika dari widget UI,
  // sehingga aturan bisnis dapat diuji secara mandiri (unit-testable) tanpa ketergantungan UI.

  /// Validasi Aturan Nama Kegiatan: Wajib diisi, minimal 3 karakter, dan anti-duplikasi.
  static String? validasiNamaKegiatan(String? value, {List<String> terdaftar = const []}) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama kegiatan wajib diisi!';
    }
    if (value.trim().length < 3) {
      return 'Nama kegiatan minimal 3 karakter!';
    }
    final namaKecil = value.trim().toLowerCase();
    if (terdaftar.contains(namaKecil)) {
      return 'Kegiatan "$value" sudah terdaftar di portofolio!';
    }
    return null; // Valid
  }

  /// Validasi Aturan Peran: Wajib diisi (Required).
  static String? validasiPeran(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Peran wajib diisi!';
    }
    return null; // Valid
  }

  /// Validasi Aturan Tahun: Wajib diisi, format integer numerik, rentang logis 2000-2026.
  static String? validasiTahun(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Tahun wajib diisi!';
    }
    final int? tahun = int.tryParse(value.trim());
    if (tahun == null) {
      return 'Tahun harus berupa angka valid!';
    }
    if (tahun < 2000 || tahun > 2026) {
      return 'Masukkan tahun antara 2000 - 2026!';
    }
    return null; // Valid
  }
}
