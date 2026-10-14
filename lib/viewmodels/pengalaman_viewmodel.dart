import 'package:flutter/foundation.dart';
import '../models/pengalaman_model.dart';

/// ViewModel untuk mengelola state riwayat pengalaman dan logika validasi (MVVM)
class PengalamanViewModel extends ChangeNotifier {
  // State privat kumpulan pengalaman di memori lokal
  final List<PengalamanModel> _listPengalaman = [];

  /// Getter data pengalaman berstatus Read-Only
  List<PengalamanModel> get listPengalaman => List.unmodifiable(_listPengalaman);

  /// Getter daftar nama kegiatan (lowercase)
  List<String> get daftarNamaKegiatan =>
      _listPengalaman.map((item) => item.namaKegiatan.toLowerCase().trim()).toList();

  /// Pemeriksa kondisi data kosong
  bool get isEmpty => _listPengalaman.isEmpty;

  /// Total pengalaman tersimpan
  int get totalPengalaman => _listPengalaman.length;

  /// Menambahkan pengalaman baru dan memberitahu UI listener untuk rebuild
  void tambahPengalaman(PengalamanModel pengalaman) {
    _listPengalaman.add(pengalaman);
    notifyListeners();
  }

  // ==============================================================================
  // ATURAN VALIDASI BISNIS (UNIT-TESTABLE)
  // ==============================================================================

  /// Validasi nama kegiatan: Wajib diisi & minimal 3 karakter
  static String? validasiNamaKegiatan(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama kegiatan wajib diisi!';
    }
    if (value.trim().length < 3) {
      return 'Nama kegiatan minimal 3 karakter!';
    }
    return null;
  }

  /// Validasi anti-duplikasi cerdas: Menolak jika nama, peran, dan tahun ketiganya sama persis
  static bool isDuplikatKombinasi({
    required String nama,
    required String peran,
    required String tahun,
    required List<PengalamanModel> terdaftar,
  }) {
    final n = nama.trim().toLowerCase();
    final p = peran.trim().toLowerCase();
    final t = tahun.trim();
    return terdaftar.any((item) =>
        item.namaKegiatan.trim().toLowerCase() == n &&
        item.peran.trim().toLowerCase() == p &&
        item.tahun.trim() == t);
  }

  /// Validasi peran: Wajib diisi
  static String? validasiPeran(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Peran wajib diisi!';
    }
    return null;
  }

  /// Validasi tahun: Wajib diisi, angka valid, dan rentang 2000-2026
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
    return null;
  }
}
