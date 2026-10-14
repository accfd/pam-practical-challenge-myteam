import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myteam_app/main.dart';
import 'package:myteam_app/models/pengalaman_model.dart';
import 'package:myteam_app/viewmodels/pengalaman_viewmodel.dart';

void main() {
  // Unit Test: Validasi logika bisnis di ViewModel
  group('Unit Test: Validasi Bisnis di PengalamanViewModel', () {
    test('Validasi Nama Kegiatan: Wajib diisi dan min 3 karakter', () {
      expect(PengalamanViewModel.validasiNamaKegiatan(null), 'Nama kegiatan wajib diisi!');
      expect(PengalamanViewModel.validasiNamaKegiatan('   '), 'Nama kegiatan wajib diisi!');
      expect(PengalamanViewModel.validasiNamaKegiatan('PI'), 'Nama kegiatan minimal 3 karakter!');
      expect(PengalamanViewModel.validasiNamaKegiatan('PIMNAS 37'), isNull);
    });

    test('Validasi Anti-Duplikasi: Kombinasi Nama + Peran + Tahun', () {
      final listUji = [
        PengalamanModel(
          namaKegiatan: 'BEM KM UNAND',
          peran: 'Staf Muda',
          tahun: '2023',
          deskripsi: 'Magang organisasi',
        ),
      ];

      // 1. Data sama persis (Nama + Peran + Tahun sama) -> Ditolak
      expect(
        PengalamanViewModel.isDuplikatKombinasi(
          nama: 'bem km unand',
          peran: 'staf muda',
          tahun: '2023',
          terdaftar: listUji,
        ),
        isTrue,
      );

      // 2. Kegiatan sama tapi peran beda -> Diizinkan
      expect(
        PengalamanViewModel.isDuplikatKombinasi(
          nama: 'BEM KM UNAND',
          peran: 'Menteri Kominfo',
          tahun: '2024',
          terdaftar: listUji,
        ),
        isFalse,
      );

      // 3. Kegiatan dan peran sama tapi tahun beda -> Diizinkan
      expect(
        PengalamanViewModel.isDuplikatKombinasi(
          nama: 'BEM KM UNAND',
          peran: 'Staf Muda',
          tahun: '2024',
          terdaftar: listUji,
        ),
        isFalse,
      );

      // 4. Kegiatan baru -> Diizinkan
      expect(
        PengalamanViewModel.isDuplikatKombinasi(
          nama: 'PIMNAS 37',
          peran: 'Ketua Tim',
          tahun: '2024',
          terdaftar: listUji,
        ),
        isFalse,
      );
    });

    test('Validasi Peran: Wajib diisi', () {
      expect(PengalamanViewModel.validasiPeran(null), 'Peran wajib diisi!');
      expect(PengalamanViewModel.validasiPeran(''), 'Peran wajib diisi!');
      expect(PengalamanViewModel.validasiPeran('Ketua Tim'), isNull);
    });

    test('Validasi Tahun: Wajib diisi, angka valid, rentang 2000-2026', () {
      expect(PengalamanViewModel.validasiTahun(null), 'Tahun wajib diisi!');
      expect(PengalamanViewModel.validasiTahun('bukan_angka'), 'Tahun harus berupa angka valid!');
      expect(PengalamanViewModel.validasiTahun('1999'), 'Masukkan tahun antara 2000 - 2026!');
      expect(PengalamanViewModel.validasiTahun('2027'), 'Masukkan tahun antara 2000 - 2026!');
      expect(PengalamanViewModel.validasiTahun('2024'), isNull);
    });
  });

  // Widget Test: Alur workflow lengkap aplikasi
  testWidgets('Widget Test: Empty State -> Tambah -> Validasi -> Loading -> Sukses -> Tampil Kartu',
      (WidgetTester tester) async {
    // 1. Verifikasi Empty State
    await tester.pumpWidget(const MyTeamApp());
    expect(find.text('Daftar Pengalaman'), findsOneWidget);
    expect(find.text('Belum Ada Pengalaman'), findsOneWidget);

    // 2. Navigasi ke Form Tambah
    await tester.tap(find.text('Tambah Pengalaman'));
    await tester.pumpAndSettle();
    expect(find.text('Form Riwayat Kegiatan'), findsOneWidget);

    // 3. Uji validasi saat form disubmit kosong
    final tombolSimpan = find.text('Simpan Pengalaman');
    await tester.ensureVisible(tombolSimpan);
    await tester.tap(tombolSimpan);
    await tester.pump();
    expect(find.text('Nama kegiatan wajib diisi!'), findsOneWidget);
    expect(find.text('Peran wajib diisi!'), findsOneWidget);
    expect(find.text('Tahun wajib diisi!'), findsOneWidget);

    // 4. Input data valid
    final textFields = find.byType(TextFormField);
    await tester.enterText(textFields.at(0), 'PIMNAS 37');
    await tester.enterText(textFields.at(1), 'Ketua Tim');
    await tester.enterText(textFields.at(2), '2025');
    await tester.enterText(textFields.at(3), 'Mengembangkan aplikasi mobile dan analisis data.');

    // 5. Submit dan verifikasi loading
    await tester.ensureVisible(tombolSimpan);
    await tester.tap(tombolSimpan);
    await tester.pump();
    expect(find.text('Menyimpan...'), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 750));
    await tester.pumpAndSettle();

    // 6. Verifikasi dialog sukses
    expect(find.text('Pengalaman disimpan!'), findsOneWidget);

    // 7. Kembali ke halaman utama dan verifikasi data baru
    await tester.tap(find.text('Lihat Daftar Pengalaman'));
    await tester.pumpAndSettle();

    expect(find.text('PIMNAS 37'), findsOneWidget);
    expect(find.text('Ketua Tim'), findsOneWidget);
    expect(find.text('2025'), findsOneWidget);
  });
}

