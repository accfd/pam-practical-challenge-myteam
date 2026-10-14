/// Model data untuk menampung entitas Pengalaman Mahasiswa (FR-05)
class PengalamanModel {
  final String namaKegiatan;
  final String peran;
  final String tahun;
  final String deskripsi;

  PengalamanModel({
    required this.namaKegiatan,
    required this.peran,
    required this.tahun,
    required this.deskripsi,
  });
}