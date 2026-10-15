import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import '../viewmodels/pengalaman_viewmodel.dart';

// View 2: Form Input Riwayat Pengalaman
class TambahPengalamanScreen extends StatefulWidget {
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
    _namaController.dispose();
    _peranController.dispose();
    _tahunController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    // 1. Validasi form input
    if (!_formKey.currentState!.validate()) return;

    final nama = _namaController.text.trim();
    final peran = _peranController.text.trim();
    final tahun = _tahunController.text.trim();

    // 2. Validasi anti-duplikasi di ViewModel
    final isDuplikat = PengalamanViewModel.isDuplikatKombinasi(
      nama: nama,
      peran: peran,
      tahun: tahun,
      terdaftar: widget.pengalamanTerdaftar,
    );

    if (isDuplikat) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Pengalaman "$nama" sebagai "$peran" tahun $tahun sudah ada!'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // 3. Status loading (Feedback proses)
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;
    setState(() => _isLoading = false);

    final newPengalaman = PengalamanModel(
      namaKegiatan: nama,
      peran: peran,
      tahun: tahun,
      deskripsi: _deskripsiController.text.trim(),
    );

    // 4. Modal Dialog Sukses & Backward Data Return (Feedback & Navigation)
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.check_circle_rounded, color: Color(0xFF006400), size: 52),
        title: const Text('Pengalaman disimpan!'),
        content: Text(
          'Pengalaman "$nama" berhasil ditambahkan ke portofolio riwayat kegiatan Anda.',
          textAlign: TextAlign.center,
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(ctx);
                Navigator.pop(context, newPengalaman);
              },
              child: const Text('Lihat Daftar Pengalaman'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tambah Pengalaman'),
            Text('Form Riwayat Kegiatan', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // 1. Nama Kegiatan
              TextFormField(
                controller: _namaController,
                enabled: !_isLoading,
                decoration: const InputDecoration(
                  labelText: 'Nama Kegiatan',
                  hintText: 'Contoh: PIMNAS 37 / BEM KM UNAND',
                  prefixIcon: Icon(Icons.emoji_events_outlined),
                ),
                validator: PengalamanViewModel.validasiNamaKegiatan,
              ),
              const SizedBox(height: 16),

              // 2. Peran / Posisi
              TextFormField(
                controller: _peranController,
                enabled: !_isLoading,
                decoration: const InputDecoration(
                  labelText: 'Peran / Posisi',
                  hintText: 'Contoh: Ketua Tim / Staf Ahli',
                  prefixIcon: Icon(Icons.badge_outlined),
                ),
                validator: PengalamanViewModel.validasiPeran,
              ),
              const SizedBox(height: 16),

              // 3. Tahun Pelaksanaan
              TextFormField(
                controller: _tahunController,
                enabled: !_isLoading,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Tahun Pelaksanaan',
                  hintText: 'Contoh: 2026',
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                ),
                validator: PengalamanViewModel.validasiTahun,
              ),
              const SizedBox(height: 16),

              // 4. Deskripsi Kontribusi
              TextFormField(
                controller: _deskripsiController,
                enabled: !_isLoading,
                maxLines: 4,
                maxLength: 3000,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Kontribusi (Opsional)',
                  hintText: 'Tuliskan rincian tugas dan kontribusi Anda (maksimal 3000 karakter)...',
                  alignLabelWithHint: true,
                ),
                validator: PengalamanViewModel.validasiDeskripsi,
              ),
              const SizedBox(height: 24),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _submitForm,
                  child: _isLoading
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                            ),
                            SizedBox(width: 10),
                            Text('Menyimpan...'),
                          ],
                        )
                      : const Text('Simpan Pengalaman'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
