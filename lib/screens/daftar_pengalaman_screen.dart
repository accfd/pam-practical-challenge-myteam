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
    // 1. Forward passing data ke form tambah
    final result = await Navigator.push<PengalamanModel>(
      context,
      MaterialPageRoute(
        builder: (ctx) => TambahPengalamanScreen(
          pengalamanTerdaftar: _viewModel.listPengalaman,
        ),
      ),
    );

    if (!mounted) return;

    // 2. Menerima result dan memperbarui state di ViewModel
    if (result != null) {
      _viewModel.tambahPengalaman(result);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil menambahkan "${result.namaKegiatan}"!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Daftar Pengalaman'),
          ),
          body: _viewModel.isEmpty
              // Tampilan 1: Empty State
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.inbox_outlined, size: 64, color: Colors.grey),
                      const SizedBox(height: 16),
                      const Text(
                        'Belum Ada Pengalaman',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _navigateToAddScreen,
                        icon: const Icon(Icons.add),
                        label: const Text('Tambah Pengalaman'),
                      ),
                    ],
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
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.peran,
                              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.tahun,
                              style: const TextStyle(color: Colors.grey),
                            ),
                            if (item.deskripsi.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(item.deskripsi),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
          floatingActionButton: !_viewModel.isEmpty
              ? FloatingActionButton.extended(
                  onPressed: _navigateToAddScreen,
                  icon: const Icon(Icons.add),
                  label: const Text('Tambah Pengalaman'),
                )
              : null,
        );
      },
    );
  }
}
