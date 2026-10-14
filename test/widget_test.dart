import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myteam_app/main.dart';
import 'package:myteam_app/viewmodels/pengalaman_viewmodel.dart';

void main() {
  group('Unit Test: Validasi Bisnis di PengalamanViewModel (MVVM)', () {
    test('Validasi Nama Kegiatan: Wajib diisi, min 3 karakter, dan anti-duplikasi', () {
      expect(PengalamanViewModel.validasiNamaKegiatan(null), 'Nama kegiatan wajib diisi!');
      expect(PengalamanViewModel.validasiNamaKegiatan('   '), 'Nama kegiatan wajib diisi!');
      expect(PengalamanViewModel.validasiNamaKegiatan('PI'), 'Nama kegiatan minimal 3 karakter!');
      expect(
        PengalamanViewModel.validasiNamaKegiatan('PIMNAS', terdaftar: ['pimnas']),
        'Kegiatan "PIMNAS" sudah terdaftar di portofolio!',
      );
      expect(PengalamanViewModel.validasiNamaKegiatan('Gemastik', terdaftar: ['pimnas']), isNull);
    });

    test('Validasi Peran: Wajib diisi', () {
      expect(PengalamanViewModel.validasiPeran(null), 'Peran wajib diisi!');
      expect(PengalamanViewModel.validasiPeran(''), 'Peran wajib diisi!');
      expect(PengalamanViewModel.validasiPeran('Ketua Tim'), isNull);
    });

    test('Validasi Tahun: Wajib diisi, angka valid, dan batas 2000-2026', () {
      expect(PengalamanViewModel.validasiTahun(null), 'Tahun wajib diisi!');
      expect(PengalamanViewModel.validasiTahun('bukan_angka'), 'Tahun harus berupa angka valid!');
      expect(PengalamanViewModel.validasiTahun('1999'), 'Masukkan tahun antara 2000 - 2026!');
      expect(PengalamanViewModel.validasiTahun('2027'), 'Masukkan tahun antara 2000 - 2026!');
      expect(PengalamanViewModel.validasiTahun('2024'), isNull);
    });
  });

  testWidgets('Widget Test Workflow: Empty State -> Tambah Pengalaman -> Validasi -> Loading -> Sukses -> Render Kartu Baru',
      (WidgetTester tester) async {
    // 1. Build app and verify initial empty state
    await tester.pumpWidget(const MyTeamApp());
    expect(find.text('Daftar Pengalaman'), findsOneWidget);
    expect(find.text('Belum Ada Pengalaman'), findsOneWidget);

    // 2. Tap Tambah Pengalaman
    await tester.tap(find.text('Tambah Pengalaman'));
    await tester.pumpAndSettle();
    expect(find.text('Form Riwayat Kegiatan'), findsOneWidget);

    // 3. Test Validasi saat form kosong
    final tombolSimpan = find.text('Simpan Pengalaman');
    await tester.ensureVisible(tombolSimpan);
    await tester.tap(tombolSimpan);
    await tester.pump();
    expect(find.text('Nama kegiatan wajib diisi!'), findsOneWidget);
    expect(find.text('Peran wajib diisi!'), findsOneWidget);
    expect(find.text('Tahun wajib diisi!'), findsOneWidget);

    // 4. Masukkan data valid
    final textFields = find.byType(TextFormField);
    await tester.enterText(textFields.at(0), 'PIMNAS 37');
    await tester.enterText(textFields.at(1), 'Ketua Tim');
    await tester.enterText(textFields.at(2), '2025');
    await tester.enterText(textFields.at(3), 'Mengembangkan aplikasi mobile dan analisis data.');

    // 5. Submit Form -> Muncul feedback PROSES (Loading)
    await tester.ensureVisible(tombolSimpan);
    await tester.tap(tombolSimpan);
    await tester.pump(); // Frame pertama saat _isLoading = true
    expect(find.text('Menyimpan...'), findsOneWidget);

    // 6. Selesaikan durasi loading 700ms
    await tester.pump(const Duration(milliseconds: 750));
    await tester.pumpAndSettle();

    // 7. Feedback SUKSES muncul (Modal Dialog)
    expect(find.text('Pengalaman disimpan!'), findsOneWidget);

    // 8. Tap 'Lihat Daftar Pengalaman' (Pop Result ke DaftarPengalamanScreen)
    await tester.tap(find.text('Lihat Daftar Pengalaman'));
    await tester.pumpAndSettle();

    // 9. Kembali ke halaman utama, data baru berhasil dirender dalam list!
    expect(find.text('PIMNAS 37'), findsOneWidget);
    expect(find.text('Ketua Tim'), findsOneWidget);
    expect(find.text('2025'), findsOneWidget);
  });
}
