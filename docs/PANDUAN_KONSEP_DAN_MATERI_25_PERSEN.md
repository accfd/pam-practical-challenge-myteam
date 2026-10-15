# 🎓 PANDUAN PENGUASAAN KONSEP & MATERI (BOBOT 25%)
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5) — Universitas Andalas  
> **Komponen Penilaian:** Penguasaan Konsep dan Materi (**Bobot 25%**)  
> **Target Capaian:** **Excellent (4 Poin Penuh)** — *"Dapat menjawab pertanyaan materi dengan tepat dan mengaitkannya dengan implementasi kode"*  
> **Aplikasi:** MyTeam App — Fitur FR-05 (Portofolio Riwayat Pengalaman Mahasiswa)

---

## 🏆 1. STANDAR RUBRIK PENILAIAN DOSEN (BOBOT 25%)

```text
┌─────────────────┬──────────┬────────────────────────────────────────────────────────────────────────┐
│ Tingkat Skor    │ Poin     │ Kriteria Penilaian Dosen                                               │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ 🌟 Excellent    │ 4 Poin   │ Menjawab pertanyaan materi dengan tepat, fasih istilah teknis,         │
│                 │          │ dan langsung menunjukkan baris implementasi kodenya di aplikasi.       │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ 👍 Good         │ 3 Poin   │ Menjawab sebagian besar pertanyaan konsep dengan sedikit arahan.       │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ ⚠️ Fair         │ 2 Poin   │ Memahami konsep dasar tetapi bingung saat disuruh tunjukkan di kodenya.│
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ ❌ Poor         │ 1 Poin   │ Tidak mampu menjawab pertanyaan dasar materi perkuliahan.              │
└─────────────────┴──────────┴────────────────────────────────────────────────────────────────────────┘
```

> [!IMPORTANT]
> **Kunci 4 Poin (Excellent):** Jangan hanya menjawab teori hafalan! Setiap kali dosen bertanya konsep (misal: *"Apa bedanya Stateful vs Stateless?"*), **jawab teorinya lalu langsung tunjukkan file dan baris kodenya di aplikasimu!**

---

## 🔥 2. PERTANYAAN POPULER PENGUJIAN: STATEFUL VS STATELESS WIDGET

> **Pertanyaan Dosen (Sering Keluar pada Teman-teman):**  
> *"Layar ini StatefulWidget atau StatelessWidget? Kenapa kamu memilih itu? Apa bedanya?"*

