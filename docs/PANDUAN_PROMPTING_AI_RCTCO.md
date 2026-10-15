# 🤖 PANDUAN LENGKAP PROMPTING AI CODING (METODE R-C-T-C-O)
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5) — Universitas Andalas  
> **Komponen Penilaian:** Kemampuan Pemanfaatan AI dalam Pemrograman (**Bobot 20%**)  
> **Target Capaian:** **Excellent (4 Poin Penuh)** — *"Prompt jelas, spesifik, memiliki konteks dan menghasilkan solusi relevan"*  
> **Aplikasi:** MyTeam App (Fitur Portofolio Pengalaman Mahasiswa)

---

## 🏆 1. MEMAHAMI RUBRIK PENILAIAN DOSEN (BOBOT 20%)

Saat dosen memberikan perintah spontan seperti *"Coba buat prompt untuk mengubah bagian X..."*, dosen menilai dengan rubrik berikut:

```text
┌─────────────────┬──────────┬────────────────────────────────────────────────────────────────────────┐
│ Tingkat Skor    │ Poin     │ Kriteria Penilaian Dosen                                               │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ 🌟 Excellent    │ 4 Poin   │ Prompt jelas, spesifik, memiliki konteks, batasan teknis kuat,         │
│                 │          │ dan langsung menghasilkan solusi yang relevan tanpa bolak-balik error. │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ 👍 Good         │ 3 Poin   │ Prompt cukup jelas, solusi sesuai, tapi konteks/batasan kurang lengkap.│
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ ⚠️ Fair         │ 2 Poin   │ Prompt terlalu umum/singkat, kurang konteks, butuh beberapa perbaikan. │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ ❌ Poor         │ 1 Poin   │ Tidak mampu menyusun prompt yang relevan atau tidak paham kode AI.     │
└─────────────────┴──────────┴────────────────────────────────────────────────────────────────────────┘
```

> [!IMPORTANT]
> **Kunci 4 Poin (Excellent):** Jangan pernah hanya mengetik satu kalimat pendek seperti *"tolong pindahin tombolnya ke atas"*. Dosen ingin melihat kamu menguasai **Framework Komunikasi Profesional dengan AI (R-C-T-C-O)**.

---

## 📐 2. RUMUS RESMI: METODE R-C-T-C-O

Gunakan rumus paten 5 elemen ini setiap kali diminta membuat prompt:

$$\mathbf{PROMPT} = \mathbf{Role} + \mathbf{Context} + \mathbf{Task} + \mathbf{Constraints} + \mathbf{Output}$$

```text
┌─────────────────────────┬──────────────────────────────────────────────────────────────────────────┐
│ ELEMEN                  │ PENJELASAN & KALIMAT TEMPLATE                                            │
├─────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
│ 1. Role (Peran)         │ "Bertindaklah sebagai Senior Flutter Developer ahli Material 3."         │
│ 2. Context (Konteks)    │ "Saya sedang mengerjakan aplikasi Flutter 'MyTeam' untuk portofolio      │
│                         │  mahasiswa UNAND dengan arsitektur MVVM (Model-View-ViewModel)."         │
│ 3. Task (Tugas)         │ [Tugas spesifik dari dosen, sebutkan NAMA FILE dan WIDGET-nya]           │
│ 4. Constraints (Batasan)│ "Gunakan Sound Null Safety, jangan gunakan library pihak ketiga baru,    │
│                         │  pertahankan validasi MVVM yang sudah ada."                              │
│ 5. Output (Format)      │ "Berikan potongan kode Flutter/Dart (Before vs After) yang bersih dan     │
│                         │  jelaskan letak baris perubahannya."                                     │
└─────────────────────────┴──────────────────────────────────────────────────────────────────────────┘
```

> [!TIP]
> **Tips Cepat di Depan Dosen:**
> Elemen **Role (R)**, **Context (C)**, **Constraints (C)**, dan **Output (O)** itu **HAMPIR SELALU SAMA** untuk setiap kasus.  
> Yang kamu ubah secara spontan hanyalah **Task (T)** sesuai instruksi dosen!

---

## 🎯 3. TEMPLATE PROMPT MASTER (HAFALKAN INI!)

Jika dosen menyuruhmu mengetik prompt langsung:

