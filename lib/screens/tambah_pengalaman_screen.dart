import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import '../viewmodels/pengalaman_viewmodel.dart';

/// ==============================================================================
/// LAPISAN: PRESENTATION LAYER (VIEW 2 - FORM TAMBAH PENGALAMAN)
/// ==============================================================================
/// [Presentation Layer / View 2]:
/// Layar form interaktif yang bertugas menangkap input data riwayat kegiatan mahasiswa.
/// Mengimplementasikan alur lengkap:
/// 1. [Forward Data Passing]: Menerima data daftar nama kegiatan dari layar awal.
/// 2. [Multi-Tier Validation]: Pengecekan input berlapis (Required, Min Length, Valid Number, Anti-Duplikasi).
/// 3. [Feedback Multi-Status]: Status Gagal (Border Merah), Proses (Spinner Loading), dan Sukses (Modal Dialog).
/// 4. [Backward Result Passing]: Mengembalikan objek data baru ke layar utama.
class TambahPengalamanScreen extends StatefulWidget {
  /// [Forward Data Passing (Data Diterima dari Screen Sebelumnya - Modul 4 Slide 28)]:
  /// Menerima kumpulan objek pengalaman yang sudah terdaftar di memori portofolio mahasiswa.
  /// Data ini diteruskan ke ViewModel untuk validasi anti-duplikasi cerdas (kombinasi nama + peran + tahun).
  final List<PengalamanModel> pengalamanTerdaftar;

  const TambahPengalamanScreen({
    super.key,
    this.pengalamanTerdaftar = const [],
  });

  @override
  State<TambahPengalamanScreen> createState() => _TambahPengalamanScreenState();
}

class _TambahPengalamanScreenState extends State<TambahPengalamanScreen> {
  /// [GlobalKey<FormState>]:
  /// Kunci identitas unik global bawaan Flutter (Modul 4 Slide 16) yang bertindak
  /// sebagai "remote control" untuk mengendalikan widget Form.
  /// Melalui kunci ini, kita dapat memicu pemeriksaan validasi ke seluruh kolom teks
  /// sekaligus secara serentak hanya dengan satu baris kode: `_formKey.currentState!.validate()`.
  final _formKey = GlobalKey<FormState>();

  /// [TextEditingController]:
  /// Objek pengontrol kolom teks (Modul 4 Slide 8) yang bertugas membaca teks
  /// yang sedang diketik oleh pengguna, mendengarkan perubahan ketikan,
  /// dan memanipulasi isi field formulir.
  final _namaController = TextEditingController();
  final _peranController = TextEditingController();
  final _tahunController = TextEditingController();
  final _deskripsiController = TextEditingController();

  /// [Loading State (Status Sedang Memproses) - Modul 4 Slide 20]:
  /// Variabel boolean pengontrol status pemrosesan data.
  /// - Bernilai false: Form aktif dan siap menerima ketikan.
  /// - Bernilai true: Sistem sedang menyimpan data; tombol berubah menampilkan animasi
  ///   lingkaran berputar (CircularProgressIndicator) dan input dinonaktifkan sementara
  ///   agar pengguna tidak menekan tombol berkali-kali secara tidak sengaja (anti double-submit).
  bool _isLoading = false;

