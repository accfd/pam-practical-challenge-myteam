# 🎙️ NASKAH LENGKAP DEMO WORKFLOW & CODE REVIEW (KATA-DEMI-KATA)

> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5) — Universitas Andalas  
> **Fitur:** Portofolio Riwayat Pengalaman Mahasiswa (FR-05) — MyTeam App  
> **Mahasiswa:** Fuadi Dhiyaulhaq (NIM: 2411522001)  
> **Target Skor:** 100 / 100 (Nilai A — Kategori *Excellent* di Seluruh 4 Kriteria Rubrik)

---

## 🎯 DAFTAR TARGET BOBOT PENILAIAN DOSEN
1. **Pemahaman dan Analisis Kode (30%):** Mampu menjelaskan kode secara mandiri, runtut, dan tepat tanpa terbata-bata.
2. **Kemampuan Modifikasi Kode (25%):** Mampu mengubah kode saat *live coding* dan memahami dampaknya ke arsitektur.
3. **Penguasaan Konsep dan Materi (25%):** Mampu menjawab pertanyaan konseptual seputar 4 modul kuliah (Mental Model, OOP Dart, MVVM, State & Navigation).
4. **Kemampuan Pemanfaatan AI (20%):** Mampu menyusun prompt terstruktur (*Role + Task + Context + Constraints*) di depan dosen.

---

## ⏱️ RUNDOWN 3 BABAK DI MEJA DOSEN (TOTAL: ~7-10 MENIT)
* **Babak 1 (1–2 Menit):** Demo Workflow 5 Tahap di HP/Emulator.
* **Babak 2 (2–3 Menit):** Bedah Kode & Tanya Jawab Konseptual (Code Review).
* **Babak 3 (3–5 Menit):** Live-Coding Modifikasi Kode & Demonstrasi Prompting AI.

---

# 🎬 BABAK 1: NASKAH DEMO WORKFLOW DI HP (DURASI: 1–2 MENIT)
> **Persiapan Sebelum Masuk:**
> - HP sudah terhubung via USB Debugging atau Emulator sudah menyala.
> - Aplikasi sudah terbuka di layar utama (*Daftar Pengalaman*).
> - Duduk dengan tegap, tersenyum, dan tatap mata dosen penguji.

---

### 1. Pembukaan & Perkenalan Diri (10 Detik)
> **Ucapkan:**  
> *"Assalamualaikum warahmatullahi wabarakatuh. Selamat pagi/siang Bapak/Ibu dosen penguji.  
> Saya **Fuadi Dhiyaulhaq**, NIM **2411522001**.  
> Pada kesempatan kali ini, saya akan mendemokan tugas Practical Challenge individu saya, yaitu **Satu Alur Kerja Lengkap (*One Complete Workflow*)** pada fitur **FR-05: Portofolio Riwayat Pengalaman Mahasiswa** di aplikasi MyTeam App dengan arsitektur MVVM murni."*

---

### 2. Tahap 1 & 2: Input/Event & State Awal (20 Detik)
> 📱 **Aksi di HP:** Tunjukkan layar HP yang masih kosong kepada dosen.  
> 
> **Ucapkan:**  
> *"Bisa kita lihat di layar HP, aplikasi saat ini berada pada **Tahap 2: State Awal**. Karena `_listPengalaman` di ViewModel masih kosong (`isEmpty == true`), aplikasi secara reaktif menampilkan **Empty State** bertuliskan 'Belum Ada Pengalaman'.  
> 
> Sekarang saya masuk ke **Tahap 1: Input / Event** pertama, yaitu mengetuk tombol hijau **'Tambah Pengalaman'**."*

> 📱 **Aksi di HP:** Ketuk tombol hijau *"Tambah Pengalaman"*. Form tambah pengalaman akan meluncur terbuka.  
> 
> **Ucapkan:**  
> *"Aksi ketuk ini mengeksekusi `Navigator.push<PengalamanModel>` yang sekaligus melakukan **Forward Data Passing**—meneruskan salinan daftar pengalaman lama ke form ini untuk kebutuhan validasi anti-duplikasi."*

---

