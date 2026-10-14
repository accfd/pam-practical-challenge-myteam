import 'package:flutter/foundation.dart';
import '../models/pengalaman_model.dart';

/// ==============================================================================
/// LAPISAN: BUSINESS LOGIC LAYER (VIEWMODEL)
/// ==============================================================================
/// Mengelola state riwayat pengalaman dan mengoordinasikan aksi bisnis aplikasi.
/// Sesuai pola arsitektur MVVM (Modul 3 Slide 18: ViewModel manages UI-related state & coordinates actions).
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
}
