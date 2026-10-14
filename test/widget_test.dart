import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myteam_app/main.dart';
import 'package:myteam_app/models/pengalaman_model.dart';
import 'package:myteam_app/viewmodels/pengalaman_viewmodel.dart';

/// ==============================================================================
/// SUITE PENGUJIAN OTOMATIS (AUTOMATED TESTING)
/// ==============================================================================
/// Memverifikasi fungsionalitas dan ketangguhan kode secara otomatis.
/// Terdiri dari 2 kategori pengujian:
/// 1. [Unit Test]: Pengujian logika fungsi murni secara terisolasi tanpa antarmuka.
/// 2. [Widget Test]: Pengujian interaksi komponen antarmuka dan alur navigasi pengguna.
void main() {
  /// ----------------------------------------------------------------------------
  /// KATEGORI 1: UNIT TEST LOGIKA BISNIS VIEWMODEL
  /// ----------------------------------------------------------------------------
  /// Menguji aturan validasi data di [PengalamanViewModel] (Modul 3 Section 3).
  /// Karena logika bisnis dipisahkan dari UI (MVVM), pengujian ini berjalan sangat
  /// cepat dalam hitungan milidetik.
  group('Unit Test: Validasi Bisnis di PengalamanViewModel (MVVM)', () {
    test('Validasi Nama Kegiatan: Wajib diisi dan min 3 karakter', () {
      expect(PengalamanViewModel.validasiNamaKegiatan(null), 'Nama kegiatan wajib diisi!');
      expect(PengalamanViewModel.validasiNamaKegiatan('   '), 'Nama kegiatan wajib diisi!');
      expect(PengalamanViewModel.validasiNamaKegiatan('PI'), 'Nama kegiatan minimal 3 karakter!');
      expect(PengalamanViewModel.validasiNamaKegiatan('PIMNAS 37'), isNull);
    });

    test('Validasi Anti-Duplikasi Cerdas: Kombinasi Nama + Peran + Tahun', () {
      final listUji = [
        PengalamanModel(
          namaKegiatan: 'BEM KM UNAND',
          peran: 'Staf Muda',
          tahun: '2023',
          deskripsi: 'Magang organisasi',
        ),
      ];

      // 1. Data 100% sama persis (Nama + Peran + Tahun sama) -> Ditolak (true)
      expect(
        PengalamanViewModel.isDuplikatKombinasi(
          nama: 'bem km unand',
          peran: 'staf muda',
          tahun: '2023',
          terdaftar: listUji,
        ),
        isTrue,
      );

      // 2. Kegiatan sama tapi peran beda (Promosi jabatan) -> Diizinkan (false)
      expect(
        PengalamanViewModel.isDuplikatKombinasi(
          nama: 'BEM KM UNAND',
          peran: 'Menteri Kominfo',
          tahun: '2024',
          terdaftar: listUji,
        ),
        isFalse,
      );

      // 3. Kegiatan dan peran sama tapi tahun beda (Menjabat 2 periode) -> Diizinkan (false)
      expect(
        PengalamanViewModel.isDuplikatKombinasi(
          nama: 'BEM KM UNAND',
          peran: 'Staf Muda',
          tahun: '2024',
          terdaftar: listUji,
        ),
        isFalse,
      );

      // 4. Kegiatan sepenuhnya baru -> Diizinkan (false)
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

    test('Validasi Tahun: Wajib diisi, angka valid, dan batas 2000-2026', () {
      expect(PengalamanViewModel.validasiTahun(null), 'Tahun wajib diisi!');
      expect(PengalamanViewModel.validasiTahun('bukan_angka'), 'Tahun harus berupa angka valid!');
      expect(PengalamanViewModel.validasiTahun('1999'), 'Masukkan tahun antara 2000 - 2026!');
      expect(PengalamanViewModel.validasiTahun('2027'), 'Masukkan tahun antara 2000 - 2026!');
      expect(PengalamanViewModel.validasiTahun('2024'), isNull);
    });
  });

  /// ----------------------------------------------------------------------------
  /// KATEGORI 2: WIDGET TEST ALUR WORKFLOW LENGKAP
  /// ----------------------------------------------------------------------------
  /// [Widget Test]:
  /// Menguji interaksi komponen UI dan alur 5 tahap Practical Challenge:
  /// [Empty State] -> [Navigasi Form] -> [Validasi] -> [Loading] -> [Sukses] -> [Render Kartu Baru].
  testWidgets('Widget Test Workflow: Empty State -> Tambah Pengalaman -> Validasi -> Loading -> Sukses -> Render Kartu Baru',
      (WidgetTester tester) async {
    /// [tester.pumpWidget]: Membangun dan merender pohon widget MyTeamApp di lingkungan pengujian
    await tester.pumpWidget(const MyTeamApp());
    expect(find.text('Daftar Pengalaman'), findsOneWidget);
    expect(find.text('Belum Ada Pengalaman'), findsOneWidget);

    /// [tester.tap & pumpAndSettle]: Menekan tombol dan menunggu seluruh animasi transisi layar selesai
    await tester.tap(find.text('Tambah Pengalaman'));
    await tester.pumpAndSettle();
    expect(find.text('Form Riwayat Kegiatan'), findsOneWidget);

    /// Menguji validasi saat form disubmit dalam kondisi kosong
    final tombolSimpan = find.text('Simpan Pengalaman');
    await tester.ensureVisible(tombolSimpan);
    await tester.tap(tombolSimpan);
    await tester.pump();
    expect(find.text('Nama kegiatan wajib diisi!'), findsOneWidget);
    expect(find.text('Peran wajib diisi!'), findsOneWidget);
    expect(find.text('Tahun wajib diisi!'), findsOneWidget);

    /// Mengisi input data valid ke setiap kolom
    final textFields = find.byType(TextFormField);
    await tester.enterText(textFields.at(0), 'PIMNAS 37');
    await tester.enterText(textFields.at(1), 'Ketua Tim');
    await tester.enterText(textFields.at(2), '2025');
    await tester.enterText(textFields.at(3), 'Mengembangkan aplikasi mobile dan analisis data.');

    /// Menekan tombol simpan -> Memverifikasi kemunculan status proses (Loading/Spinner)
    await tester.ensureVisible(tombolSimpan);
    await tester.tap(tombolSimpan);
    await tester.pump(); // Render frame pertama saat _isLoading = true
    expect(find.text('Menyimpan...'), findsOneWidget);

    /// Menyelesaikan simulasi durasi jeda loading 700ms
    await tester.pump(const Duration(milliseconds: 750));
    await tester.pumpAndSettle();

    /// Memverifikasi feedback sukses (Modal Success Dialog) muncul di layar
    expect(find.text('Pengalaman disimpan!'), findsOneWidget);

    /// Menekan tombol dialog untuk mengembalikan hasil ke DaftarPengalamanScreen
    await tester.tap(find.text('Lihat Daftar Pengalaman'));
    await tester.pumpAndSettle();

    /// Memverifikasi data baru telah berhasil dirender sebagai kartu di halaman utama
    expect(find.text('PIMNAS 37'), findsOneWidget);
    expect(find.text('Ketua Tim'), findsOneWidget);
    expect(find.text('2025'), findsOneWidget);
  });
}
