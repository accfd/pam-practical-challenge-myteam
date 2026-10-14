import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';

/// ==============================================================================
/// LAPISAN: PRESENTATION LAYER (VIEW 2 - FORM TAMBAH PENGALAMAN)
/// ==============================================================================
/// Layar form interaktif untuk menangkap input riwayat kegiatan mahasiswa.
/// Mengimplementasikan validasi input berlapis, feedback modal, dan pengembalian data (Modul 4).
class TambahPengalamanScreen extends StatefulWidget {
  const TambahPengalamanScreen({super.key});

  @override
  State<TambahPengalamanScreen> createState() => _TambahPengalamanScreenState();
}

class _TambahPengalamanScreenState extends State<TambahPengalamanScreen> {
  /// WORKFLOW TAHAP 2: STATE MANAGEMENT (FORM STATE)
  /// GlobalKey bertindak sebagai pengidentifikasi unik dan pengendali FormState (Modul 4 Slide 16).
  /// Memungkinkan eksekusi method validate() dan save() secara menyeluruh pada semua TextFormField anak.
  final _formKey = GlobalKey<FormState>();

  /// TextEditingController: Mendengarkan dan mengontrol isi teks yang dimasukkan pengguna (Modul 4 Slide 8).
  final _namaController = TextEditingController();
  final _peranController = TextEditingController();
  final _tahunController = TextEditingController();
  final _deskripsiController = TextEditingController();

  @override
  void dispose() {
    /// PEMBERSIHAN MEMORI (MEMORY LEAK PREVENTION)
    /// Seluruh controller WAJIB di-dispose saat widget dihancurkan dari widget tree (Modul 4 Slide 8).
    _namaController.dispose();
    _peranController.dispose();
    _tahunController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  /// WORKFLOW TAHAP 1 & 3: EVENT SUBMIT & VALIDATION LOGIC
  void _submitForm() {
    // Memeriksa validasi seluruh field form secara serentak (Modul 4 Slide 16 & 22)
    if (_formKey.currentState!.validate()) {
      // Membersihkan whitespace dengan .trim() dan membungkus input ke dalam objek strongly-typed (Modul 3 Slide 16)
      final newPengalaman = PengalamanModel(
        namaKegiatan: _namaController.text.trim(),
        peran: _peranController.text.trim(),
        tahun: _tahunController.text.trim(),
        deskripsi: _deskripsiController.text.trim(),
      );

      // WORKFLOW TAHAP 4: FEEDBACK MECHANISM (SUCCESS DIALOG)
      // Menampilkan dialog modal konfirmasi interaktif saat validasi berhasil (Modul 4 Slide 20)
      showDialog(
        context: context,
        // Mencegah penutupan dialog secara tidak sengaja di luar area modal
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              // Ikon centang hijau sukses beranimasi visual
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
              // Tombol konfirmasi untuk menutup dialog dan kembali ke layar daftar
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
                    // Menutup popup dialog terlebih dahulu
                    Navigator.pop(ctx);

                    // WORKFLOW TAHAP 5: NAVIGATION / RESULT (Modul 4 Slide 29)
                    // Mengirimkan objek newPengalaman kembali ke layar pemanggil (DaftarPengalamanScreen)
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
          // Navigasi mundur membatalkan pengisian tanpa mengirimkan data
          onPressed: () => Navigator.pop(context),
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
                // 1. FIELD NAMA KEGIATAN (Wajib Diisi)
                // ==============================================================================
                const Text('Nama Kegiatan',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _namaController,
                  decoration: _buildInputDecoration(
                    hintText: 'Masukkan nama kegiatan / lomba',
                    icon: Icons.emoji_events_outlined,
                  ),
                  validator: (value) {
                    // Validasi: Tidak boleh kosong atau hanya berupa spasi (Modul 4 Slide 18)
                    if (value == null || value.trim().isEmpty) {
                      return 'Nama kegiatan wajib diisi!';
                    }
                    return null; // Input valid
                  },
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
                  decoration: _buildInputDecoration(
                    hintText: 'Masukkan peran atau posisi',
                    icon: Icons.badge_outlined,
                  ),
                  validator: (value) {
                    // Validasi: Peran wajib diisi (Modul 4 Slide 18)
                    if (value == null || value.trim().isEmpty) {
                      return 'Peran wajib diisi!';
                    }
                    return null; // Input valid
                  },
                ),
                const SizedBox(height: 16),

                // ==============================================================================
                // 3. FIELD TAHUN PELAKSANAAN (Validasi Multi-Tier: Required + Numerik + Rentang)
                // ==============================================================================
                const Text('Tahun Pelaksanaan',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _tahunController,
                  keyboardType: TextInputType.number,
                  decoration: _buildInputDecoration(
                    hintText: 'Contoh: 2026',
                    icon: Icons.calendar_today_outlined,
                  ),
                  validator: (value) {
                    // Lapisan 1: Pengecekan input kosong
                    if (value == null || value.trim().isEmpty) {
                      return 'Tahun wajib diisi!';
                    }
                    // Lapisan 2: Pengecekan tipe data integer numerik (Modul 4 Slide 7)
                    final int? tahun = int.tryParse(value.trim());
                    if (tahun == null) {
                      return 'Tahun harus berupa angka valid!';
                    }
                    // Lapisan 3: Pengecekan rentang batas logis tahun kegiatan mahasiswa
                    if (tahun < 2000 || tahun > 2026) {
                      return 'Masukkan tahun antara 2000 - 2026!';
                    }
                    return null; // Input valid
                  },
                ),
                const SizedBox(height: 16),

                // ==============================================================================
                // 4. FIELD DESKRIPSI KONTRIBUSI (Field Opsional)
                // ==============================================================================
                const Text('Deskripsi Kontribusi',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _deskripsiController,
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
                // TOMBOL SUBMIT FORM
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
                    onPressed: _submitForm,
                    child: const Text(
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

  /// Helper untuk styling dekorasi input form dengan indikator error visual (Modul 4 Slide 18)
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
      // WORKFLOW TAHAP 4: ERROR VISUAL FEEDBACK (Border merah saat input invalid)
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}
