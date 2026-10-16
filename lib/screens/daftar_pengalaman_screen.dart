import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import '../viewmodels/pengalaman_viewmodel.dart';
import 'tambah_pengalaman_screen.dart';

// View 1: Layar Utama Daftar Pengalaman
class DaftarPengalamanScreen extends StatefulWidget {
  const DaftarPengalamanScreen({super.key});

  @override
  State<DaftarPengalamanScreen> createState() => _DaftarPengalamanScreenState();
}

class _DaftarPengalamanScreenState extends State<DaftarPengalamanScreen> {
  final PengalamanViewModel _viewModel = PengalamanViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _navigateToAddScreen() async {
    // 1. Forward data passing ke form tambah
    final result = await Navigator.push<PengalamanModel>(
      context,
      MaterialPageRoute(
        builder: (ctx) => TambahPengalamanScreen(
          pengalamanTerdaftar: _viewModel.listPengalaman,
        ),
      ),
    );

    if (!mounted) return;

    // 2. Menerima return data dan mutasi state di ViewModel
    if (result != null) {
      _viewModel.tambahPengalaman(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Daftar Pengalaman'),
                Text('Portofolio & Rekam Jejak', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          body: _viewModel.isEmpty
              // Tampilan 1: Empty State
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Color(0xFFE8F5E9),
                          child: Icon(Icons.assignment_turned_in_outlined, size: 40, color: Color(0xFF006400)),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Belum Ada Pengalaman',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Mulai bangun portofolio pengalaman dan riwayat kegiatanmu di kampus.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: _navigateToAddScreen,
                            icon: const Icon(Icons.add),
                            label: const Text('Tambah Pengalaman'),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              // Tampilan 2: ListView Kartu Pengalaman
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _viewModel.totalPengalaman,
                  itemBuilder: (ctx, index) {
                    final item = _viewModel.listPengalaman[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.namaKegiatan,
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.badge_outlined, size: 16, color: Color(0xFF006400)),
                                const SizedBox(width: 6),
                                Text(
                                  item.peran,
                                  style: const TextStyle(color: Color(0xFF006400), fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Icon(Icons.calendar_today_outlined, size: 14, color: Colors.grey),
                                const SizedBox(width: 6),
                                Text(item.tahun, style: const TextStyle(color: Colors.grey)),
                              ],
                            ),
                            if (item.deskripsi.isNotEmpty) ...[
                              const Divider(height: 20),
                              Text(item.deskripsi, style: const TextStyle(color: Colors.black87)),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
          bottomNavigationBar: !_viewModel.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _navigateToAddScreen,
                      icon: const Icon(Icons.add),
                      label: const Text('Tambah Pengalaman'),
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
