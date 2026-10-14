import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import '../viewmodels/pengalaman_viewmodel.dart';
import 'tambah_pengalaman_screen.dart';

/// Layar utama menampilkan daftar portofolio pengalaman mahasiswa (View 1)
class DaftarPengalamanScreen extends StatefulWidget {
  const DaftarPengalamanScreen({super.key});

  @override
  State<DaftarPengalamanScreen> createState() => _DaftarPengalamanScreenState();
}

class _DaftarPengalamanScreenState extends State<DaftarPengalamanScreen> {
  // Instance ViewModel sebagai Single Source of Truth
  final PengalamanViewModel _viewModel = PengalamanViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  /// Navigasi ke Form Tambah Pengalaman dan penanganan data hasil kembalian
  void _navigateToAddScreen() async {
    final result = await Navigator.push<PengalamanModel>(
      context,
      MaterialPageRoute(
        builder: (ctx) => TambahPengalamanScreen(
          // Forward Data Passing: meneruskan data untuk validasi duplikasi cerdas
          pengalamanTerdaftar: _viewModel.listPengalaman,
        ),
      ),
    );

    if (!mounted) return;

    // 1. Kondisi Sukses Simpan: tambah data ke ViewModel & tampilkan SnackBar hijau
    if (result != null) {
      _viewModel.tambahPengalaman(result);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil menambahkan "${result.namaKegiatan}" ke daftar pengalaman!'),
          backgroundColor: const Color(0xFF006400),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
    // 2. Kondisi Batal: pengguna kembali tanpa menyimpan
    else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Penambahan pengalaman dibatalkan'),
          backgroundColor: Colors.grey.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder merender ulang UI secara efisien saat ViewModel memanggil notifyListeners()
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daftar Pengalaman',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Portofolio & Rekam Jejak',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          body: _viewModel.isEmpty
              // ==============================================================================
              // TAMPILAN 1: EMPTY STATE (Kondisi saat belum ada pengalaman tersimpan)
              // ==============================================================================
              // Menghindari layar putih polos yang membingungkan dengan memberikan ilustrasi,
              // badge informasi, pesan ramah, dan tombol aksi yang jelas.
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Ikon informatif dengan lingkaran berlatar belakang hijau muda
                        Container(
                          width: 96,
                          height: 96,
                          decoration: const BoxDecoration(
                            color: Color(0xFFE8F5E9),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.assignment_turned_in_outlined,
                            color: Color(0xFF006400),
                            size: 48,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Badge status jumlah pengalaman
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE8EAF6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            '0 Pengalaman Tersimpan',
                            style: TextStyle(fontSize: 12, color: Colors.indigo),
                          ),
                        ),
                        const SizedBox(height: 16),

                        const Text(
                          'Belum Ada Pengalaman',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),

                        const Text(
                          'Tambahkan riwayat kegiatan, kepanitiaan organisasi, kompetisi, atau riset kampus untuk melengkapi portofolio dan menarik rekan tim terbaik di UNAND.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, height: 1.4),
                        ),
                        const SizedBox(height: 24),

                        // Tombol pemicu event tambah pengalaman pada kondisi kosong
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF006400),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: _navigateToAddScreen,
                            icon: const Icon(Icons.add, color: Colors.white),
                            label: const Text(
                              'Tambah Pengalaman',
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
                )
              // ==============================================================================
              // TAMPILAN 2: RESULT STATE (ListView Builder saat data sudah terisi)
              // ==============================================================================
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _viewModel.totalPengalaman,
                  itemBuilder: (ctx, index) {
                    // Mengambil item model dari ViewModel berdasarkan indeks
                    final item = _viewModel.listPengalaman[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        // Aksen garis hijau vertikal di sisi kiri kartu (Identitas Visual UNAND)
                        border: const Border(
                          left: BorderSide(color: Color(0xFF006400), width: 6),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(13),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1. Nama Kegiatan
                            Text(
                              item.namaKegiatan,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // 2. Peran / Posisi
                            Row(
                              children: [
                                const Icon(Icons.badge_outlined,
                                    color: Color(0xFF006400), size: 18),
                                const SizedBox(width: 6),
                                Text(
                                  item.peran,
                                  style: const TextStyle(
                                    color: Color(0xFF006400),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),

                            // 3. Tahun Pelaksanaan
                            Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined,
                                    color: Colors.grey, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  item.tahun,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),

                            // 4. Deskripsi Kontribusi (Ditampilkan jika pengguna mengisinya)
                            if (item.deskripsi.isNotEmpty) ...[
                              const SizedBox(height: 12),
                              Text(
                                item.deskripsi,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),

          // Tombol melayang di bagian bawah saat daftar sudah berisi data
          bottomNavigationBar: !_viewModel.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006400),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _navigateToAddScreen,
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        'Tambah Pengalaman',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