### 3. Tahap 3: Validation (Pencegahan Input Salah) (30 Detik)
> 📱 **Aksi di HP:** **JANGAN ISI APAPUN**. Langsung ketuk tombol hijau *"Simpan Pengalaman"* di bagian bawah.  
> 
> 📱 **Tampilan di HP:** Kotak Nama, Peran, dan Tahun serentak bergaris tepi **merah** dan muncul teks peringatan merah:  
> - *"Nama kegiatan wajib diisi!"*  
> - *"Peran wajib diisi!"*  
> - *"Tahun wajib diisi!"*  
> 
> **Ucapkan:**  
> *"Ini adalah **Tahap 3: Validation**. Aplikasi menerapkan validasi berlapis dan mengunci proses simpan:  
> 1. Field nama kegiatan wajib diisi dan minimal 3 karakter.  
> 2. Field peran wajib diisi.  
> 3. Field tahun wajib berupa angka bulat sah dengan batasan logis masa perkuliahan aktif antara tahun 2000 hingga 2026.  
> 
> Selain itu, di ViewModel ada aturan **Anti-Duplikasi Cerdas**: jika kombinasi nama kegiatan, peran, dan tahun sama persis dengan yang sudah ada, aplikasi akan menolaknya dengan SnackBar merah."*

---

### 4. Tahap 4: Feedback Visual (Proses & Sukses) (30 Detik)
> 📱 **Aksi di HP:** Ketik data valid di form:  
> - Nama Kegiatan: `PIMNAS 37`  
> - Peran / Posisi: `Ketua Tim`  
> - Tahun: `2025`  
> - Deskripsi: `Mengembangkan aplikasi mobile dan analisis data.`  
> Lalu ketuk tombol hijau **"Simpan Pengalaman"**.  
> 
> 📱 **Tampilan di HP:**  
> 1. Tombol langsung berubah menampilkan **Loading Spinner berputar** bertuliskan *"Menyimpan..."* dan seluruh input form terkunci (*disabled*).  
> 2. Setelah 700 milidetik, muncul **Modal Pop-up Dialog Sukses** berlatar putih dengan centang hijau tebal bertuliskan *"Pengalaman disimpan!"*.  
> 
> **Ucapkan:**  
> *"Selanjutnya adalah **Tahap 4: Feedback Visual**:  
> - Saat tombol ditekan, status berubah menjadi `_isLoading = true`. Tombol berubah menampilkan **loading spinner** bertuliskan 'Menyimpan...' untuk mencegah double-click oleh pengguna.  
> - Setelah pemrosesan selesai, muncul **Modal Dialog Sukses** bertema hijau dengan ikon centang tebal yang memberi kepastian mutlak bahwa data telah berhasil disimpan."*

---

### 5. Tahap 5: Navigation & Result Return (20 Detik)
> 📱 **Aksi di HP:** Ketuk tombol hijau **"Lihat Daftar Pengalaman"** di dalam dialog pop-up.  
> 
> 📱 **Tampilan di HP:** Dialog tertutup, form tertutup, kembali ke layar utama. Muncul **SnackBar Hijau** melayang di bawah layar, dan tampilan layar utama otomatis berubah menampilkan **Kartu Pengalaman Hijau PIMNAS 37**!  
> 
> **Ucapkan:**  
> *"Tahap terakhir adalah **Tahap 5: Navigation and Result**.  
> Saat tombol dialog diketuk, fungsi mengeksekusi `Navigator.pop(context, newPengalaman)` yang mengembalikan objek data baru kembali ke halaman utama.  
> 
> Layar utama menerima objek `result` tersebut, memasukkannya ke `PengalamanViewModel`, dan mengeksekusi `notifyListeners()`. Secara instan, widget `ListenableBuilder` membangun ulang antarmuka dari yang semula Empty State menjadi **Daftar Kartu Pengalaman**. Alur kerja 5 tahap workflow telah selesai secara sempurna."*

---

# 💻 BABAK 2: NASKAH BEDAH KODE & TANYA JAWAB (CODE REVIEW)
> **Aksi Mahasiswa:** Arahkan layar laptop ke hadapan dosen, buka VS Code, dan tunjukkan struktur folder `lib/`.

---

### 1. Presentasi Arsitektur Kode (Tanpa Menunggu Ditanya)
> **Ucapkan:**  
> *"Bapak/Ibu, untuk arsitektur kode, saya menerapkan pola **Model-View-ViewModel (MVVM)** murni dengan prinsip **Separation of Concerns (Pemisahan Tanggung Jawab)**:  
> 
> 1. **Model (`lib/models/pengalaman_model.dart`):** Blueprint entitas data pengalaman yang bersifat *immutable* (`final`), dilengkapi factory constructor `fromJson` dan serializer `toJson`.  
> 2. **ViewModel (`lib/viewmodels/pengalaman_viewmodel.dart`):** Pusat logika bisnis dan state management menggunakan `ChangeNotifier`. Seluruh data `_listPengalaman` dilindungi dengan `List.unmodifiable()`, dan logika validasi dibuat berupa method `static` yang *pure* (murni) agar mudah diuji dengan Unit Test.  
> 3. **View 1 (`lib/screens/daftar_pengalaman_screen.dart`):** Tampilan daftar portofolio yang mendengarkan perubahan data menggunakan widget reaktif `ListenableBuilder`.  
> 4. **View 2 (`lib/screens/tambah_pengalaman_screen.dart`):** Formulir input yang mengelola controller dan validasi form lokal.  
> 5. **Design System Terpusat (`lib/main.dart`):** Seluruh styling input, tombol, kartu, dan dialog diatur global di `ThemeData`, sehingga kode di file screens tetap sangat bersih, ringkas, dan bebas dari styling inline yang berulang-ulang."*

