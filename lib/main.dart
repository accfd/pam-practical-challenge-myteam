import 'package:flutter/material.dart';
import 'screens/daftar_pengalaman_screen.dart';

void main() {
  runApp(const MyTeamApp());
}

class MyTeamApp extends StatelessWidget {
  const MyTeamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyTeam App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006400), // Hijau Unand
        ),
        useMaterial3: true,
      ),
      home: const DaftarPengalamanScreen(),
    );
  }
}