```text
[ROLE]
Bertindaklah sebagai Senior Flutter Developer.

[CONTEXT]
Saya sedang mengembangkan aplikasi Flutter 'MyTeam' (Fitur Portofolio Pengalaman Mahasiswa) dengan Material 3 dan arsitektur MVVM tanpa third-party state library.

[TASK]
[ISI DENGAN TUGAS SPESIFIK DARI DOSEN DI SINI]

[CONSTRAINTS]
- Terapkan Sound Null Safety dan best practices Flutter.
- Jangan gunakan package/library pihak ketiga baru.
- Jangan merusak fungsionalitas dan unit test yang sudah ada.

[OUTPUT]
Hanya berikan potongan kode Dart/Flutter yang perlu diubah dan tunjukkan lokasi file serta fungsinya.
```

---

## 🚀 4. KEMUNGKINAN INSTRUKSI SPONTAN DOSEN & CONTOH PROMPT R-C-T-C-O

Berikut adalah kumpulan simulasi kasus nyata yang sering ditanyakan dosen penguji:

---

### 📌 KASUS 1: "Coba pindahin tombol Simpan-nya ke paling atas!" (Kasus Teman)
*Instruksi Dosen:* *"Coba tombol simpan pengalaman di layar form jangan di bawah, pindahin ke bagian paling atas form sebelum field judul, atau pindahin ke tombol ceklis di AppBar atas."*

#### Opsi A: Pindahkan Tombol ke Atas Form (Sebelum Input Judul)
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Saya sedang mengembangkan aplikasi Flutter 'MyTeam' pada file lib/screens/tambah_pengalaman_screen.dart. Saat ini tombol 'Simpan Pengalaman' (ElevatedButton) berada di bagian paling bawah form di dalam ListView.

Task:
Pindahkan widget tombol 'Simpan Pengalaman' tersebut ke posisi paling atas form, yaitu tepat sebelum input TextFormField 'Judul Pengalaman'. Tambahkan SizedBox(height: 16) sebagai pemisah di bawah tombol.

Constraints:
- Pertahankan validasi FormState (_formKey.currentState!.validate()) dan pemanggilan ViewModel.
- Pastikan logika loading indicator (_isLoading ? CircularProgressIndicator : Text) tetap berfungsi normal.
- Gunakan Sound Null Safety.

Output:
Berikan potongan kode method build() pada Form di TambahPengalamanScreen yang menunjukkan tata letak widget sebelum dan sesudah dipindahkan.
```

#### Opsi B: Pindahkan Tombol Menjadi Action Icon di AppBar Atas
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Pada file lib/screens/tambah_pengalaman_screen.dart, saya memiliki tombol simpan di bagian bawah form. Saya ingin memindahkannya ke header atas (AppBar).

Task:
Pindahkan aksi simpan form ke dalam property 'actions' di AppBar berupa IconButton dengan icon Icons.check (atau Icons.save). Hapus ElevatedButton lama yang berada di bawah form.

Constraints:
- Jika sedang loading (_isLoading == true), tampilkan CircularProgressIndicator kecil di AppBar.
- Logika validasi form dan penyimpanan data tetap harus berjalan identik.
- Jangan menggunakan library eksternal.

Output:
Berikan potongan kode AppBar dan bagian ListView form setelah tombol lama dihapus.
```

---

### 📌 KASUS 2: "Pindahkan Tombol Tambah ke AppBar!" (Layar Daftar Pengalaman)
*Instruksi Dosen:* *"Di halaman daftar pengalaman, tombol Tambah Pengalaman ada di empty state atau FloatingActionButton. Coba pindahin tombol tambahnya ke AppBar di pojok kanan atas."*

#### Prompt R-C-T-C-O:
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Saya sedang mengerjakan aplikasi 'MyTeam' pada file lib/screens/daftar_pengalaman_screen.dart. Layar ini menampilkan daftar portofolio pengalaman mahasiswa UNAND.

Task:
Tambahkan tombol aksi tambah di AppBar (property actions) berupa IconButton dengan icon Icons.add. Ketika icon ini diklik, navigasikan user ke TambahPengalamanScreen menggunakan Navigator.push dan tangani hasil kembalian (newPengalaman) untuk ditambahkan ke ViewModel.

Constraints:
- Pertahankan Empty State yang sudah ada di body ListView.
- Gunakan Material 3 IconButton dengan tooltip 'Tambah Pengalaman'.
- Terapkan async-await pada proses navigasi.