---

### 2. Jawaban Telak untuk Pertanyaan Konseptual Dosen

#### ❓ Pertanyaan 1: *"Mengapa pakai MVVM dan ChangeNotifier, kenapa tidak setState biasa di halaman utama?"*
> **Jawaban Kamu:**  
> *"Jika menggunakan `setState()` biasa di halaman utama, maka data list pengalaman, fungsi penambahan data, dan aturan validasi akan bercampur aduk di dalam file widget tampilan (View). Hal itu melanggar prinsip Single Responsibility.  
> Dengan MVVM dan `ChangeNotifier`, logika penambahan data dan validasi terisolasi murni di ViewModel. Buktinya, saya bisa membuat **4 Unit Test otomatis di `test/widget_test.dart`** yang menguji seluruh validasi bisnis tanpa perlu merender UI atau menyalakan emulator."*

#### ❓ Pertanyaan 2: *"Kenapa TextEditingController wajib dipanggil .dispose()?"*
> **Jawaban Kamu:**  
> *"Karena `TextEditingController` mendaftarkan listener ke sistem operasi perangkat untuk mendeteksi ketukan keyboard. Jika layar form ditutup tetapi controller tidak di-`dispose()`, listener tersebut akan terus tertahan di memori HP dan menyebabkan kebocoran memori (*memory leak*). Pemanggilan `.dispose()` di lifecycle method memastikan memori dibebaskan kembali."*

#### ❓ Pertanyaan 3: *"Bagaimana cara ListenableBuilder mengetahui data di ViewModel berubah?"*
> **Jawaban Kamu:**  
> *"Melalui Observer Pattern bawaan Flutter. `ListenableBuilder` diberikan parameter `listenable: _viewModel`. Ketika method `tambahPengalaman()` memanggil `notifyListeners()`, ViewModel menyiarkan sinyal perubahan. `ListenableBuilder` yang mendengarkan sinyal tersebut akan otomatis mengeksekusi fungsi `builder`-nya untuk merender ulang antarmuka secara efisien tanpa merender ulang seluruh pohon widget Scaffold."*

#### ❓ Pertanyaan 4: *"Apa fungsi parameter generic `<PengalamanModel>` pada Navigator.push?"*
> **Jawaban Kamu:**  
> *"Itu adalah penerapan fitur **Type Safety** pada Dart. Dengan menuliskan `Navigator.push<PengalamanModel>`, Dart Compiler mengetahui secara pasti bahwa nilai kembalian (*return value*) dari layar form harus berupa objek bertipe `PengalamanModel`. Ini mencegah kesalahan *type casting* atau *runtime error* saat data diterima kembali di layar utama."*

---

# 🛠️ BABAK 3: NASKAH LIVE-CODING & AI PROMPTING CHALLENGE
> **Petunjuk Penting:**  
> Ketika dosen memberikan instruksi spontan *"Coba ubah..."*, jangan panik!  
> Ingat aturan resmi: **Mahasiswa diperbolehkan dan diarahkan menggunakan AI Coding Assistant.**

---

### 1. Naskah Saat Menerima Tantangan Dosen
> **Ucapkan:**  
> *"Baik Pak/Bu, saya mengerti instruksinya. Saya akan menerapkan modifikasi tersebut menggunakan panduan prompt AI terstruktur dengan standar 4 pilar (*Role, Context, Constraints, Task*)."*

---

### 2. Skenario Live Coding Terpopuler & Formulanya

#### 🔥 Skenario A: Dosen Minta Ubah Batas Validasi Tahun (Misal: 2010–2030)
* **File Target:** [lib/viewmodels/pengalaman_viewmodel.dart](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/viewmodels/pengalaman_viewmodel.dart) (Method `validasiTahun`)
* **Prompt AI yang Kamu Ketik:**
  ```text
  [ROLE]: Senior Flutter Engineer.
  [CONTEXT]: Proyek Flutter MVVM MyTeam App. File logika validasi berada di lib/viewmodels/pengalaman_viewmodel.dart pada method static validasiTahun.
  [CONSTRAINTS]: Jangan ubah signature method dan jangan ubah file lain.
  [TASK]: Ubah batas tahun yang semula 2000-2026 menjadi rentang 2010 sampai 2030 beserta pesan error-nya.
  ```
