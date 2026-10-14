import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import '../viewmodels/pengalaman_viewmodel.dart';

/// Layar form interaktif untuk menambahkan pengalaman baru (View 2)
class TambahPengalamanScreen extends StatefulWidget {
  // Menerima data daftar pengalaman dari layar awal untuk validasi anti-duplikasi
  final List<PengalamanModel> pengalamanTerdaftar;

  const TambahPengalamanScreen({
    super.key,
    this.pengalamanTerdaftar = const [],
  });

  @override
  State<TambahPengalamanScreen> createState() => _TambahPengalamanScreenState();
}

class _TambahPengalamanScreenState extends State<TambahPengalamanScreen> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _peranController = TextEditingController();
  final _tahunController = TextEditingController();
  final _deskripsiController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    // Membebaskan controller untuk mencegah kebocoran memori (Memory Leak)
    _namaController.dispose();
    _peranController.dispose();
    _tahunController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    FocusScope.of(context).unfocus();

    // 1. Validasi field dasar (Required, Min Length, Valid Number)
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final namaInput = _namaController.text.trim();
    final peranInput = _peranController.text.trim();
    final tahunInput = _tahunController.text.trim();

    // 2. Validasi anti-duplikasi cerdas kombinasi nama + peran + tahun
    final isDuplikat = PengalamanViewModel.isDuplikatKombinasi(
      nama: namaInput,
      peran: peranInput,
      tahun: tahunInput,
      terdaftar: widget.pengalamanTerdaftar,
    );

    if (isDuplikat) {
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

    // 3. Feedback status proses (Loading spinner)
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    final newPengalaman = PengalamanModel(
      namaKegiatan: _namaController.text.trim(),
      peran: _peranController.text.trim(),
      tahun: _tahunController.text.trim(),
      deskripsi: _deskripsiController.text.trim(),
    );

    // 4. Feedback status sukses (Modal Dialog) & pengembalian data ke layar utama
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
                  Navigator.pop(ctx);
                  // Backward Result Passing: mengembalikan objek ke layar sebelumnya
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

                // 1. Field Nama Kegiatan
                const Text('Nama Kegiatan',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _namaController,
                  enabled: !_isLoading,
                  decoration: _buildInputDecoration(
                    hintText: 'Masukkan nama kegiatan',
                    icon: Icons.emoji_events_outlined,
                  ),
                  validator: PengalamanViewModel.validasiNamaKegiatan,
                ),
                const SizedBox(height: 16),

                // 2. Field Peran
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
                  validator: PengalamanViewModel.validasiPeran,
                ),
                const SizedBox(height: 16),

                // 3. Field Tahun Pelaksanaan
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
                  validator: PengalamanViewModel.validasiTahun,
                ),
                const SizedBox(height: 16),

                // 4. Field Deskripsi Kontribusi
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

                // Tombol Simpan dengan Status Loading
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
      // Visual feedback border merah saat invalid
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