Output:
Tampilkan potongan kode widget AppBar pada file lib/screens/daftar_pengalaman_screen.dart.
```

---

### 📌 KASUS 3: "Coba ubah aturan validasi tahunnya!"
*Instruksi Dosen:* *"Sekarang tahun dibatasi 2000 sampai 2026. Coba ubah aturannya jadi hanya menerima tahun 2010 sampai 2030, dan kalau salah pesannya harus sesuai."*

#### Prompt R-C-T-C-O:
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Pada aplikasi Flutter 'MyTeam', logika validasi form dipisahkan ke dalam ViewModel di file lib/viewmodels/pengalaman_viewmodel.dart sesuai kaidah MVVM.

Task:
Modifikasi method 'validateTahun(String? value)' agar hanya menerima input angka tahun antara rentang 2010 sampai 2030 (inklusif). Jika di luar rentang tersebut atau bukan angka, kembalikan pesan error: 'Masukkan tahun valid antara 2010 - 2030!'.

Constraints:
- Gunakan int.tryParse() untuk menghindari exception crash jika input non-angka.
- Pertahankan validasi cek kosong (value == null || value.trim().isEmpty).
- Jangan mengubah method validasi lainnya.

Output:
Berikan kode lengkap fungsi validateTahun yang sudah diperbarui beserta contoh pemanggilannya di validator TextFormField.
```

---

### 📌 KASUS 4: "Coba tambahkan field baru 'Penyelenggara / Tempat'!"
*Instruksi Dosen:* *"Kalau mau nambah atribut baru di pengalaman, misalnya tempat atau instansi penyelenggara, gimana prompt ke AI-nya?"*

#### Prompt R-C-T-C-O:
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Aplikasi Flutter 'MyTeam' menggunakan arsitektur MVVM dengan file:
1. lib/models/pengalaman_model.dart
2. lib/screens/tambah_pengalaman_screen.dart
3. lib/screens/daftar_pengalaman_screen.dart

Task:
Tolong tambahkan field baru bernama 'penyelenggara' (String) ke dalam aplikasi:
1. Tambahkan properti 'penyelenggara' pada class PengalamanModel (beri default value empty string '' agar backward compatible).
2. Tambahkan TextEditingController dan TextFormField 'Penyelenggara' pada TambahPengalamanScreen.
3. Tampilkan penyelenggara tersebut pada Card di DaftarPengalamanScreen dengan icon Icons.business.

Constraints:
- Sound Null Safety aktif. Semua properti model harus final (immutable).
- Controller baru wajib di-dispose pada method dispose() untuk mencegah memory leak.
- Jangan merusak unit test yang sudah ada.

Output:
Berikan potongan kode spesifik untuk PengalamanModel, controller form, dan tampilan card.
```

---

### 📌 KASUS 5: "Ganti Dialog Sukses jadi SnackBar dan Langsung Kembali!"
*Instruksi Dosen:* *"Sekarang pas berhasil simpan kan muncul pop-up AlertDialog. Coba ubah supaya gak usah muncul dialog, tapi langsung balik ke halaman utama sambil munculin SnackBar hijau."*

#### Prompt R-C-T-C-O:
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Pada file lib/screens/tambah_pengalaman_screen.dart, aplikasi saat ini memanggil showDialog(AlertDialog) setelah form berhasil divalidasi dan jeda simulasi 700ms selesai.

Task:
Hapus AlertDialog tersebut. Ganti alurnya menjadi:
1. Langsung tutup form dan kirim data kembali ke layar utama menggunakan Navigator.pop(context, newPengalaman).
2. Tampilkan ScaffoldMessenger.of(context).showSnackBar dengan pesan 'Pengalaman berhasil ditambahkan!' berlatar belakang warna hijau.

Constraints:
- Gunakan pengecekan 'if (!mounted) return;' sebelum memanggil context navigasi/SnackBar.
- Data newPengalaman tetap harus terkirim sebagai return value pop agar kartu baru langsung muncul di halaman utama.

Output:
Tunjukkan potongan kode method submit form sebelum dan sesudah diubah.
```

---

