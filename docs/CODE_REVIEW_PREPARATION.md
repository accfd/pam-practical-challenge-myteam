# 🎓 PANDUAN LENGKAP DEMO & CODE REVIEW PRAKTIKAL CHALLENGE PAM
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Aplikasi:** MyTeam App — Fitur Portofolio Riwayat Pengalaman Mahasiswa (FR-05)  
> **Arsitektur:** Pure MVVM (Model - View - ViewModel) + Native `ChangeNotifier`  
> **Mahasiswa:** Fuadi Dhiyaulhaq (NIM: 2411522001)

---

## 📌 DAFTAR ISI
1. [Mekanisme Pelaksanaan Demo & Code Review](#1-mekanisme-pelaksanaan-demo--code-review)
2. [Checklist Wajib Sebelum Masuk Ruangan](#2-checklist-wajib-sebelum-masuk-ruangan)
3. [Skenario Demo Aplikasi (1 - 2 Menit yang Memukau)](#3-skenario-demo-aplikasi-1---2-menit-yang-memukau)
4. [Penjelasan 5 Tahapan Workflow Wajib](#4-penjelasan-5-tahapan-workflow-wajib)
5. [Bedah Kode & Konsep Materi Perkuliahan (Modul 1 s.d. 4)](#5-bedah-kode--konsep-materi-perkuliahan-modul-1-sd-4)
6. [Tanya Jawab Populer Dosen & Kunci Jawabannya](#6-tanya-jawab-populer-dosen--kunci-jawabannya)
7. [Simulasi Live-Coding Challenge & Template Prompt AI (Bobot 20%)](#7-simulasi-live-coding-challenge--template-prompt-ai-bobot-20)

---

## 1. Mekanisme Pelaksanaan Demo & Code Review

Berdasarkan pengumuman resmi dosen, alur pelaksanaan sesi tatap muka (*one-on-one*) adalah sebagai berikut:

```text
[Menunggu di luar] 
   └──► [Dipanggil Masuk 1-on-1]
           ├──► 1. DEMO APLIKASI (Jalankan fitur dari awal sampai akhir)
           ├──► 2. CODE REVIEW (Dosen memeriksa source code & tanya jawab)
           └──► 3. LIVE-CODING CHALLENGE & AI PROMPTING (Modifikasi spontan dengan AI)
```

### Penjelasan Setiap Tahap:
1. **Apakah didemokan dulu?** **YA, BETUL!** Kamu mendemokan alur aplikasi secara langsung di depan dosen terlebih dahulu.
2. **Kapan Code Review dilakukan?** Tepat setelah demo selesai, dosen akan meminta kamu membuka VS Code dan menunjukkan *source code*. Dosen akan menunjuk baris-baris kode tertentu dan bertanya maksud fungsinya.
3. **Live-Coding Challenge:** Dosen akan memberikan instruksi modifikasi spontan (*"Coba ubah..."*). Di sini kamu dinilai kemampuan memodifikasi kode dan menyusun prompt ke AI Coding Assistant.

---

## 2. Checklist Wajib Sebelum Masuk Ruangan

> [!IMPORTANT]
> **Dosen menegaskan:** *"Tidak ada waktu tambahan untuk menyalakan laptop, membuka VS Code, atau mencari project."*

Pastikan sebelum nama kamu dipanggil, kondisi laptop sudah:
- [x] Laptop sudah menyala (*battery* cukup atau terhubung charger).
- [x] VS Code sudah terbuka pada folder project `myteam_app`.
- [x] Tab file penting sudah terbuka:
  - `lib/models/pengalaman_model.dart`
  - `lib/viewmodels/pengalaman_viewmodel.dart`
  - `lib/screens/daftar_pengalaman_screen.dart`
  - `lib/screens/tambah_pengalaman_screen.dart`
- [x] Aplikasi **SUDAH RUNNING** di HP Realme (atau emulator) dan berada di halaman awal (`DaftarPengalamanScreen` - kondisi kosong/Empty State).
- [x] Terminal VS Code sudah siap jika dosen meminta menjalankan `flutter test`.

---

## 3. Skenario Demo Aplikasi (1 - 2 Menit yang Memukau)

Lakukan urutan demo ini secara tenang, runtut, dan percaya diri:

1. **Tunjukkan Layar Awal (Empty State):**
   * *Ucapkan:* *"Selamat pagi/siang Pak/Bu. Ini adalah fitur Portofolio Riwayat Pengalaman Mahasiswa. Pada kondisi awal saat belum ada data, aplikasi menampilkan Empty State yang informatif dengan badge 0 pengalaman dan tombol aksi."*
2. **Buka Form Tambah Pengalaman (Event & Forward Passing):**
   * Tekan tombol **"Tambah Pengalaman"**.
   * *Ucapkan:* *"Ketika tombol ditekan, Navigator.push membuka Form Tambah Pengalaman sekaligus meneruskan seluruh data pengalaman yang ada ke form untuk keperluan validasi."*
3. **Uji Validasi Form (Validation & Error Feedback):**
   * Biarkan form kosong, langsung tekan tombol **"Simpan Pengalaman"**.
   * Tunjukkan border merah dan teks error yang muncul di bawah masing-masing field.
   * *Ucapkan:* *"Form memvalidasi input: Nama kegiatan wajib minimal 3 karakter, peran wajib diisi, dan tahun wajib berupa angka antara tahun 2000 hingga 2026."*
4. **Isi Data Valid & Tunjukkan Loading State:**
   * Isi:
     - Nama Kegiatan: `PIMNAS 37`
     - Peran: `Ketua Tim`
     - Tahun: `2025`
     - Deskripsi: `Mengembangkan prototipe aplikasi mobile kampus.`
   * Tekan **"Simpan Pengalaman"**.
   * Sorot animasi tombol yang berubah menjadi spinner loading (*"Menyimpan..."*).
   * *Ucapkan:* *"Saat tombol ditekan, sistem mengaktifkan Loading State selama proses penyimpanan untuk mencegah double-submit."*
5. **Tunjukkan Modal Sukses & Result State:**
   * Modal dialog hijau muncul (*"Pengalaman disimpan!"*).
   * Tekan **"Lihat Daftar Pengalaman"**.
   * Layar kembali ke halaman utama dan kartu pengalaman baru **langsung muncul secara instan**.
   * Tunjukkan SnackBar hijau yang muncul: *"Berhasil menambahkan 'PIMNAS 37' ke daftar pengalaman!"*
6. **Tunjukkan Anti-Duplikasi Cerdas (Nilai Plus!):**
   * *Ucapkan:* *"Aplikasi ini juga memiliki validasi anti-duplikasi cerdas: Jika mahasiswa memasukkan kegiatan yang sama tetapi perannya berbeda (misalnya PIMNAS sebagai Anggota di tahun lain), data tetap diizinkan. Namun jika Nama, Peran, dan Tahun ketiganya sama persis, sistem akan menolaknya dengan notifikasi merah."*

---

## 4. Penjelasan 5 Tahapan Workflow Wajib

Jika dosen bertanya: *"Jelaskan 5 tahapan alur workflow di aplikasi kamu!"*, gunakan tabel ini:

| Tahap | Implementasi di Kode Kita | Lokasi File |
|---|---|---|
| **1. Input / Event** | • Ketukan tombol `Tambah Pengalaman` (`onPressed: _navigateToAddScreen`)<br>• Input teks pengguna via `TextFormField`<br>• Ketukan tombol `Simpan Pengalaman` (`_submitForm`) | `daftar_pengalaman_screen.dart`<br>`tambah_pengalaman_screen.dart` |
| **2. State** | • Status form diatur oleh `_formKey = GlobalKey<FormState>()`<br>• Status teks dikontrol oleh 4 `TextEditingController`<br>• Status proses diatur variabel boolean `_isLoading`<br>• Kumpulan data dikelola terpusat di `_listPengalaman` dalam ViewModel | `tambah_pengalaman_screen.dart`<br>`pengalaman_viewmodel.dart` |
| **3. Validation** | • **Nama:** Wajib diisi & minimal 3 karakter<br>• **Peran:** Wajib diisi (Required)<br>• **Tahun:** Angka sah (`int.tryParse`) dan rentang logis 2000–2026<br>• **Anti-Duplikasi Cerdas:** Menolak jika kombinasi nama, peran, dan tahun sama persis | `pengalaman_viewmodel.dart`<br>(fungsi statis `validasiNamaKegiatan`, `validasiPeran`, `validasiTahun`, `isDuplikatKombinasi`) |
| **4. Feedback** | • **Gagal:** Border merah (`errorBorder`) + SnackBar merah anti-duplikasi<br>• **Proses:** Tombol berubah jadi spinner (`CircularProgressIndicator`)<br>• **Sukses:** Modal popup `AlertDialog` hijau + SnackBar hijau di halaman utama<br>• **Batal:** SnackBar abu-abu jika user menekan tombol kembali tanpa simpan | `tambah_pengalaman_screen.dart`<br>`daftar_pengalaman_screen.dart` |
| **5. Navigation / Result** | • **Forward:** `Navigator.push<PengalamanModel>` mengirim daftar data ke Form<br>• **Backward:** `Navigator.pop(context, newPengalaman)` mengembalikan objek model baru ke Layar 1 untuk langsung dirender via `ListenableBuilder` | `daftar_pengalaman_screen.dart`<br>`tambah_pengalaman_screen.dart` |

---

## 5. Bedah Kode & Konsep Materi Perkuliahan (Modul 1 s.d. 4)

Dosen akan menguji apakah kamu paham materi perkuliahan yang diterapkan pada kode:

### A. Modul 2: Dart Fundamentals & OOP
- **Immutability (`final`):**
  - Di `PengalamanModel`, semua variabel dideklarasikan `final`.
  - *Penjelasan:* Objek bersifat kekal/tidak dapat diubah diam-diam setelah dibuat, mencegah bug perubahan data liar di latar belakang.
- **Strongly-Typed:**
  - Menggunakan tipe data pasti (`String`, `int`) bukan `dynamic`.
  - *Penjelasan:* Menjamin error langsung terdeteksi saat compile time di editor.
- **Sound Null Safety:**
  - Penggunaan kata kunci `required` pada konstruktor model.
  - *Penjelasan:* Mencegah error fatal *Null Pointer Exception* di runtime.
- **Named Constructor & Factory Constructor:**
  - `PengalamanModel({required this.namaKegiatan, ...})` $\rightarrow$ Named constructor memudahkan pembacaan parameter.
  - `factory PengalamanModel.fromJson(...)` $\rightarrow$ Mengonversi data Map mentah menjadi objek Dart yang aman.
- **Serializer (`toJson`):**
  - Mengubah objek model kembali menjadi Map/JSON jika ingin dikirim ke API web service.
- **Enkapsulasi (Encapsulation):**
  - Variabel data `final List<PengalamanModel> _listPengalaman = [];` diberi garis bawah (`_`).
  - *Penjelasan:* Bersifat *private*, tidak bisa dimanipulasi secara ilegal dari luar class.

### B. Modul 3: Architecture (MVVM) & Data Layer
- **Pola MVVM murni:**
  - **Model (`pengalaman_model.dart`):** Murni struktur data entitas.
  - **View (`daftar_pengalaman_screen.dart` & `tambah_pengalaman_screen.dart`):** Murni tampilan UI dan penangkap event sentuhan.
  - **ViewModel (`pengalaman_viewmodel.dart`):** Jembatan pemroses logika, state data, dan pemegang aturan validasi bisnis.
- **Keuntungan Validasi di ViewModel:**
  - Aturan bisnis menjadi **Unit-Testable** (dapat diuji secara otomatis via file `test/widget_test.dart` tanpa perlu menjalankan emulator).

### C. Modul 4: User Interaction, State & Navigation
- **Local Interactive State via Native `ChangeNotifier`:**
  - Sesuai arahan Modul 4 Slide 10: *"Focus on local interactive state before introducing state-management packages"*.
  - Menggunakan class bawaan Flutter tanpa library pihak ketiga (Bloc/Provider), menjaga aplikasi tetap ringan dan efisien.
- **ListenableBuilder:**
  - Widget efisien yang mendengarkan `ChangeNotifier`. Ketika `notifyListeners()` dipanggil, hanya area di dalam builder yang digambar ulang (*rebuild*), bukan seluruh Scaffold/AppBar.
- **Pencegahan Memory Leak (`dispose`):**
  - Seluruh `TextEditingController` dan `PengalamanViewModel` wajib dipanggil `.dispose()`-nya saat widget dihancurkan agar memori RAM HP tidak bocor.
- **Generic Navigation (`Navigator.push<PengalamanModel>`):**
  - Menjamin keamanan tipe data (*Type-Safety*) pada data hasil kembalian (*return result*).

---

## 6. Tanya Jawab Populer Dosen & Kunci Jawabannya

### Pertanyaan 1: *"Kenapa arsitekturnya kamu pisah menjadi Model, View, dan ViewModel?"*
> **Jawaban:**  
> *"Sesuai materi Modul 3, pemisahan ini menerapkan prinsip **Separation of Concerns**. View hanya fokus menggambar antarmuka pengguna, Model murni mendefinisikan struktur data, dan ViewModel menangani logika serta state. Dengan cara ini, kode menjadi rapi, tidak terjadi penumpukan kode di satu file, dan logika validasi bisa diuji secara mandiri (unit-testable) tanpa emulator."*

### Pertanyaan 2: *"Kenapa kamu pakai ChangeNotifier dan ListenableBuilder, bukan setState biasa?"*
> **Jawaban:**  
> *"Sesuai Modul 4 Slide 10 dan 11, `ChangeNotifier` memisahkan state dari widget tree. Dengan `ListenableBuilder`, Flutter hanya merender ulang widget yang berada di dalam builder saat data berubah, tanpa perlu merender ulang seluruh halaman seperti pada `setState`. Ini jauh lebih optimal dalam penggunaan memori dan performa rendering."*

### Pertanyaan 3: *"Mengapa TextEditingController harus di-dispose di dalam method dispose()?"*
> **Jawaban:**  
> *"Sesuai Modul 4 Slide 8, controller menggunakan listener native di latar belakang. Jika tidak di-dispose saat layar ditutup, controller akan terus aktif di memori RAM dan menyebabkan **Memory Leak** (kebocoran memori), yang lambat laun membuat aplikasi menjadi lambat dan HP cepat panas."*

### Pertanyaan 4: *"Bagaimana alur data dari saat tombol simpan ditekan sampai kartu baru muncul di layar utama?"*
> **Jawaban:**  
> 1. *"Form memvalidasi input via `_formKey.currentState!.validate()` dan mengecek duplikasi di ViewModel.*
> 2. *Data dibungkus menjadi objek `PengalamanModel` baru.*
> 3. *Dialog sukses muncul, saat ditekan layar memanggil `Navigator.pop(context, newPengalaman)` (Backward Result).*
> 4. *Layar utama menerima objek via `await Navigator.push`.*
> 5. *Layar utama memanggil `_viewModel.tambahPengalaman(result)`.*
> 6. *ViewModel memanggil `notifyListeners()`, dan `ListenableBuilder` langsung menggambar ulang kartu baru di layar."*

### Pertanyaan 5: *"Mengapa validasi anti-duplikasi kamu memeriksa kombinasi Nama, Peran, dan Tahun, bukan cuma nama saja?"*
> **Jawaban:**  
> *"Karena di dunia nyata, seorang mahasiswa wajar mengikuti organisasi atau kegiatan yang sama lebih dari satu kali dengan peran yang berbeda (misal BEM sebagai Staf di tahun 2023 lalu sebagai Menteri di tahun 2024). Validasi cerdas ini memastikan kegiatan yang sama tetap diizinkan, dan hanya menolak jika data ketiga-tiganya sama persis (duplikat murni)."*

---

## 7. Simulasi Live-Coding Challenge & Template Prompt AI (Bobot 20%)

Pada sesi live-coding, dosen akan menguji kemampuanmu menyusun prompt ke AI untuk memodifikasi kode. Gunakan **Formula Prompting Resmi Modul 2 Slide 24**:

$$\text{Prompt} = \text{Role} + \text{Task} + \text{Context} + \text{Constraints}$$

---

### Skenario A: Dosen meminta mengubah batas rentang tahun (misal: 2010 s.d. 2030)
* **File yang diubah:** `lib/viewmodels/pengalaman_viewmodel.dart` pada method `validasiTahun`.
* **Prompt ke AI:**
  ```text
  Sebagai mobile developer Flutter profesional, tolong ubah aturan validasi tahun pada file lib/viewmodels/pengalaman_viewmodel.dart.
  Konteks: Saat ini validasi menerima tahun antara 2000 hingga 2026.
  Tugas: Ubah batas tahun yang diizinkan menjadi antara 2010 hingga 2030, serta perbarui pesan error-nya menjadi 'Masukkan tahun antara 2010 - 2030!'.
  Batasan: Jangan mengubah fungsi validasi lainnya dan pertahankan penanganan safe numeric parsing (tryParse).
  ```

---

### Skenario B: Dosen meminta menambah field baru (misal: "Instansi / Penyelenggara")
* **Langkah cepat yang perlu dilakukan:**
  1. Tambah variabel `final String penyelenggara;` di `lib/models/pengalaman_model.dart`.
  2. Tambah `final _penyelenggaraController = TextEditingController();` di `TambahPengalamanScreen`.
  3. Tambah `TextFormField` baru di dalam Form.
  4. Tampilkan teks penyelenggara di dalam Card pada `DaftarPengalamanScreen`.
* **Prompt ke AI:**
  ```text
  Sebagai Flutter expert, tolong bantu saya menambahkan field baru 'penyelenggara' pada aplikasi MyTeam.
  Konteks: Aplikasi memiliki workflow Tambah Pengalaman mahasiswa menggunakan arsitektur MVVM.
  Tugas:
  1. Tambahkan properti 'penyelenggara' bertipe String pada PengalamanModel.
  2. Tambahkan controller dan TextFormField 'Penyelenggara Kegiatan' (wajib diisi) pada TambahPengalamanScreen.
  3. Tampilkan penyelenggara tersebut pada kartu riwayat di DaftarPengalamanScreen.
  Batasan: Tetap terapkan Sound Null Safety, Immutability, dan pastikan controller baru di-dispose dengan benar.
  ```

---

### Skenario C: Dosen meminta mengganti Modal Dialog Sukses menjadi SnackBar saja
* **File yang diubah:** `lib/screens/tambah_pengalaman_screen.dart` pada method `_submitForm`.
* **Prompt ke AI:**
  ```text
  Sebagai Flutter developer, tolong modifikasi feedback sukses pada file lib/screens/tambah_pengalaman_screen.dart.
  Konteks: Saat ini saat data berhasil disimpan, aplikasi memunculkan showDialog (AlertDialog).
  Tugas: Ganti showDialog tersebut sehingga langsung melakukan Navigator.pop(context, newPengalaman) tanpa dialog modal.
  Batasan: Pastikan loading state tetap berjalan 700ms sebelum pop dan objek newPengalaman tetap dikembalikan ke layar sebelumnya.
  ```

---

### Skenario D: Dosen meminta menambah filter pencarian di layar utama
* **Prompt ke AI:**
  ```text
  Sebagai arsitek Flutter MVVM, tolong bantu saya menambahkan fitur pencarian (search bar) pada DaftarPengalamanScreen.
  Konteks: Data pengalaman dikelola oleh PengalamanViewModel menggunakan ChangeNotifier.
  Tugas:
  1. Tambahkan metode filter pencarian berdasarkan nama kegiatan di PengalamanViewModel.
  2. Tambahkan TextField pencarian di AppBar DaftarPengalamanScreen.
  Batasan: Logika penyaringan data harus tetap berada di ViewModel, bukan di View.
  ```

---

### 🌟 Ringkasan Kunci Sukses 100/100
1. **Tenang dan Percaya Diri:** Bicaralah dengan artikulasi jelas, sebutkan nama konsepnya (*"Ini menggunakan ListenableBuilder, Pak..."*, *"Ini Forward Data Passing, Bu..."*).
2. **Kuasai Lokasi Kode:** Tahu persis letak kode saat ditanya (Model di mana, fungsi validasi di mana, navigasi di mana).
3. **Gunakan Formula AI:** Jika diminta live-coding, jangan buat prompt satu kalimat pendek. Selalu gunakan struktur: **Peran + Tugas + Konteks + Batasan**. Dosen akan sangat terkesan melihat pemahaman prompt engineering kamu!

Semoga sukses demo dan code review-nya, Fuadi! Kamu pasti bisa meraih nilai maksimal (100)! 🚀🎓
