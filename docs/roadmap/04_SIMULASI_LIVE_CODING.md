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
> **Instruksi Dosen:** *"Coba tambahkan satu field input baru: Penyelenggara Kegiatan (misal: Kemendikbud, HMIF, BEM, dll) dan tampilkan di kartu halaman utama!"*

> [!TIP]
> **Trik Rahasia Mahasiswa Cerdas (Anti-Error):**
> Gunakan nilai default `this.penyelenggara = ''` di Model. Jangan gunakan `required`! Dengan cara ini, file pengujian otomatis (`test/widget_test.dart`) dan kode lama tidak akan mendadak merah/error compile karena ketiadaan parameter.

---

### Langkah Eksekusi Lengkap (Runtut 3 File):

#### 1. File 1: Model (`lib/models/pengalaman_model.dart`)
Tambahkan atribut `penyelenggara` dengan default value:
```dart
class PengalamanModel {
  final String namaKegiatan;
  final String peran;
  final String tahun;
  final String deskripsi;
  final String penyelenggara; // 1. Tambah variabel properti

  PengalamanModel({
    required this.namaKegiatan,
    required this.peran,
    required this.tahun,
    required this.deskripsi,
    this.penyelenggara = '', // 2. Tambah di constructor (beri default '')
  });

  factory PengalamanModel.fromJson(Map<String, dynamic> json) {
    return PengalamanModel(
      namaKegiatan: json['namaKegiatan'] as String? ?? '',
      peran: json['peran'] as String? ?? '',
      tahun: json['tahun'] as String? ?? '',
      deskripsi: json['deskripsi'] as String? ?? '',
      penyelenggara: json['penyelenggara'] as String? ?? '', // 3. Tambah di fromJson
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namaKegiatan': namaKegiatan,
      'peran': peran,
      'tahun': tahun,
      'deskripsi': deskripsi,
      'penyelenggara': penyelenggara, // 4. Tambah di toJson
    };
  }
}
```

---

#### 2. File 2: Form Tambah (`lib/screens/tambah_pengalaman_screen.dart`)
Ada 4 titik yang perlu disentuh:

* **Titik A (Deklarasi Controller - di bawah `_tahunController`):**
  ```dart
  final _penyelenggaraController = TextEditingController();
  ```

* **Titik B (Dispose - di dalam `dispose()`):**
  ```dart
  _penyelenggaraController.dispose();
  ```

* **Titik C (Form Input Widget - letakkan di bawah TextFormField Tahun):**
  ```dart
  const SizedBox(height: 16),
  const Text('Penyelenggara', style: TextStyle(fontWeight: FontWeight.w600)),
  const SizedBox(height: 8),
  TextFormField(
    controller: _penyelenggaraController,
    enabled: !_isLoading,
    decoration: _buildInputDecoration(
      hintText: 'Contoh: Kemendikbud / HMIF UNAND',
      icon: Icons.business_outlined,
    ),
    validator: (value) {
      if (value == null || value.trim().isEmpty) {
        return 'Penyelenggara wajib diisi!';
      }
      return null;
    },
  ),
  ```

* **Titik D (Kirim Data - di method `_submitForm()` saat membuat `PengalamanModel`):**
  ```dart
  final newPengalaman = PengalamanModel(
    namaKegiatan: namaInput,
    peran: peranInput,
    tahun: tahunInput,
    deskripsi: _deskripsiController.text.trim(),
    penyelenggara: _penyelenggaraController.text.trim(), // <-- Tambahkan baris ini
  );
  ```

---

#### 3. File 3: Tampilan Kartu (`lib/screens/daftar_pengalaman_screen.dart`)
Tampilkan data penyelenggara di dalam kartu pengalaman (di bawah baris Tahun):
```dart
// 3. Tahun Pelaksanaan
Row(
  children: [
    const Icon(Icons.calendar_today_outlined, color: Colors.grey, size: 16),
    const SizedBox(width: 6),
    Text(item.tahun, style: const TextStyle(color: Colors.grey)),
  ],
),

// TAMBAHKAN INI (Penyelenggara):
if (item.penyelenggara.isNotEmpty) ...[
  const SizedBox(height: 4),
  Row(
    children: [
      const Icon(Icons.business_outlined, color: Colors.grey, size: 16),
      const SizedBox(width: 6),
      Text(
        item.penyelenggara,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
    ],
  ),
],
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

