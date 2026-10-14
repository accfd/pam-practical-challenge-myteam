import 'package:flutter/material.dart';
import '../models/pengalaman_model.dart';
import '../viewmodels/pengalaman_viewmodel.dart';
import 'tambah_pengalaman_screen.dart';

/// ==============================================================================
/// LAPISAN: PRESENTATION LAYER (VIEW 1 - DAFTAR PENGALAMAN)
/// ==============================================================================
/// [Presentation Layer / View]:
/// Lapisan antarmuka pengguna (UI) yang bertugas menggambar komponen visual di layar HP
/// (seperti AppBar, tombol, teks status, dan kartu pengalaman) serta menangkap interaksi pengguna.
/// Sesuai pola MVVM murni (Modul 3 Slide 18), View tidak boleh mengolah logika bisnis sendiri;
/// seluruh urusan data dan aturan divalidasikan ke [PengalamanViewModel].
class DaftarPengalamanScreen extends StatefulWidget {
  const DaftarPengalamanScreen({super.key});

  @override
  State<DaftarPengalamanScreen> createState() => _DaftarPengalamanScreenState();
}

class _DaftarPengalamanScreenState extends State<DaftarPengalamanScreen> {
  /// [Single Source of Truth (Satu-satunya Sumber Kebenaran Data)]:
  /// Prinsip arsitektur di mana data riwayat pengalaman hanya disimpan dan diatur
  /// di SATU tempat terpusat yang resmi, yaitu di dalam objek [_viewModel].
  /// Layar UI hanya bertindak sebagai "cermin" yang memantulkan kondisi data dari ViewModel,
  /// sehingga data tidak akan pernah berselisih (inkonsisten).
  final PengalamanViewModel _viewModel = PengalamanViewModel();

  @override
  void dispose() {
    /// [dispose() & Memory Leak Prevention]:
    /// - [dispose()] adalah metode daur hidup (lifecycle) yang otomatis dipanggil Flutter
    ///   saat layar ini ditutup / dihancurkan secara permanen.
    /// - [Memory Leak (Kebocoran Memori)]: Masalah serius jika objek pendengar (listener)
    ///   dibiarkan terus aktif di memori RAM padahal layarnya sudah tidak dipakai lagi.
    ///   Hal ini membuat HP menjadi panas, boros baterai, lambat, atau bahkan aplikasi crash.
    /// - Dengan memanggil `_viewModel.dispose()`, kita memutus seluruh sambungan listener
    ///   dan membersihkan memori dengan tertib (Modul 4 Slide 8).
    _viewModel.dispose();
    super.dispose();
  }

  /// ==============================================================================
  /// WORKFLOW TAHAP 1 & 5: EVENT, FORWARD DATA PASSING & NAVIGATION RESULT
  /// ==============================================================================
  /// [Asynchronous (async / await)]:
  /// Mekanisme agar proses menunggu pengguna mengisi form berjalan di latar belakang
  /// tanpa membekukan (freeze) aplikasi HP. Layar tetap lancar merespons animasi.
  ///
  /// [Generic Type <PengalamanModel>]:
  /// Penulisan tipe data spesifik di dalam kurung siku `<...>` pada `Navigator.push<PengalamanModel>`.
  /// Fungsinya menjamin [Type-Safety] (keamanan tipe data), yaitu memastikan bahwa nilai
  /// hasil kembalian (result) yang dikirim oleh layar form PASTI berupa objek PengalamanModel,
  /// bukan teks acak atau objek lain yang salah.
  void _navigateToAddScreen() async {
    final result = await Navigator.push<PengalamanModel>(
      context,
      MaterialPageRoute(
        builder: (ctx) => TambahPengalamanScreen(
          /// [Forward Data Passing (Meneruskan Data Maju)]:
          /// Mengirimkan seluruh daftar objek pengalaman yang sudah terdaftar ke layar form (Modul 4 Slide 28)
          /// agar form bisa melakukan validasi anti-duplikasi cerdas (kombinasi nama, peran, dan tahun).
          pengalamanTerdaftar: _viewModel.listPengalaman,
        ),
      ),
    );

    // Memastikan widget masih terpasang di layar sebelum memanipulasi UI (Safety Check)
    if (!mounted) return;

    /// ==============================================================================
    /// WORKFLOW TAHAP 5: NAVIGATION / RESULT (Modul 4 Slide 29)
    /// ==============================================================================
    // 1. KONDISI SUKSES (result != null): Pengguna menekan tombol 'Simpan Pengalaman'
    if (result != null) {
      // Mengirimkan objek model baru ke ViewModel untuk disimpan dan dipancarkan ke UI
      _viewModel.tambahPengalaman(result);

      // Feedback SnackBar (Pemberitahuan mengambang di bawah) mengonfirmasi keberhasilan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil menambahkan "${result.namaKegiatan}" ke daftar pengalaman!'),
          backgroundColor: const Color(0xFF006400),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      );
    }
    // 2. KONDISI BATAL (result == null): Pengguna menekan tombol panah kembali di AppBar
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
    /// [ListenableBuilder]:
    /// Widget resmi dan efisien bawaan Flutter (Modul 4 Slide 10-11) yang bertugas
    /// mendengarkan objek ChangeNotifier (yaitu _viewModel).
    /// Keunggulannya dibanding setState biasa:
    /// Ketika _viewModel memanggil `notifyListeners()`, hanya widget di dalam builder ini
    /// yang digambar ulang (rebuild). Bagian Scaffold dan AppBar tidak perlu digambar ulang,
    /// sehingga performa rendering aplikasi menjadi sangat cepat dan hemat baterai.
    return ListenableBuilder(
      listenable: _viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            // Layar beranda (root) tidak memerlukan tombol panah kembali
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

          /// Tampilan Adaptif: Beralih otomatis antara [Empty State] dan [Populated List]
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
