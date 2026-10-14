import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import '../viewmodels/pengalaman_viewmodel.dart';

/// ==============================================================================
/// LAPISAN: PRESENTATION LAYER (VIEW 2 - FORM TAMBAH PENGALAMAN)
/// ==============================================================================
/// Layar form interaktif untuk menangkap input riwayat kegiatan mahasiswa.
/// Mengimplementasikan validasi input berlapis (termasuk anti-duplikasi),
/// feedback multi-kondisi (Gagal, Proses/Loading, Sukses), dan pengembalian data (Modul 4).
class TambahPengalamanScreen extends StatefulWidget {
  /// DATA PASSING (DATA YANG DITERIMA DARI SCREEN SEBELUMNYA - Modul 4 Slide 28)
  /// Menerima daftar nama kegiatan yang sudah terdaftar untuk divalidasi agar tidak duplikat.
  final List<String> kegiatanTerdaftar;

  const TambahPengalamanScreen({
    super.key,
    this.kegiatanTerdaftar = const [],
  });

  @override
  State<TambahPengalamanScreen> createState() => _TambahPengalamanScreenState();
}

class _TambahPengalamanScreenState extends State<TambahPengalamanScreen> {
  /// WORKFLOW TAHAP 2: STATE MANAGEMENT (FORM STATE & LOADING STATE)
  /// GlobalKey bertindak sebagai pengendali FormState (Modul 4 Slide 16).
  final _formKey = GlobalKey<FormState>();

  /// TextEditingController: Menangkap dan mengontrol teks input pengguna (Modul 4 Slide 8).
  final _namaController = TextEditingController();
  final _peranController = TextEditingController();
  final _tahunController = TextEditingController();
  final _deskripsiController = TextEditingController();

  /// State untuk merepresentasikan status PROSES / LOADING (Modul 4 Slide 20: Representing Loading State)
  bool _isLoading = false;

  @override
  void dispose() {
    /// PEMBERSIHAN MEMORI (MEMORY LEAK PREVENTION - Modul 4 Slide 8)
    _namaController.dispose();
    _peranController.dispose();
    _tahunController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  /// WORKFLOW TAHAP 1, 3, & 4: EVENT SUBMIT, VALIDATION, & FEEDBACK PROCESS
  void _submitForm() async {
    // Menutup keyboard virtual
    FocusScope.of(context).unfocus();

    // WORKFLOW TAHAP 3: VALIDATION
    // Jika validasi gagal, border merah muncul dan proses dihentikan (Modul 4 Slide 16 & 22)
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // WORKFLOW TAHAP 4: FEEDBACK STATUS PROSES (LOADING)
    // Menampilkan spinner loading pada tombol selama proses pemrosesan data (Modul 4 Slide 20)
    setState(() {
      _isLoading = true;
    });

    // Simulasi jeda pemrosesan / penyimpanan data
    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    // Membungkus data teks bersih (.trim()) ke dalam objek model strongly-typed (Modul 3 Slide 16)
    final newPengalaman = PengalamanModel(
      namaKegiatan: _namaController.text.trim(),
      peran: _peranController.text.trim(),
      tahun: _tahunController.text.trim(),
      deskripsi: _deskripsiController.text.trim(),
    );

    // WORKFLOW TAHAP 4: FEEDBACK STATUS SUKSES (SUCCESS DIALOG)
    // Menampilkan modal konfirmasi interaktif saat data berhasil diproses (Modul 4 Slide 20)
    showDialog(
      context: context,
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
                  Navigator.pop(ctx); // Menutup popup dialog

                  // WORKFLOW TAHAP 5: NAVIGATION / RESULT (Modul 4 Slide 29)
                  // Mengembalikan objek model baru ke layar awal (DaftarPengalamanScreen)
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
                  // Delegasi aturan validasi bisnis ke ViewModel (Modul 3 Section 3)
                  validator: (value) => PengalamanViewModel.validasiNamaKegiatan(
                    value,
                    terdaftar: widget.kegiatanTerdaftar,
                  ),
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
                  // Delegasi aturan validasi peran ke ViewModel (Modul 3 Section 3)
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
                  // Delegasi aturan validasi tahun ke ViewModel (Modul 3 Section 3)
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
      // WORKFLOW TAHAP 4: ERROR VISUAL FEEDBACK (Border Merah Saat Invalid)
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
