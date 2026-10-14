import 'package:flutter/material.dart';
import 'screens/daftar_pengalaman_screen.dart';

/// [main() / Entry Point]:
/// Titik awal eksekusi program Flutter. Setiap kali aplikasi dijalankan,
/// fungsi main() inilah yang pertama kali dipanggil oleh sistem operasi HP.
/// Fungsi [runApp()] bertugas menempelkan widget utama (MyTeamApp) ke layar perangkat.
void main() {
  runApp(const MyTeamApp());
}

/// [StatelessWidget]:
/// Jenis widget di Flutter yang bersifat statis (tidak memiliki data/state yang berubah-ubah
/// di dalam dirinya sendiri). Kelas ini sangat ringan dan hemat memori, berfungsi sebagai
/// gerbang pembungkus konfigurasi global aplikasi.
class MyTeamApp extends StatelessWidget {
  const MyTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// [MaterialApp]:
    /// Widget pondasi tingkat teratas yang mengaktifkan sistem desain Google Material Design.
    /// Widget ini menyediakan rute navigasi, sistem tema, lokalisasi, dan arah teks.
    return MaterialApp(
      // Menyembunyikan banner / pita "DEBUG" di pojok kanan atas agar tampilan rapi
      debugShowCheckedModeBanner: false,
      title: 'MyTeam App',
      theme: ThemeData(
        /// [ColorScheme.fromSeed & Material 3]:
        /// Fitur generasi warna cerdas bawaan Flutter Material 3.
        /// Kita cukup memasukkan satu warna bibit (seed color) yaitu Hijau Universitas Andalas (0xFF006400),
        /// dan Flutter akan otomatis menghitung serta menurunkan palet warna harmonis
        /// (warna primer, sekunder, kontras teks, dsb) untuk seluruh komponen aplikasi.
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006400),
        ),
        useMaterial3: true,
      ),
      /// [home]:
      /// Menetapkan layar awal (Root Screen) yang pertama kali dirender saat aplikasi terbuka,
      /// yaitu halaman DaftarPengalamanScreen (View 1).
      home: const DaftarPengalamanScreen(),
    );
  }
}
