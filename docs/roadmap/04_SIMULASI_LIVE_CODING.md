# 🟢 CHECKPOINT 04: SIMULASI LIVE-CODING CHALLENGE
> **Target Skor:** 25 Poin (Kemampuan Modifikasi Kode)  
> **Fokus Utama:** Mampu melakukan perubahan kode secara cepat, tepat, dan memahami dampaknya saat dosen memberikan instruksi spontan *"Coba ubah..."*.

---

## 💡 STRATEGI MENGHADAPI LIVE-CODING
1. **Jangan Panik:** Dengarkan baik-baik instruksi dosen.
2. **Ketahui File yang Relevan:**
   - Masalah aturan/logika validasi $\rightarrow$ Buka `lib/viewmodels/pengalaman_viewmodel.dart`.
   - Masalah struktur data $\rightarrow$ Buka `lib/models/pengalaman_model.dart`.
   - Masalah tampilan form & controller $\rightarrow$ Buka `lib/screens/tambah_pengalaman_screen.dart`.
   - Masalah tampilan kartu & daftar $\rightarrow$ Buka `lib/screens/daftar_pengalaman_screen.dart`.
3. **Kamu Boleh Menggunakan AI Coding Assistant:** Di panduan resmi tertulis jelas: *"Mahasiswa diperbolehkan dan diarahkan menggunakan AI coding assistant jika diminta."*

---

## 🛠️ SKENARIO 1: DOSEN MEMINTA MENGUBAH ATURAN VALIDASI
> **Instruksi Dosen:** *"Coba ubah aturan tahun, sekarang hanya boleh dari tahun 2010 sampai 2030."* atau *"Coba ubah nama kegiatan minimal harus 5 karakter."*

### Langkah Eksekusi Cepat:
1. Buka file: **`lib/viewmodels/pengalaman_viewmodel.dart`**
2. Cari method `validasiTahun` (sekitar baris 115):
   ```dart
   // SEBELUM:
   if (tahun < 2000 || tahun > 2026) {
     return 'Masukkan tahun antara 2000 - 2026!';
   }

   // SESUDAH:
   if (tahun < 2010 || tahun > 2030) {
     return 'Masukkan tahun antara 2010 - 2030!';
   }
   ```
3. Tekan **Save (`Ctrl + S`)** $\rightarrow$ Hot Reload berjalan otomatis di HP $\rightarrow$ Langsung demokan di form bahwa tahun 2005 sekarang ditolak!

---

## 🛠️ SKENARIO 2: DOSEN MEMINTA MENGGANTI DIALOG MENJADI SNACKBAR
> **Instruksi Dosen:** *"Coba hilangkan popup dialog suksesnya, ganti agar langsung kembali ke halaman utama dan menampilkan SnackBar saja."*

### Langkah Eksekusi Cepat:
1. Buka file: **`lib/screens/tambah_pengalaman_screen.dart`**
2. Cari bagian `showDialog` di dalam method `_submitForm()` (sekitar baris 130).
3. Ganti blok `showDialog(...)` menjadi langsung `Navigator.pop(context, newPengalaman)`:
   ```dart
   // SEBELUM:
   showDialog(
     context: context,
     barrierDismissible: false,
     builder: (ctx) => AlertDialog(... Navigator.pop(context, newPengalaman) ...),
   );

   // SESUDAH (Hapus dialog, langsung kembalikan data):
   Navigator.pop(context, newPengalaman);
   ```
4. Tekan **Save (`Ctrl + S`)** $\rightarrow$ Saat form disimpan, aplikasi langsung kembali ke layar utama tanpa dialog!

---

## 🛠️ SKENARIO 3: DOSEN MEMINTA MENAMBAH FIELD BARU ("PENYELENGGARA")
> **Instruksi Dosen:** *"Coba tambahkan satu inputan baru: Penyelenggara Kegiatan (misal: Kemendikbud, HMIF, dll)."*

### Langkah Eksekusi Terstruktur:
1. **Langkah 1: Tambah properti di Model (`lib/models/pengalaman_model.dart`):**
   ```dart
   class PengalamanModel {
     final String namaKegiatan;
     final String peran;
     final String tahun;
     final String deskripsi;
     final String penyelenggara; // <-- Tambah ini

     PengalamanModel({
       required this.namaKegiatan,
       required this.peran,
       required this.tahun,
       required this.deskripsi,
       required this.penyelenggara, // <-- Tambah ini
     });
   ```
2. **Langkah 2: Tambah controller di Form (`lib/screens/tambah_pengalaman_screen.dart`):**
   ```dart
   final _penyelenggaraController = TextEditingController(); // Deklarasi

   @override
   void dispose() {
     _penyelenggaraController.dispose(); // Jangan lupa dispose! (Poin plus di mata dosen)
     ...
   }
   ```
3. **Langkah 3: Tambah TextFormField di Form:**
   ```dart
   TextFormField(
     controller: _penyelenggaraController,
     decoration: _buildInputDecoration(hintText: 'Masukkan penyelenggara', icon: Icons.business),
     validator: (v) => v == null || v.isEmpty ? 'Penyelenggara wajib diisi!' : null,
   ),
   ```
4. **Langkah 4: Masukkan ke objek PengalamanModel saat simpan:**
   ```dart
   final newPengalaman = PengalamanModel(
     namaKegiatan: _namaController.text.trim(),
     peran: _peranController.text.trim(),
     tahun: _tahunController.text.trim(),
     deskripsi: _deskripsiController.text.trim(),
     penyelenggara: _penyelenggaraController.text.trim(), // <-- Masukkan ini
   );
   ```
5. **Langkah 5: Tampilkan di Kartu (`lib/screens/daftar_pengalaman_screen.dart`):**
   ```dart
   Text('Penyelenggara: ${item.penyelenggara}'),
   ```

---

## 🛠️ SKENARIO 4: DOSEN MEMINTA MENGUBAH AKSEN WARNA ATAU TAMPILAN
> **Instruksi Dosen:** *"Coba ganti warna aksen kartu atau tombolnya jadi warna biru atau orange."*

### Langkah Eksekusi Cepat:
* **Ganti Warna Global di `lib/main.dart`:**
  ```dart
  seedColor: Colors.blue, // Atau Colors.deepOrange
  ```
* **Ganti Aksen Hijau Unand di Kartu (`daftar_pengalaman_screen.dart`):**
  Cari `Color(0xFF006400)` $\rightarrow$ Ganti menjadi `Colors.blue` atau `Colors.indigo`.

---
👉 **Langkah Selanjutnya:** Pelajari cara menyusun prompt ke AI jika dosen menyuruhmu menggunakan AI untuk menyelesaikan modifikasi di atas: [**05_FORMULA_PROMPTING_AI.md**](./05_FORMULA_PROMPTING_AI.md).
