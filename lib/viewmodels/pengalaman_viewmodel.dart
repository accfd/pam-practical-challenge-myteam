import 'package:flutter/foundation.dart';
import '../models/pengalaman_model.dart';

/// ViewModel untuk mengelola state dan logika bisnis fitur Pengalaman Mahasiswa.
/// Mengimplementasikan pola arsitektur MVVM (Modul 3 Slide 18).
/// Menggunakan ChangeNotifier murni bawaan Flutter tanpa package eksternal (Modul 4 Slide 10).
class PengalamanViewModel extends ChangeNotifier {
  // State privat: daftar pengalaman mahasiswa
  final List<PengalamanModel> _listPengalaman = [];

  // Getter unmodifiable untuk melindungi state dari manipulasi langsung dari luar
  List<PengalamanModel> get listPengalaman => List.unmodifiable(_listPengalaman);

  // Getter pembantu untuk pengecekan kondisi UI
  bool get isEmpty => _listPengalaman.isEmpty;
  int get totalPengalaman => _listPengalaman.length;

  /// Aksi bisnis: Menambahkan pengalaman baru ke state dan memicu notifikasi ke View
  void tambahPengalaman(PengalamanModel pengalaman) {
    _listPengalaman.add(pengalaman);
    // Memberitahu UI (View) agar melakukan rebuild dengan data terbaru
    notifyListeners();
  }
}
