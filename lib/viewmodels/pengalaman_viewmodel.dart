import 'package:flutter/foundation.dart';
import '../models/pengalaman_model.dart';

/// ==============================================================================
/// LAPISAN: BUSINESS LOGIC LAYER (VIEWMODEL)
/// ==============================================================================
/// [Business Logic Layer / ViewModel]:
/// Lapisan perantara cerdas dalam arsitektur MVVM (Modul 3 Slide 18 & Section 3).
/// Tugas utamanya:
/// 1. Mengelola [State] (status dan kumpulan data aplikasi yang sedang aktif).
/// 2. Mengolah logika bisnis (menambah data, menyaring, dsb).
/// 3. Memegang aturan validasi data aplikasi.
///
/// Keuntungan memisahkan ViewModel dari View (Layar UI):
/// - Tampilan layar (View) menjadi bersih (hanya fokus menggambar antarmuka).
/// - Logika bisnis mudah diuji secara otomatis ([Unit-Testable]) tanpa perlu emulator.
///
/// [ChangeNotifier]:
/// Class bawaan resmi Flutter yang bekerja seperti "menara pemancar" atau "lonceng pengumuman"
/// (menerapkan pola desain Observer Pattern). Setiap kali data di ViewModel berubah,
/// kita cukup membunyikan lonceng (memanggil notifyListeners()), dan semua widget UI
/// yang terhubung akan otomatis mengetahui lalu memperbarui tampilannya.
///
/// Hal ini selaras dengan arahan Modul 4 Slide 10:
/// "Focus on local interactive state before introducing state-management packages"
/// (Memanfaatkan fitur asli bawaan Flutter tanpa ketergantungan library luar).
class PengalamanViewModel extends ChangeNotifier {
  /// [State Privat & Enkapsulasi (Encapsulation)]:
  /// Prinsip Pemrograman Berorientasi Objek (OOP) untuk menyembunyikan data internal
  /// dengan awalan garis bawah '_' (Modul 2 Slide 20).
  /// List ini disimpan di memori lokal RAM perangkat selama aplikasi aktif.
  /// Karena berstatus 'private', layar luar tidak bisa seenaknya mengubah data ini
  /// tanpa melalui method resmi yang kita sediakan.
  final List<PengalamanModel> _listPengalaman = [];

  /// [Unmodifiable List (Read-Only)]:
  /// Mengembalikan daftar yang "dikunci" agar hanya bisa dibaca (read-only) oleh pihak luar.
  /// Jika ada kode luar yang mencoba memanggil `_listPengalaman.add(...)` secara ilegal,
  /// sistem akan menolaknya. Ini menjamin keamanan integritas data aplikasi.
  List<PengalamanModel> get listPengalaman => List.unmodifiable(_listPengalaman);

  /// [Data Passing Preparation]:
  /// Getter pembantu untuk mengambil daftar nama kegiatan yang sudah terdaftar dalam bentuk
  /// huruf kecil (lowercase). Data ini nantinya dikirimkan (Forward Data Passing - Modul 4 Slide 28)
  /// ke layar form untuk keperluan validasi anti-duplikasi entri nama kegiatan.
  List<String> get daftarNamaKegiatan =>
      _listPengalaman.map((item) => item.namaKegiatan.toLowerCase().trim()).toList();

  /// Getter untuk mengecek kondisi kosong ([Empty State Evaluation]).
  /// Bernilai true jika belum ada satupun pengalaman yang tersimpan.
  bool get isEmpty => _listPengalaman.isEmpty;

  /// Getter untuk menghitung jumlah total riwayat pengalaman yang tersimpan di memori.
  int get totalPengalaman => _listPengalaman.length;

  /// [Aksi Bisnis: Tambah Pengalaman]:
  /// Menambahkan entitas objek PengalamanModel baru ke dalam state privat.
  void tambahPengalaman(PengalamanModel pengalaman) {
    _listPengalaman.add(pengalaman);

    /// [notifyListeners()]:
    /// Membunyikan "lonceng" notifikasi kepada semua widget UI yang sedang mendengarkan
    /// (seperti ListenableBuilder di layar utama).
    /// Begitu mendengar notifikasi ini, Flutter secara cerdas akan menggambar ulang (rebuild)
    /// tampilan antarmuka sehingga kartu pengalaman yang baru langsung muncul di layar.
    notifyListeners();
  }

  // ==============================================================================
  // ATURAN VALIDASI BISNIS (BUSINESS RULES VALIDATION - MODUL 3 SECTION 3)
  // ==============================================================================
  // Meletakkan fungsi validasi di dalam ViewModel (bukan di dalam widget tampilan)
  // membuat aturan bisnis berstatus [Unit-Testable], artinya dapat diuji kebenarannya
  // menggunakan file pengujian otomatis (automated unit test) tanpa perlu menjalankan emulator.

  /// [Validasi Nama Kegiatan]:
  /// Menerapkan 2 lapis aturan dasar:
  /// 1. Required (Wajib diisi): Tidak boleh bernilai null atau spasi kosong.
  /// 2. Min Length (Panjang Minimal): Minimal 3 karakter agar nama kegiatan bermakna.
  static String? validasiNamaKegiatan(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama kegiatan wajib diisi!';
    }
    if (value.trim().length < 3) {
      return 'Nama kegiatan minimal 3 karakter!';
    }
    return null; // Mengembalikan null berarti lolos validasi dasar
  }

  /// [Validasi Anti-Duplikasi Cerdas (Kombinasi Nama + Peran + Tahun)]:
  /// Menolak data jika dan hanya jika Nama Kegiatan, Peran, DAN Tahun ketiganya sama persis.
  /// Mengizinkan kegiatan yang sama asalkan peran atau tahunnya berbeda
  /// (contoh: "BEM KM UNAND" sebagai Staf Muda 2023 dan sebagai Menteri 2024 keduanya diizinkan).
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

  /// [Validasi Peran]:
  /// Aturan wajib diisi (Required) untuk memastikan posisi/peran mahasiswa jelas.
  static String? validasiPeran(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Peran wajib diisi!';
    }
    return null; // Valid
  }

  /// [Validasi Tahun Pelaksanaan]:
  /// Menerapkan validasi bertingkat ([Multi-Tier Validation]):
  /// 1. Keberadaan teks: Wajib diisi (tidak boleh kosong).
  /// 2. [Safe Numeric Parsing / tryParse]: Menguji apakah teks benar-benar angka bulat murni
  ///    tanpa memicu error/crash aplikasi jika pengguna mengetik huruf.
  /// 3. Logical Range (Rentang Logis): Angka tahun harus berada di antara 2000 hingga 2026
  ///    (menolak tahun yang mustahil seperti tahun 1800 atau tahun 2099).
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
