import 'package:flutter/material.dart';
import 'screens/daftar_pengalaman_screen.dart';

/// Entry point aplikasi Flutter.
void main() {
  runApp(const MyTeamApp());
}

/// Root widget yang mengonfigurasi tema global dan halaman awal aplikasi.
class MyTeamApp extends StatelessWidget {
  const MyTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTeam App',
      theme: ThemeData(
        // Tema Material 3 dengan warna dasar hijau Universitas Andalas
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006400),
        ),
        useMaterial3: true,
      ),
      // Layar utama: Halaman daftar pengalaman mahasiswa
      home: const DaftarPengalamanScreen(),
    );
  }
}
