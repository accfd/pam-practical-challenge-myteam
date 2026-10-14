import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import 'tambah_pengalaman_screen.dart';

class DaftarPengalamanScreen extends StatefulWidget {
  const DaftarPengalamanScreen({super.key});

  @override
  State<DaftarPengalamanScreen> createState() => _DaftarPengalamanScreenState();
}

class _DaftarPengalamanScreenState extends State<DaftarPengalamanScreen> {
  // State lokal menampung list pengalaman
  final List<PengalamanModel> _listPengalaman = [];

  void _navigateToAddScreen() async {
    // Stage 1: Event - Pindah Halaman via Navigator.push (Modul 4 Slide 28)
    final result = await Navigator.push<PengalamanModel>(
      context,
      MaterialPageRoute(builder: (ctx) => const TambahPengalamanScreen()),
    );

    // Stage 5: Navigation Result - Update State ketika data dikembalikan (Modul 4 Slide 29)
    if (result != null) {
      setState(() {
        _listPengalaman.add(result);
      });
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
          onPressed: () {},
        ),
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
      body: _listPengalaman.isEmpty
          // Tampilan Layar 1: Empty State (Gambar 1)
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
          // Tampilan Layar 6: Result State (Gambar 6)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _listPengalaman.length,
              itemBuilder: (ctx, index) {
                final item = _listPengalaman[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                item.namaKegiatan,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Icon(Icons.edit_outlined,
                                color: Colors.grey, size: 20),
                          ],
                        ),
                        const SizedBox(height: 8),
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
      bottomNavigationBar: _listPengalaman.isNotEmpty
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
  }
}