* **Kode yang Diubah (Baris 52):**
  ```dart
  // Ubah dari:
  if (tahun < 2000 || tahun > 2026) {
    return 'Masukkan tahun antara 2000 - 2026!';
  }
  // Menjadi:
  if (tahun < 2010 || tahun > 2030) {
    return 'Masukkan tahun antara 2010 - 2030!';
  }
  ```
* **Ucapkan ke Dosen Setelah Simpan (Ctrl+S):**  
  *"Perubahan sudah selesai Pak/Bu. Dampaknya murni terjadi di logika ViewModel. Sekarang tahun 2005 akan ditolak oleh form, sedangkan tahun 2028 diterima secara sah."*

---

#### 🔥 Skenario B: Dosen Minta Tambah Field Baru ("Penyelenggara")
* **Trik Anti-Gagal:** Berikan nilai default `this.penyelenggara = ''` di Model agar file pengujian tidak error!
* **Prompt AI yang Kamu Ketik:**
  ```text
  [ROLE]: Senior Flutter Engineer.
  [CONTEXT]: Flutter MVVM MyTeam App. Model di lib/models/pengalaman_model.dart, form di lib/screens/tambah_pengalaman_screen.dart, kartu di lib/screens/daftar_pengalaman_screen.dart.
  [CONSTRAINTS]: 
  - Di Model berikan default this.penyelenggara = '' agar unit test tidak rusak.
  - Jangan lupa dispose controller-nya.
  - Gunakan widget standar Flutter.
  [TASK]: Tambahkan field baru 'Penyelenggara Kegiatan' pada model, form input, dan tampilkan di kartu halaman utama.
  ```
* **3 Langkah Eksekusi:**
  1. Di `pengalaman_model.dart`: Tambah `final String penyelenggara;` dan `this.penyelenggara = ''`.
  2. Di `tambah_pengalaman_screen.dart`: Tambah `_penyelenggaraController`, dispose, buat `TextFormField`, dan kirim saat submit.
  3. Di `daftar_pengalaman_screen.dart`: Tampilkan teks penyelenggara di dalam kartu.
* **Ucapkan ke Dosen Setelah Simpan (Ctrl+S):**  
  *"Penambahan field berhasil diterapkan secara konsisten di seluruh layer: Model data bertambah, Form UI menerima input, dan Kartu di layar utama langsung merendernya secara reaktif."*

---

#### 🔥 Skenario C: Dosen Minta Ganti Dialog Pop-up Menjadi Langsung SnackBar
* **File Target:** [lib/screens/tambah_pengalaman_screen.dart](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/lib/screens/tambah_pengalaman_screen.dart) (Method `_submitForm`)
* **Prompt AI yang Kamu Ketik:**
  ```text
  [ROLE]: Senior Flutter Engineer.
  [CONTEXT]: File lib/screens/tambah_pengalaman_screen.dart pada method _submitForm().
  [CONSTRAINTS]: Objek newPengalaman harus tetap dikembalikan ke layar pemanggil melalui Navigator.pop.
  [TASK]: Hapus showDialog pop-up dan ganti dengan langsung Navigator.pop(context, newPengalaman) agar aplikasi langsung kembali ke layar utama.
  ```
* **Kode yang Diubah (Baris 96-157):**
  Hapus blok `showDialog(...)`, ganti cukup dengan satu baris:
  ```dart
  Navigator.pop(context, newPengalaman);
  ```
* **Ucapkan ke Dosen Setelah Simpan (Ctrl+S):**  
  *"Popup dialog sudah dihapus. Sekarang begitu tombol simpan ditekan dan loading selesai, aplikasi langsung menutup form dan SnackBar hijau di layar utama langsung menyambut pengguna."*

---

# 🏆 PENUTUP DEMO
> **Ucapkan:**  
> *"Demikianlah demonstrasi alur kerja lengkap, bedah kode arsitektur MVVM, dan simulasi modifikasi kode pada aplikasi MyTeam App tugas Practical Challenge saya.  
> Terima kasih banyak atas masukan dan arahan dari Bapak/Ibu dosen penguji.  
> Wassalamualaikum warahmatullahi wabarakatuh."*

---
*(Simpan file ini, baca berulang-ulang, dan latih intonasinya di depan cermin sebelum masuk ke ruang ujian!)* 🌟
