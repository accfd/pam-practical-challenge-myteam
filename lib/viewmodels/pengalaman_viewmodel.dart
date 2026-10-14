import 'package:flutter/foundation.dart';
import '../models/pengalaman_model.dart';

// ViewModel: Mengelola state riwayat pengalaman dan logika bisnis validasi (MVVM)
class PengalamanViewModel extends ChangeNotifier {
  // State privat: Data riwayat pengalaman yang tersimpan di memori
  final List<PengalamanModel> _listPengalaman = [];

  // Getter list bersifat read-only untuk menjaga integritas data
  List<PengalamanModel> get listPengalaman => List.unmodifiable(_listPengalaman);

  // Getter pembantu status data
  bool get isEmpty => _listPengalaman.isEmpty;
  int get totalPengalaman => _listPengalaman.length;

  // Aksi menambah pengalaman baru dan memberitahu UI untuk rebuild
  void tambahPengalaman(PengalamanModel pengalaman) {
    _listPengalaman.add(pengalaman);
    notifyListeners();
  }

  // --- ATURAN VALIDASI BISNIS (UNIT-TESTABLE) ---

  // Validasi nama kegiatan: Wajib diisi dan minimal 3 karakter
  static String? validasiNamaKegiatan(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama kegiatan wajib diisi!';
    }
    if (value.trim().length < 3) {
      return 'Nama kegiatan minimal 3 karakter!';
    }
    return null;
  }

  // Validasi peran: Wajib diisi
  static String? validasiPeran(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Peran wajib diisi!';
    }
    return null;
  }

  // Validasi tahun: Wajib diisi, format angka valid, dan rentang 2000-2026
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

  // Anti-duplikasi cerdas: Menolak hanya jika nama, peran, dan tahun sama persis
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
}
