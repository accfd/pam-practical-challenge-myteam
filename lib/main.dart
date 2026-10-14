import 'package:flutter/material.dart';
import 'screens/daftar_pengalaman_screen.dart';

/// Titik awal eksekusi aplikasi mobile (Modul 2 Slide 7: Your First Dart Program).
void main() {
  runApp(const MyTeamApp());
}

/// Root Widget aplikasi MyTeam.
/// Menggunakan StatelessWidget karena konfigurasi tema dan routing utama bersifat statis (Modul 3 Slide 27).
class MyTeamApp extends StatelessWidget {
  const MyTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menghilangkan banner debug di pojok kanan atas tampilan
      debugShowCheckedModeBanner: false,
      title: 'MyTeam App',

      // Menerapkan Material Design 3 dengan warna tema Hijau Universitas Andalas (#006400) (Modul 3 Slide 31)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006400),
        ),
        useMaterial3: true,
      ),

      // Menetapkan DaftarPengalamanScreen sebagai layar awal (Root Screen) aplikasi
      home: const DaftarPengalamanScreen(),
    );
  }
}