### 📌 Bedah Jawaban pada Layar 1: `DaftarPengalamanScreen`
* **Status:** **`StatefulWidget`** (di [lib/screens/daftar_pengalaman_screen.dart: baris 7](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/daftar_pengalaman_screen.dart#L7))
* **Alasan Teknis (Kenapa bukan Stateless?):**
  1. **Mengelola Lifecycle Objek ViewModel:** Layar ini menginisialisasi `final PengalamanViewModel _viewModel = PengalamanViewModel();` yang harus bertahan selama layar hidup.
  2. **Memory Cleanup:** Membutuhkan method `dispose()` untuk membebaskan resource `_viewModel.dispose()` saat layar dihancurkan agar tidak terjadi memory leak.
  3. **Menangani Async Navigation & State Update:** Layar ini menjalankan `_navigateToAddScreen()` dengan `await Navigator.push` dan memperbarui state ViewModel saat data baru kembali.

---

### 📌 Bedah Jawaban pada Layar 2: `TambahPengalamanScreen`
* **Status:** **`StatefulWidget`** (di [lib/screens/tambah_pengalaman_screen.dart: baris 6](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart#L6))
* **Alasan Teknis (Kenapa bukan Stateless?):**
  1. **Memiliki State Lokal Dinamis (`_isLoading`):** Menggunakan variabel boolean `bool _isLoading = false` yang nilainya dimutasi lewat `setState(() => _isLoading = true)` untuk menampilkan animasi loading spinner selama simulasi simpan 700ms.
  2. **Mengelola Lifecycle 4 Controller:** Menginisialisasi `_namaController`, `_peranController`, `_tahunController`, dan `_deskripsiController` yang **wajib dibersihkan** di method `dispose()`.
  3. **Memegang `GlobalKey<FormState>`:** Membutuhkan key formulir untuk memicu validasi `_formKey.currentState!.validate()`.

---

### 💡 Tabel Ringkas Perbedaan Teori:
| Fitur | `StatelessWidget` | `StatefulWidget` |
|---|---|---|
| **Sifat Data** | *Immutable* (tidak berubah setelah dibuat) | *Mutable* (data/tampilan bisa berubah saat runtime) |
| **Method Utama** | Hanya memiliki method `build()` | Memiliki class `State` terpisah dengan lifecycle (`initState`, `build`, `dispose`) |
| **Trigger Rebuild** | Hanya di-rebuild jika parent widget berubah | Bisa memicu rebuild mandiri via `setState()` atau listener |
| **Penggunaan di MyTeam** | Cocok untuk widget statis murni (kartu statis, ikon) | Digunakan pada kedua layar utama karena butuh controller & lifecycle |

---

## ⚡ 3. PERTANYAAN JEBAKAN POPULER: `setState()`, `onPressed` VS `onClick`

Berikut adalah 3 pertanyaan jebakan yang baru saja ditanyakan dosen kepada teman-teman saat sesi review:

---

### ❓ JEBAKAN 1: "Kenapa di Flutter pakainya `onPressed` atau `onTap`? Kenapa bukan `onClick` kayak di Web atau Android Native?"

* **Jawaban Mantap Mahasiswa (Fuadi):**  
  > *"Izin menjawab Pak/Bu. Ada 2 alasan fundamental:*  
  > 1. ***Paradigma Touchscreen vs Mouse Pointer:*** *Di web atau desktop (`onClick`), interaksi berbasis klik kursor mouse fisik. Sedangkan di perangkat mobile, layarnya adalah **layar sentuh (touchscreen gesture)**. Pada layar sentuh, gestur manusia terbagi menjadi banyak variasi: ketukan cepat (**tap**), penekanan tombol (**press**), sentuhan lama (**long press**), dan seretan (**drag/pan**).*  
  > 2. ***Konvensi Penamaan Widget Flutter:***  
  >    - *Tombol bertipe Material (`ElevatedButton`, `TextButton`, `IconButton`) menggunakan **`onPressed`** karena merepresentasikan tombol fisik/virtual yang ditekan dan memiliki animasi elevasi/pegas saat ditekan.*  
  >    - *Widget gestur sentuh umum (`InkWell`, `GestureDetector`, `ListTile`) menggunakan **`onTap`** karena mendeteksi ketukan jari pada permukaan layar.*  
  >    - *Flutter sengaja tidak memakai kata `onClick` untuk membedakan paradigma gestur mobile dengan event pointer web browser."*
* **Kode Bukti:**  
  - `onPressed: _isLoading ? null : _submitForm` di [lib/screens/tambah_pengalaman_screen.dart: baris 178](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart#L178)  
  - `onPressed: _navigateToAddScreen` di [lib/screens/daftar_pengalaman_screen.dart: baris 108](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/daftar_pengalaman_screen.dart#L108)

---

### ❓ JEBAKAN 2: "Bagaimana cara kerja `setState()` di balik layar (Under the Hood)? Kapan boleh dan kapan GAK BOLEH pakai `setState()`?"

* **Jawaban Mantap Mahasiswa (Fuadi):**  
  > *"Izin menjawab Pak/Bu:*  
  > 1. ***Cara Kerja di Balik Layar:*** *Ketika `setState(() { ... })` dipanggil:*  
  >    - *Flutter pertama-tama mengeksekusi fungsi callback untuk mengubah nilai variabel state (misal `_isLoading = true`).*  
  >    - *Lalu secara internal, Flutter menandai elemen widget tersebut sebagai **'dirty'** (`element.markNeedsBuild()`).*  
  >    - *Pada frame render berikutnya (60fps/120fps), Flutter memanggil ulang method **`build()`** untuk merender ulang subtree widget tersebut.*  
  > 2. ***Kapan BOLEH dipakai?*** *Hanya untuk **Ephemeral State (State Lokal UI)** di dalam satu layar, contohnya toggle status loading `_isLoading`, animasi switch, atau menampilkan/menyembunyikan password.*  
  > 3. ***Kapan TIDAK BOLEH dipakai?*** *Jangan gunakan `setState()` untuk mengelola data bisnis aplikasi (seperti daftar portofolio pengalaman mahasiswa). Jika dipakai untuk data global, seluruh widget tree layar akan ter-rebuild secara boros, dan logika data akan bercampur kotor di file tampilan (melanggar prinsip Separation of Concerns). Untuk data bisnis, kita wajib menggunakan **`ChangeNotifier` + `ListenableBuilder`** di ViewModel!"*
* **Kode Bukti:** Panggilan `setState(() => _isLoading = true)` di [lib/screens/tambah_pengalaman_screen.dart: baris 70](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart#L70)

---

### ❓ JEBAKAN 3: "Kenapa tombol Simpan kamu bisa otomatis disabled (mati/abu-abu) saat loading?"

* **Jawaban Mantap Mahasiswa (Fuadi):**  
  > *"Izin menjawab Pak/Bu. Itu adalah mekanisme bawaan widget Material Button di Flutter. Pada kode saya:*  
  > ```dart
  > onPressed: _isLoading ? null : _submitForm,
  > ```  
  > *Ketika `_isLoading == true`, property `onPressed` kami operasikan nilai **`null`**.*  
  > *Di Flutter, jika sebuah button diberi nilai `onPressed: null`, button tersebut secara otomatis dinonaktifkan (disabled), tidak bisa diklik lagi oleh user untuk **mencegah double-submission**, dan warna latar belakangnya otomatis diredupkan oleh framework sesuai spesifikasi Material 3."*
* **Kode Bukti:** [lib/screens/tambah_pengalaman_screen.dart: baris 178](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart#L178)

---

### ❓ JEBAKAN 4: "Apa bedanya `GestureDetector` dengan `InkWell`?"

* **Jawaban Mantap Mahasiswa (Fuadi):**  
  > *"Keduanya sama-sama widget untuk menangkap gestur sentuhan (`onTap`, `onDoubleTap`, dll).*  
  > *Perbedaannya:*  
  > - ***`InkWell`*** *adalah widget Material yang memberikan efek visual sentuhan berupa animasi gelombang air (**Splash / Ripple Effect**) saat disentuh (membutuhkan ancestor `Material`).*  
  > - ***`GestureDetector`*** *adalah pendeteksi gestur murni yang tidak memiliki efek visual apa pun secara default, tetapi mendukung gestur kompleks seperti drag, pan, dan scale (cubit zoom)."*

---

## 📚 4. BANK PERTANYAAN MATERI DARI 4 MODUL KULIAH

Berikut adalah kemungkinan pertanyaan konsep yang sangat sering diajukan dosen berdasarkan silabus Modul 1 s.d. Modul 4:

---

### 🔹 KELOMPOK A: STATE MANAGEMENT & REACTIVITY (MODUL 4)

#### Q1: "Bagaimana cara kerja State Management di aplikasi kamu?"
* **Jawaban:**  
  *"Aplikasi kami menerapkan **Pure MVVM State Management** bawaan Flutter tanpa package eksternal, yaitu menggunakan kombinasi **`ChangeNotifier`** pada ViewModel dan **`ListenableBuilder`** pada View.*  
  *Ketika ada penambahan data baru di `_viewModel.tambahPengalaman()`, ViewModel memanggil method **`notifyListeners()`**. Sinyal ini langsung didengar oleh `ListenableBuilder` di `DaftarPengalamanScreen` untuk menggambar ulang (rebuild) daftar kartu tanpa harus me-rebuild seluruh layar secara kasar."*
* **Kode Bukti:**  
  - Panggilan `notifyListeners()` di [lib/viewmodels/pengalaman_viewmodel.dart: baris 39](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/viewmodels/pengalaman_viewmodel.dart#L39)
  - Widget `ListenableBuilder` di [lib/screens/daftar_pengalaman_screen.dart: baris 51](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/daftar_pengalaman_screen.dart#L51)

---

#### Q2: "Apa bedanya `setState()` dengan `ChangeNotifier`?"
* **Jawaban:**  
  *"**`setState()`** adalah mekanisme state lokal bawaan `StatefulWidget`. Ketika dipanggil, Flutter akan me-rebuild seluruh subtree widget dari State tersebut. Kami memakainya untuk state visual sederhana seperti loading spinner (`_isLoading`).*  
  *Sedangkan **`ChangeNotifier`** adalah observable pattern untuk state bisnis aplikasi (business state). Ia memisahkan data dari UI sehingga logika manipulasi data tidak tercampur di dalam file layar."*

---

#### Q3: "Apa fungsi method `dispose()`? Apa yang terjadi jika kamu tidak menulisnya?"
* **Jawaban:**  
  *"Method `dispose()` adalah lifecycle terakhir dari `StatefulWidget` yang dipanggil saat widget dihapus permanen dari widget tree.*  
  *Fungsinya adalah **membebaskan memori (resource cleanup)**, seperti memanggil `_namaController.dispose()` dan `_viewModel.dispose()`. Jika kita lupa menulisnya, objek controller akan tetap tertinggal di RAM meskipun layarnya sudah ditutup, menyebabkan kebocoran memori (**Memory Leak**)."*
* **Kode Bukti:** [lib/screens/tambah_pengalaman_screen.dart: baris 27-34](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart#L27-L34)

---

#### Q4: "Kenapa ada baris `if (!mounted) return;` setelah `await`?"
* **Jawaban:**  
  *"Karena setelah operasi asynchronous (`await Navigator.push` atau delay `Future.delayed`), ada kemungkinan pengguna sudah menekan tombol Back dan layar tersebut sudah dihancurkan oleh Flutter.*  
  *Property **`mounted`** memeriksa apakah State widget tersebut masih terpasang aktif di widget tree. Jika `!mounted` (layar sudah mati), kita langsung return agar tidak memanggil `BuildContext` yang sudah kedaluwarsa, yang bisa menyebabkan crash runtime: 'Looking up a deactivated widget's ancestor'."*
* **Kode Bukti:** [lib/screens/daftar_pengalaman_screen.dart: baris 34](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/daftar_pengalaman_screen.dart#L34)

---

### 🔹 KELOMPOK B: FORM VALIDATION & USER INPUT (MODUL 4)

#### Q5: "Bagaimana alur validasi form di aplikasi ini bekerja?"
* **Jawaban:**  
  *"Alur validasi form kami terbagi menjadi 2 lapis keamanan:*  
  1. **Lapis 1 (UI Validation):** Menggunakan `_formKey.currentState!.validate()`. Setiap `TextFormField` memanggil fungsi validator di ViewModel untuk mengecek input kosong, panjang karakter, dan format angka safe numeric (`int.tryParse`). Jika tidak valid, muncul error inline berwarna merah di bawah input.  
  2. **Lapis 2 (Business Logic Validation):** Sebelum disimpan, aplikasi memanggil `PengalamanViewModel.isDuplikatKombinasi(...)` untuk memastikan tidak ada data ganda dengan kombinasi nama kegiatan, peran, dan tahun yang sama. Jika duplikat, muncul SnackBar merah."*
* **Kode Bukti:** [lib/screens/tambah_pengalaman_screen.dart: baris 38-51](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart#L38-L51)

---

#### Q6: "Mengapa menggunakan `int.tryParse()` bukan `int.parse()`?"
* **Jawaban:**  
  *"Karena `int.parse()` akan langsung melempar exception `FormatException` dan membuat aplikasi crash jika pengguna memasukkan karakter non-angka atau spasi.*  
  *Sedangkan `int.tryParse()` bersifat aman (*safe parsing*), yaitu mengembalikan nilai `null` jika parsing gagal, sehingga kita cukup mengecek `if (tahun == null)` untuk menampilkan pesan error yang ramah kepada pengguna tanpa terjadi crash."*
* **Kode Bukti:** [lib/viewmodels/pengalaman_viewmodel.dart: baris 79](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/viewmodels/pengalaman_viewmodel.dart#L79)

---

### 🔹 KELOMPOK C: NAVIGASI & DATA PASSING (MODUL 4)

#### Q7: "Bagaimana cara data berpindah dari Form Tambah kembali ke Layar Utama?"
* **Jawaban:**  
  *"Menggunakan konsep **Navigation Stack & Two-Way Data Passing**:*  
  1. **Forward Data Passing (Kirim ke Depan):** Layar utama memanggil `Navigator.push<PengalamanModel>` sambil mengirimkan daftar pengalaman yang sudah terdaftar via konstruktor form untuk validasi anti-duplikasi.  
  2. **Wait for Result:** Layar utama menunggu dengan kata kunci `await`.  
  3. **Return Data (Kirim Balik):** Ketika form berhasil disimpan, form memanggil `Navigator.pop(context, newPengalaman)`. Objek data yang dikirimkan ditangkap oleh variabel `result` di layar utama, lalu dimasukkan ke dalam ViewModel lewat `_viewModel.tambahPengalaman(result)`."*
* **Kode Bukti:**  
  - Kirim & tunggu: [lib/screens/daftar_pengalaman_screen.dart: baris 25-38](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/daftar_pengalaman_screen.dart#L25-L38)  
  - Return balik: [lib/screens/tambah_pengalaman_screen.dart: baris 84](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart#L84)

---

### 🔹 KELOMPOK D: ARSITEKTUR & DATA MODELING (MODUL 2 & MODUL 3)

#### Q8: "Apa arsitektur yang digunakan dan kenapa memilih arsitektur tersebut?"
* **Jawaban:**  
  *"Aplikasi ini menggunakan pola arsitektur **Pure Model-View-ViewModel (MVVM)** sesuai prinsip *Separation of Concerns* (Pemisahan Tanggung Jawab):*  
  - **Model (`PengalamanModel`):** Struktur data murni yang merepresentasikan entitas portofolio mahasiswa.  
  - **View (`DaftarPengalamanScreen` & `TambahPengalamanScreen`):** Komponen UI yang hanya bertugas me-render widget dan menangkap input pengguna.  
  - **ViewModel (`PengalamanViewModel`):** Jembatan logika bisnis yang mengelola list data, memvalidasi form, dan memberitahu View saat terjadi perubahan data.*  
  *Keuntungannya: kode rapi, mudah di-maintenance, dan logika bisnis dapat diuji secara mandiri menggunakan Unit Test tanpa perlu me-render layar UI."*

---

#### Q9: "Kenapa semua atribut di `PengalamanModel` bertipe `final`?"
* **Jawaban:**  
  *"Untuk menerapkan prinsip **Immutability (Kekekalan Objek)**. Sekali sebuah instance model dibuat, nilainya tidak boleh diubah sembarangan di tengah jalan oleh bagian kode lain secara tidak sengaja.*  
  *Immutability menjamin integritas data (data integrity), mencegah efek samping tak terduga (*unexpected side effects*), dan sangat mempermudah pelacakan alur data di state management."*
* **Kode Bukti:** [lib/models/pengalaman_model.dart: baris 2-7](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/models/pengalaman_model.dart#L2-L7)

---

#### Q10: "Apa itu Sound Null Safety pada Dart dan apa artinya tanda `?` serta `!`?"
* **Jawaban:**  
  *"**Sound Null Safety** adalah fitur pada Dart 3 yang memastikan variabel tidak bisa bernilai `null` secara default kecuali diizinkan secara eksplisit.*  
  - Tanda tanya (**`?`**) menandakan tipe data *nullable* (boleh bernilai null, contoh `String?`).  
  - Tanda seru (**`!`**) adalah *null assertion operator*, yaitu jaminan dari programmer kepada compiler bahwa objek tersebut pasti tidak null pada saat baris itu dieksekusi (contoh: `_formKey.currentState!.validate()`)."*

---

## 🎯 4. STRATEGI BICARA DI DEPAN DOSEN (FORMULA 3 LANGKAH)

Setiap kali dosen melontarkan pertanyaan konsep:
```text
[Langkah 1: Jawab Tegas & Konseptual]
"Layar ini adalah StatefulWidget Pak/Bu, karena memiliki data lokal yang dinamis..."

[Langkah 2: Jelaskan Detail Teknisnya]
"Yaitu variabel _isLoading untuk loading state dan 4 TextEditingController yang memerlukan lifecycle dispose()..."

[Langkah 3: Buka Kodenya & Tunjukkan Langsung]
"Bisa kita lihat langsung di file lib/screens/tambah_pengalaman_screen.dart baris 6 sampai 34..."
```

Dengan formula 3 langkah ini, dosen akan melihat bahwa kamu **bukan sekadar menghafal jawaban teman**, melainkan **benar-benar menguasai dan menulis sendiri kodenya**! 🚀💯