### 📌 KASUS 6: "Ganti Tema Warna Aplikasi jadi Biru / Oranye!"
*Instruksi Dosen:* *"Aplikasi ini kan warnanya hijau UNAND. Coba ubah temanya ke warna biru laut atau oranye Material 3."*

#### Prompt R-C-T-C-O:
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Aplikasi 'MyTeam' dikonfigurasi di file lib/main.dart menggunakan ThemeData Material 3 (useMaterial3: true). Saat ini ColorScheme menggunakan seedColor hijau.

Task:
Ubah tema aplikasi menjadi bernuansa biru modern:
1. Ganti colorSchemeSeed menjadi Color(0xFF0284C7) (Light Blue / Ocean Blue).
2. Sesuaikan AppBarTheme agar menggunakan warna primer dengan teks dan icon berwarna putih.

Constraints:
- Pertahankan struktur MaterialApp dan property 'home: const DaftarPengalamanScreen()'.
- Gunakan Material 3 standard ColorScheme.fromSeed.

Output:
Berikan kode modifikasi ThemeData pada main.dart.
```

---

### 📌 KASUS 7: "Ada Error / Bug! Minta AI benerin!" (Debugging Prompt)
*Instruksi Dosen:* *"Kalau habis kamu edit kodenya malah merah atau error di terminal, gimana cara kamu nge-prompt AI supaya masalahnya cepat selesai?"*

#### Prompt R-C-T-C-O:
```text
Role:
Bertindaklah sebagai Flutter Debugging Specialist.

Context:
Saya sedang menjalankan aplikasi Flutter 'MyTeam'. Setelah memodifikasi file [Nama File, misal: lib/screens/tambah_pengalaman_screen.dart], muncul pesan error berikut di terminal/debug console:
---
[PASTE PESAN ERROR DARI TERMINAL DI SINI, MISAL: 'A RenderFlex overflowed by 24 pixels on the bottom']
---

Task:
1. Jelaskan secara singkat dan to-the-point apa penyebab utama error tersebut.
2. Berikan solusi perbaikan kode yang tepat pada baris yang bermasalah.

Constraints:
- Jangan merombak seluruh struktur widget jika hanya butuh perbaikan lokal (misal cukup membungkus Column dengan SingleChildScrollView).
- Berikan solusi yang mematuhi Material 3.