  @override
  void dispose() {
    /// [Pembersihan Memori / Memory Leak Prevention - Modul 4 Slide 8]:
    /// Seluruh TextEditingController WAJIB dihancurkan (dispose) saat layar form ditutup.
    /// Jika dibiarkan terbuka, controller akan terus memakan kapasitas RAM HP di latar belakang
    /// sehingga menimbulkan kebocoran memori (Memory Leak) dan memperlambat kinerja smartphone.
    _namaController.dispose();
    _peranController.dispose();
    _tahunController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  /// ==============================================================================
  /// WORKFLOW TAHAP 1, 3, & 4: EVENT SUBMIT, VALIDASI, & FEEDBACK PEMROSESAN
  /// ==============================================================================
  void _submitForm() async {
    /// [FocusScope.of(context).unfocus()]:
    /// Menutup papan ketik virtual (keyboard) di layar HP secara otomatis saat tombol ditekan,
    /// sehingga pandangan pengguna tidak terhalang keyboard saat melihat feedback/pesan.
    FocusScope.of(context).unfocus();

    /// [WORKFLOW TAHAP 3: VALIDATION (Modul 4 Slide 16 & 22)]:
    /// Memeriksa seluruh TextFormField di dalam Form.
    /// Jika salah satu field tidak memenuhi kriteria validasi di ViewModel:
    /// - Fungsi validate() mengembalikan nilai false.
    /// - Pesan error dan border merah otomatis muncul di bawah masing-masing kolom yang bermasalah.
    /// - Eksekusi dihentikan (return) agar data yang cacat tidak diproses.
    if (!_formKey.currentState!.validate()) {
      return;
    }

    /// [Validasi Anti-Duplikasi Cerdas (Kombinasi Nama + Peran + Tahun)]:
    /// Menolak entri hanya jika nama kegiatan, peran, dan tahun ketiganya sama persis.
    final namaInput = _namaController.text.trim();
    final peranInput = _peranController.text.trim();
    final tahunInput = _tahunController.text.trim();

    final isDuplikat = PengalamanViewModel.isDuplikatKombinasi(
      nama: namaInput,
      peran: peranInput,
      tahun: tahunInput,
      terdaftar: widget.pengalamanTerdaftar,
    );

    if (isDuplikat) {
      /// [WORKFLOW TAHAP 4: FEEDBACK STATUS GAGAL (ANTI-DUPLIKASI)]:
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Pengalaman "$namaInput" sebagai "$peranInput" pada tahun $tahunInput sudah ada di daftar!',
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
      return;
    }

    /// [WORKFLOW TAHAP 4: FEEDBACK STATUS PROSES / LOADING (Modul 4 Slide 20)]:
    /// Mengaktifkan state loading sehingga tombol simpan berubah menjadi spinner animasi.
    setState(() {
      _isLoading = true;
    });

    // Simulasi jeda pemrosesan / penyimpanan data (misal: proses parsing atau koneksi lokal)
    await Future.delayed(const Duration(milliseconds: 700));

    // Memastikan layar masih aktif di widget tree sebelum melanjutkan manipulasi tampilan
    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    /// [Pembungkusan ke Objek Strongly-Typed Model]:
    /// Mengambil nilai teks bersih (.trim()) dari masing-masing controller dan
    /// membungkusnya ke dalam objek PengalamanModel yang aman dari kesalahan tipe data.
    final newPengalaman = PengalamanModel(
      namaKegiatan: _namaController.text.trim(),
      peran: _peranController.text.trim(),
      tahun: _tahunController.text.trim(),
      deskripsi: _deskripsiController.text.trim(),
    );

    /// [WORKFLOW TAHAP 4: FEEDBACK STATUS SUKSES (MODAL SUCCESS DIALOG)]:
    /// Menampilkan popup konfirmasi visual yang menarik di tengah layar (Modul 4 Slide 20).
    showDialog(
      context: context,
      /// [barrierDismissible: false]:
      /// Mengunci popup agar tidak dapat ditutup secara tidak sengaja hanya dengan mengetuk
      /// area kosong di luar kotak dialog. Pengguna harus menekan tombol konfirmasi di dalam dialog.
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFB9F6CA),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle_rounded,
                color: Color(0xFF006400),
                size: 44,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Pengalaman disimpan!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006400),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(ctx); // Menutup jendela popup modal dialog

                  /// [WORKFLOW TAHAP 5: NAVIGATION / RESULT (Modul 4 Slide 29)]:
                  /// [Backward Result Passing]: Menutup layar TambahPengalamanScreen dan
                  /// mengembalikan objek 'newPengalaman' kembali ke DaftarPengalamanScreen.
                  Navigator.pop(context, newPengalaman);
                },
                child: const Text(
                  'Lihat Daftar Pengalaman',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          // Jika ditekan, kembali ke layar utama tanpa membawa result (Batal)
          onPressed: _isLoading ? null : () => Navigator.pop(context),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah Pengalaman',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Form Riwayat Kegiatan',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detail Pengalaman',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // ==============================================================================
                // 1. FIELD NAMA KEGIATAN (Wajib Diisi + Validasi Anti-Duplikasi)
                // ==============================================================================
                const Text('Nama Kegiatan',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _namaController,
                  enabled: !_isLoading,
                  decoration: _buildInputDecoration(
                    hintText: 'Masukkan nama kegiatan / lomba',
                    icon: Icons.emoji_events_outlined,
                  ),
                  /// [Delegasi Validasi ke ViewModel (Modul 3 Section 3)]:
                  /// Logika pengecekan nama (wajib diisi dan minimal 3 karakter)
                  /// didelegasikan sepenuhnya ke fungsi statis di ViewModel.
                  validator: PengalamanViewModel.validasiNamaKegiatan,
                ),
                const SizedBox(height: 16),

                // ==============================================================================
                // 2. FIELD PERAN (Wajib Diisi)
                // ==============================================================================
                const Text('Peran',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _peranController,
                  enabled: !_isLoading,
                  decoration: _buildInputDecoration(
                    hintText: 'Masukkan peran atau posisi',
                    icon: Icons.badge_outlined,
                  ),
                  /// [Delegasi Validasi Peran]:
                  /// Memastikan posisi/peran tidak dikosongkan oleh pengguna.
                  validator: PengalamanViewModel.validasiPeran,
                ),
                const SizedBox(height: 16),

                // ==============================================================================
                // 3. FIELD TAHUN PELAKSANAAN (Validasi Multi-Tier)
                // ==============================================================================
                const Text('Tahun Pelaksanaan',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _tahunController,
                  enabled: !_isLoading,
                  keyboardType: TextInputType.number,
                  decoration: _buildInputDecoration(
                    hintText: 'Contoh: 2026',
                    icon: Icons.calendar_today_outlined,
                  ),
                  /// [Delegasi Validasi Multi-Tier]:
                  /// Memvalidasi: bukan teks kosong -> angka bulat sah (tryParse) -> rentang 2000-2026.
                  validator: PengalamanViewModel.validasiTahun,
                ),
                const SizedBox(height: 16),

                // ==============================================================================
                // 4. FIELD DESKRIPSI KONTRIBUSI (Opsional)
                // ==============================================================================
                const Text('Deskripsi Kontribusi',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _deskripsiController,
                  enabled: !_isLoading,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText:
                        'Tuliskan deskripsi peran, tugas, dan kontribusi Anda secara lengkap...',
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // ==============================================================================
                // TOMBOL SIMPAN DENGAN FEEDBACK STATUS PROSES (SPINNER / LOADING)
                // ==============================================================================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006400),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: _isLoading ? null : _submitForm,
                    child: _isLoading
                        ? const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Menyimpan...',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : const Text(
                            'Simpan Pengalaman',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// [Helper Styling Input & Error Visual Feedback]:
  /// Mengatur tata letak border input secara seragam.
  /// Menerapkan [Visual Error Feedback] dengan warna border merah mencolok
  /// saat ada field yang melanggar aturan validasi (Modul 4 Slide 22).
  InputDecoration _buildInputDecoration({
    required String hintText,
    required IconData icon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
      prefixIcon: Icon(icon, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      // [errorBorder]: Garis tepi merah saat field tidak lolos validasi (Status Gagal)
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      // [focusedErrorBorder]: Garis tepi merah lebih tebal saat kursor aktif di field yang salah
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}