Output:
Jelaskan akar masalah dalam 2 kalimat, lalu berikan kode perbaikan dengan tanda komentar di baris yang diperbaiki.
```

---

## ⚖️ 5. PERBANDINGAN NILAI RUBRIK: DARI POOR HINGGA EXCELLENT

Agar Fuadi paham kenapa prompt metode R-C-T-C-O bernilai 4 Poin, perhatikan perbandingannya:

| Kasus | ❌ 1 Poin (Poor) | ⚠️ 2 Poin (Fair) | 👍 3 Poin (Good) | 🌟 4 Poin (Excellent - R-C-T-C-O) |
|---|---|---|---|---|
| **Pindah Tombol ke Atas** | *"Pindahin tombolnya ke atas"* *(AI bingung tombol apa, di layar mana, dan bisa merusak kode lain)* | *"Tolong pindahkan tombol simpan ke atas form di flutter"* *(Belum ada nama file, konteks arsitektur, atau batasan)* | *"Tolong pindahkan ElevatedButton simpan di TambahPengalamanScreen ke atas field judul, pertahankan validasinya."* *(Cukup baik, tapi belum ada batasan Sound Null Safety dan format output)* | **Role:** Senior Flutter Dev<br>**Context:** MyTeam App lib/screens/tambah_pengalaman_screen.dart MVVM<br>**Task:** Pindahkan ElevatedButton 'Simpan' ke atas field Judul + SizedBox(16)<br>**Constraints:** Pertahankan _formKey validate & loading indicator, Sound Null Safety<br>**Output:** Potongan kode build Form before vs after. |
| **Ubah Validasi Tahun** | *"Ubah tahun jadi 2030"* | *"Tolong ubah validasi tahun di flutter jadi 2010 sampai 2030"* | *"Ubah validasi tahun di file pengalaman_viewmodel.dart agar batasnya 2010-2030"* | **Role:** Senior Flutter Dev<br>**Context:** lib/viewmodels/pengalaman_viewmodel.dart<br>**Task:** Ubah rentang validasi 2010-2030 & perbarui pesan error<br>**Constraints:** Wajib int.tryParse, pertahankan cek null/empty<br>**Output:** Kode method validateTahun lengkap. |

---

## 🗣️ 6. CARA MENJAWAB DAN MENJELASKAN KE DOSEN

Ketika dosen bertanya:
> **Dosen:** *"Bagaimana cara kamu memanfaatkan AI untuk memodifikasi kode ini secara efektif tanpa merusak arsitektur aplikasi?"*

**Jawaban Mahasiswa (Fuadi - 4 Poin):**
> *"Izin menjawab Pak/Bu. Untuk memanfaatkan AI secara presisi dan menghasilkan kode yang langsung relevan, saya menggunakan rumus terstruktur **R-C-T-C-O**, yaitu:**
> 1. **Role:** Menentukan peran AI, misalnya sebagai Senior Flutter Developer.
> 2. **Context:** Memberikan konteks proyek, seperti aplikasi MyTeam, letak file yang diedit (`lib/screens/tambah_pengalaman_screen.dart`), dan arsitektur MVVM yang digunakan.
> 3. **Task:** Memberikan tugas yang sangat spesifik, misalnya memindahkan widget ElevatedButton simpan ke atas input judul.
> 4. **Constraints:** Memberikan batasan ketat, seperti wajib Sound Null Safety, jangan menggunakan library baru, dan jangan merusak fungsi `_formKey.currentState!.validate()`.
> 5. **Output:** Meminta AI hanya menampilkan potongan kode before-after beserta penjelasannya.
>
> *Dengan prompt R-C-T-C-O ini, AI tidak akan berasumsi liar, kode tidak akan merusak file lain, dan solusi yang dihasilkan langsung bisa saya terapkan dan uji dalam sekali jalan."*

---

## 🛠️ 7. CONTOH KODE NYATA: SEBELUM VS SESUDAH (KASUS PINDAH TOMBOL KE ATAS)

Jika dosen menyuruhmu langsung mengaplikasikan hasil AI untuk memindahkan tombol:

### 🔴 SEBELUM (Tombol di Paling Bawah Form):
```dart
// lib/screens/tambah_pengalaman_screen.dart
ListView(
  children: [
    TextFormField(controller: _judulController, ...), // Judul
    SizedBox(height: 16),
    TextFormField(controller: _peranController, ...), // Peran
    SizedBox(height: 16),
    TextFormField(controller: _tahunController, ...), // Tahun
    SizedBox(height: 16),
    TextFormField(controller: _deskripsiController, ...), // Deskripsi
    SizedBox(height: 24),
    // TOMBOL LAMA DI BAWAH:
    ElevatedButton(
      onPressed: _isLoading ? null : _submitForm,
      child: _isLoading ? CircularProgressIndicator() : Text('Simpan Pengalaman'),
    ),
  ],
)
```

### 🟢 SESUDAH (Tombol Dipindah ke Paling Atas Form):
```dart
// lib/screens/tambah_pengalaman_screen.dart
ListView(
  children: [
    // TOMBOL BARU DI PALING ATAS:
    ElevatedButton(
      key: const Key('btn_simpan_pengalaman'),
      onPressed: _isLoading ? null : _submitForm,
      child: _isLoading 
          ? const SizedBox(
              width: 20, 
              height: 20, 
              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
            ) 
          : const Text('Simpan Pengalaman'),
    ),
    const SizedBox(height: 16), // Jarak pemisah ke field pertama
    
    // Field input form di bawah tombol:
    TextFormField(controller: _judulController, ...), // Judul
    const SizedBox(height: 16),
    TextFormField(controller: _peranController, ...), // Peran
    const SizedBox(height: 16),
    TextFormField(controller: _tahunController, ...), // Tahun
    const SizedBox(height: 16),
    TextFormField(controller: _deskripsiController, ...), // Deskripsi
  ],
)
```

---

## ✅ KESIMPULAN & CEK KESIAPAN
1. File panduan ini mencakup rumus resmi **R-C-T-C-O**.
2. Tersedia solusi siap pakai untuk kasus **pindah tombol ke atas** (kasus temanmu).
3. Tersedia template untuk perubahan validasi, penambahan field, perubahan dialog/feedback, perubahan tema, dan debugging error.
4. Siap dipraktikkan langsung di laptop saat sesi review! 🚀🎓
