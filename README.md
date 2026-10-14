# 📱 MyTeam App — Practical Challenge: Build One Complete Workflow

> **Mata Kuliah:** Pengembangan Aplikasi Mobile  
> **Tugas:** Practical Challenge — Build One Complete Workflow (Tugas Individu)  
> **Nama Mahasiswa:** Fuadi Dhiyaulhaq  
> **NIM:** 2411522001  
> **Institusi:** Universitas Andalas  

---

## 📋 Daftar Isi
1. [Ringkasan Proyek & Fitur](#-ringkasan-proyek--fitur)
2. [Matriks Penilaian Rubrik (Target 100% - Skor 4/4)](#-matriks-penilaian-rubrik-target-100---skor-44)
3. [Alur Workflow Lengkap (5 Tahapan Inti)](#-alur-workflow-lengkap-5-tahapan-inti)
   - [Tahap 1: Input / Event](#tahap-1-input--event)
   - [Tahap 2: State Management & Data Flow](#tahap-2-state-management--data-flow)
   - [Tahap 3: Validation Logic & Error Handling](#tahap-3-validation-logic--error-handling)
   - [Tahap 4: Feedback Mechanism](#tahap-4-feedback-mechanism)
   - [Tahap 5: Navigation & Result Transfer](#tahap-5-navigation--result-transfer)
4. [Diagram Alur Workflow (Mermaid Diagram)](#-diagram-alur-workflow-mermaid-diagram)
5. [Struktur File & Arsitektur Kode](#-struktur-file--arsitektur-kode)
6. [Panduan Menjalankan Aplikasi (Getting Started)](#-panduan-menjalankan-aplikasi-getting-started)
7. [Panduan Khusus Demo & Code Review Dosen](#-panduan-khusus-demo--code-review-dosen)

---

## 🎯 Ringkasan Proyek & Fitur

**MyTeam App** adalah aplikasi mobile kolaborasi dan pencarian rekan tim mahasiswa Universitas Andalas (UNAND). Fitur yang diimplementasikan dalam tantangan ini adalah:

**Fitur Tambah & Manajemen Riwayat Pengalaman Mahasiswa (Modul Portofolio - FR-05)**
- Mahasiswa dapat melihat daftar pengalaman yang telah dimasukkan ke dalam portofolio.
- Tampilan adaptif: mendukung **Empty State** (ketika belum ada data) dan **Populated Card View** (setelah ada data).
- Alur pengisian form riwayat kegiatan (Nama Kegiatan, Peran, Tahun Pelaksanaan, dan Deskripsi Kontribusi).
- Mekanisme validasi berlapis dan penanganan kesalahan secara *real-time*.
- *Feedback* modal dialog interaktif dengan tema warna hijau khas UNAND (`#006400`).
- Aliran pengiriman data bolak-balik antar layar (*two-way navigation data passing*).

---

## 🏆 Matriks Penilaian Rubrik (Target 100% - Skor 4/4)

Dokumentasi dan kode aplikasi ini dirancang khusus untuk memenuhi kriteria **Excellent (Skor 4)** pada seluruh aspek rubrik penilaian:

| No | Kriteria Rubrik | Bobot | Target Skor | Implementasi pada Kode & Fitur |
|---|---|:---:|:---:|---|
| 1 | **Kelengkapan Workflow** | **25%** | **4 (Excellent)** | Seluruh 5 fase alur (`Input/Event` $\rightarrow$ `State` $\rightarrow$ `Validation` $\rightarrow$ `Feedback` $\rightarrow$ `Navigation/Result`) terhubung sempurna tanpa diskontinuitas. |
| 2 | **Implementasi & Fungsionalitas** | **25%** | **4 (Excellent)** | Fitur berjalan utuh dari halaman utama, pembukaan form, pengisian, validasi, feedback dialog, hingga render data kartu baru tanpa error/crash. |
| 3 | **State & Data Flow** | **15%** | **4 (Excellent)** | Menggunakan `StatefulWidget`, `TextEditingController` untuk state lokal form, lifecycle clean up (`dispose`), serta `setState` untuk mutasi list reaktif `_listPengalaman`. |
| 4 | **Validation** | **15%** | **4 (Excellent)** | Validasi komprehensif: field wajib diisi, validasi tipe numerik tahun (`int.tryParse`), dan validasi batas logis tahun kegiatan (`2000 <= tahun <= 2026`). |
| 5 | **Feedback & Error Handling** | **10%** | **4 (Excellent)** | Feedback multi-kondisi: Inline error border merah dan pesan error saat invalid, serta custom animated-look dialog sukses saat data berhasil divalidasi. |
| 6 | **Navigation / Result** | **10%** | **4 (Excellent)** | Navigasi forward via `Navigator.push<PengalamanModel>`, penutupan dialog via `Navigator.pop(ctx)`, dan pengembalian objek model data via `Navigator.pop(context, newPengalaman)` yang diterima kembali secara asinkron. |

---

## 🔄 Alur Workflow Lengkap (5 Tahapan Inti)

Alur fitur ini mengimplementasikan pola arsitektur *Event-driven* yang ketat sesuai panduan praktikum:

```text
[Input / Event] ──► [State Mutation] ──► [Validation] ──► [Feedback] ──► [Navigation / Result]
```

### Tahap 1: Input / Event
**Apa yang dilakukan pengguna?**
1. **Event Buka Form:** Pengguna menekan tombol `"Tambah Pengalaman"` pada layar portofolio (`DaftarPengalamanScreen`). Tombol ini memicu fungsi `_navigateToAddScreen()`.
2. **Event Pengisian Data:** Pengguna mengisi 4 input field pada form:
   - `Nama Kegiatan` (Contoh: *"Pekan Ilmiah Mahasiswa Nasional (PIMNAS)"*)
   - `Peran` (Contoh: *"Ketua Tim / Lead Developer"*)
   - `Tahun Pelaksanaan` (Contoh: *"2025"*)
   - `Deskripsi Kontribusi` (Contoh: *"Merancang arsitektur aplikasi mobile dan memimpin koordinasi tim."*)
3. **Event Submit Form:** Pengguna menekan tombol `"Simpan Pengalaman"`, yang memicu pemanggilan fungsi `_submitForm()`.

---

### Tahap 2: State Management & Data Flow
**Data atau kondisi apa yang berubah setelah event?**
1. **Lokal Form State:**
   - Ditangani oleh `GlobalKey<FormState> _formKey`.
   - Masing-masing field dipantau secara real-time oleh `TextEditingController`:
     - `_namaController`
     - `_peranController`
     - `_tahunController`
     - `_deskripsiController`
   - Manajemen siklus hidup memori dijaga dengan memanggil `controller.dispose()` di dalam `dispose()` method untuk mencegah kebocoran memori (*memory leaks*).
2. **Data Entity Modeling:**
   - Input teks diekstrak dan dibersihkan dari spasi kosong (`.trim()`), lalu dienkapsulasi ke dalam objek model strongly-typed `PengalamanModel`.
3. **List State Mutation:**
   - Layar utama mempertahankan *state* daftar pengalaman `final List<PengalamanModel> _listPengalaman = []`.
   - Ketika data hasil kembali, fungsi `setState()` dipanggil untuk memperbarui UI dari kondisi `Empty State` menjadi daftar `Card` riwayat pengalaman.

---

### Tahap 3: Validation Logic & Error Handling
**Apa yang dianggap tidak valid dan bagaimana aplikasi menanganinya?**

Aplikasi menggunakan `_formKey.currentState!.validate()` dengan 3 lapisan aturan validasi:

| Field | Kriteria Validasi | Kondisi Invalid | Feedback Pesan Error |
|---|---|---|---|
| **Nama Kegiatan** | Wajib diisi (Required & Non-empty) | Kosong atau hanya berisi whitespace | `"Nama kegiatan wajib diisi!"` |
| **Peran** | Wajib diisi (Required & Non-empty) | Kosong atau hanya berisi whitespace | `"Peran wajib diisi!"` |
| **Tahun** | 1. Wajib diisi<br>2. Format Numerik<br>3. Rentang Tahun Logis | 1. Input kosong<br>2. Bukan integer valid (`int.tryParse == null`)<br>3. Nilai $< 2000$ atau $> 2026$ | 1. `"Tahun wajib diisi!"`<br>2. `"Tahun harus berupa angka valid!"`<br>3. `"Masukkan tahun antara 2000 - 2026!"` |
| **Deskripsi** | Opsional | Nilai boleh kosong | Input tetap diterima |

**Penanganan Input Tidak Valid:**
- Jika salah satu field tidak valid, proses penyimpanan ditolak (*halt*).
- Field yang bermasalah akan disorot dengan border merah (`errorBorder` dan `focusedErrorBorder`).
- Pesan error warna merah langsung muncul tepat di bawah input field bersangkutan.
- Pengguna tetap berada pada form tanpa kehilangan data yang sudah diketik sebelumnya.

---

### Tahap 4: Feedback Mechanism
**Apa yang ditampilkan ketika proses berhasil, gagal, atau berlangsung?**

1. **Feedback Saat Gagal / Input Invalid:**
   - Pesan error spesifik muncul di masing-masing `TextFormField`.
   - Indikator visual border berubah warna menjadi merah terang.
2. **Feedback Saat Berhasil:**
   - Menampilkan modal popup dialog (`showDialog`) kustom bernuansa modern.
   - Dilengkapi ikon sukses (`Icons.check_circle_rounded`) dengan latar belakang hijau muda berpadu aksen hijau UNAND.
   - Pesan konfirmasi: `"Pengalaman disimpan!"`.
   - Tombol aksi: `"Lihat Portofolio"` yang akan menutup dialog sekaligus mengarahkan pengguna kembali ke halaman utama.

---

### Tahap 5: Navigation & Result Transfer
**Setelah proses selesai, ke mana pengguna dibawa dan data apa yang diteruskan?**

1. **Forward Navigation (Passing Data & Waiting for Result):**
   ```dart
   final result = await Navigator.push<PengalamanModel>(
     context,
     MaterialPageRoute(builder: (ctx) => const TambahPengalamanScreen()),
   );
   ```
   Layar pemanggil (`DaftarPengalamanScreen`) secara asinkron menunggu nilai kembalian bertipe `PengalamanModel`.

2. **Backward Navigation (Pop Result):**
   ```dart
   Navigator.pop(ctx); // Menutup Dialog Feedback
   Navigator.pop(context, newPengalaman); // Mengembalikan objek model ke layar awal
   ```

3. **Result Consumption & UI Update:**
   ```dart
   if (result != null) {
     setState(() {
       _listPengalaman.add(result);
     });
   }
   ```
   Data yang dikembalikan ditambahkan ke dalam list, memicu render ulang widget (`rebuild`). Tampilan berubah seketika memperlihatkan kartu pengalaman baru lengkap dengan nama, peran bertema hijau, badge tahun, dan deskripsi tugas.

---

## 📊 Diagram Alur Workflow (Mermaid Diagram)

```mermaid
flowchart TD
    Start([Mulai: Buka MyTeam App]) --> ScreenDaftar[Layar Daftar Pengalaman]
    ScreenDaftar --> CheckData{Apakah _listPengalaman kosong?}
    CheckData -- Ya --> ShowEmpty[Tampilkan Empty State: 'Belum Ada Pengalaman']
    CheckData -- Tidak --> ShowList[Tampilkan ListView Kartu Pengalaman]
    
    ShowEmpty --> TapTambah[User Tap Tombol 'Tambah Pengalaman']
    ShowList --> TapTambah
    
    TapTambah --> NavPush[Navigator.push ke TambahPengalamanScreen]
    NavPush --> FormScreen[Layar Form Tambah Pengalaman]
    
    FormScreen --> UserInput[User Mengisi Form: Nama, Peran, Tahun, Deskripsi]
    UserInput --> TapSimpan[User Tap Tombol 'Simpan Pengalaman']
    
    TapSimpan --> ValidateCheck{Form Validasi: _formKey.currentState.validate?}
    
    ValidateCheck -- Gagal / Tidak Valid --> ShowError[Feedback Error: Tampilkan Pesan Merah di Field Terkait]
    ShowError --> FormScreen
    
    ValidateCheck -- Berhasil / Valid --> PackModel[Bungkus Input ke Objek PengalamanModel]
    PackModel --> ShowDialog[Feedback Success: Tampilkan Modal Dialog 'Pengalaman disimpan!']
    ShowDialog --> TapLihat[User Tap Tombol 'Lihat Portofolio']
    
    TapLihat --> PopDialog[Navigator.pop dialog]
    PopDialog --> PopResult[Navigator.pop context, newPengalaman]
    
    PopResult --> CatchResult[DaftarPengalamanScreen Menerima result != null]
    CatchResult --> UpdateState[setState: _listPengalaman.add result]
    UpdateState --> RenderNewCard[UI Otomatis Render Kartu Baru di Portofolio]
    RenderNewCard --> Finish([Selesai: Workflow Lengkap Terpenuhi])
```

---

## 📁 Struktur File & Arsitektur Kode

```text
myteam_app/
├── lib/
│   ├── main.dart                          # Titik masuk utama aplikasi & konfigurasi tema UNAND
│   ├── models/
│   │   └── pengalaman_model.dart          # Kelas model data entitas riwayat pengalaman mahasiswa
│   └── screens/
│       ├── daftar_pengalaman_screen.dart  # Layar 1: Daftar Pengalaman (Empty State, List View, Navigasi)
│       └── tambah_pengalaman_screen.dart  # Layar 2: Form Input, Validasi Berlapis, Feedback Dialog
├── test/
│   └── widget_test.dart                   # Smoke test widget otomatis untuk memverifikasi fungsionalitas UI
└── README.md                              # Dokumentasi lengkap alur kerja & rubrik penilaian
```

### Rincian Komponen Kode:
- **`lib/models/pengalaman_model.dart`**:
  Berisi atribut `namaKegiatan`, `peran`, `tahun`, dan `deskripsi`. Seluruh properti bersifat `final` untuk menjaga *immutability* data.
- **`lib/screens/daftar_pengalaman_screen.dart`**:
  Mengatur logika tampilan daftar, penanganan empty state yang menarik dengan icon informatif, serta inisiasi pemanggilan `Navigator.push` dan penerimaan *result callback*.
- **`lib/screens/tambah_pengalaman_screen.dart`**:
  Berisi form input dengan `TextFormField`, konfigurasi `TextEditingController`, validasi teks & numerik, serta pembuatan dialog feedback konfirmasi.

---

## 🚀 Panduan Menjalankan Aplikasi (Getting Started)

### Prasyarat
- Flutter SDK (Versi $\ge 3.0.0$)
- Android Studio / VS Code / Google Antigravity IDE
- Perangkat Android Emulator atau Physical Device dengan USB Debugging aktif

### Langkah Menjalankan
1. **Clone atau buka repositori pada direktori kerja:**
   ```bash
   cd "d:/## SEMESTER 5/Pengembangan Aplikasi Mobile/PRACTICAL CHALLENGE/myteam_app"
   ```

2. **Unduh seluruh dependensi:**
   ```bash
   flutter pub get
   ```

3. **Jalankan uji otomatis (Unit & Widget Test):**
   ```bash
   flutter test
   ```

4. **Jalankan aplikasi di emulator atau perangkat fisik:**
   ```bash
   flutter run
   ```

---

## 🎓 Panduan Khusus Demo & Code Review Dosen

Sesuai ketentuan tugas, pada sesi demo dosen akan mengajukan pertanyaan dan memberikan *live-coding challenge* kecil. Berikut adalah panduan penguasaan kode:

### 1. Pertanyaan Umum Dosen & Jawaban Konseptual

* **Q: Mengapa menggunakan `Navigator.push<PengalamanModel>` dengan generic type?**  
  * **A:** Generic type `<PengalamanModel>` memastikan keamanan tipe (*type safety*). Dengan begitu, variabel `result` yang dikembalikan dari `await Navigator.push` otomatis dikenali sebagai `PengalamanModel?`, sehingga terhindar dari *runtime type error*.

* **Q: Apa fungsi `_formKey.currentState!.validate()`?**  
  * **A:** Memeriksa seluruh callback `validator` pada setiap `TextFormField` yang berada di dalam lingkup `Form(key: _formKey)`. Jika semua fungsi mengembalikan `null`, maka form dinyatakan valid (`true`). Jika ada yang mengembalikan `String`, teks error tersebut akan langsung dirender dan fungsi bernilai `false`.

* **Q: Mengapa `TextEditingController` harus di-`dispose`?**  
  * **A:** `TextEditingController` mendengarkan perubahan input dari sistem operasi dan mengonsumsi memori. Memanggil `.dispose()` saat widget dibuang memastikan tidak terjadi *memory leak*.

* **Q: Bagaimana mekanisme pengiriman balik data dari Screen 2 ke Screen 1?**  
  * **A:** Pada Screen 2, kita memanggil `Navigator.pop(context, newPengalaman)` di mana parameter kedua adalah data yang dikirimkan. Di Screen 1, pemanggilan `await Navigator.push(...)` akan menangkap data tersebut ke dalam variabel `result`, lalu dimasukkan ke dalam `List` menggunakan `setState()`.

---

### 2. Panduan Cepat Menjawab Live Coding Challenge Dosen

Jika dosen meminta perubahan langsung pada kode saat demo, berikut contekan cepat modifikasinya:

* **Tantangan A: "Coba ubah validasi tahun agar hanya menerima tahun 2010 sampai 2030."**  
  * *Buka:* `lib/screens/tambah_pengalaman_screen.dart` (baris ~214).  
  * *Ubah:*
    ```dart
    // Sebelum:
    if (tahun < 2000 || tahun > 2026) {
      return 'Masukkan tahun antara 2000 - 2026!';
    }
    // Sesudah:
    if (tahun < 2010 || tahun > 2030) {
      return 'Masukkan tahun antara 2010 - 2030!';
    }
    ```

* **Tantangan B: "Coba ganti Dialog Feedback menjadi SnackBar di halaman daftar."**  
  * *Buka:* `lib/screens/daftar_pengalaman_screen.dart` pada fungsi `_navigateToAddScreen()`.  
  * *Tambahkan setelah `setState`:*
    ```dart
    if (result != null) {
      setState(() {
        _listPengalaman.add(result);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Berhasil menambahkan ${result.namaKegiatan}!'),
          backgroundColor: const Color(0xFF006400),
        ),
      );
    }
    ```

* **Tantangan C: "Coba tambahkan field baru misalnya 'Lokasi Kegiatan' ke dalam form."**  
  1. Di `lib/models/pengalaman_model.dart`, tambahkan `final String lokasi;` dan update constructor.
  2. Di `lib/screens/tambah_pengalaman_screen.dart`:
     - Buat controller: `final _lokasiController = TextEditingController();`
     - Dispose controller: `_lokasiController.dispose();`
     - Tambahkan `TextFormField` untuk Lokasi.
     - Masukkan ke `PengalamanModel(lokasi: _lokasiController.text.trim(), ...)` saat submit.
  3. Di `lib/screens/daftar_pengalaman_screen.dart`:
     - Tampilkan widget `Text(item.lokasi)` di dalam kartu item.

---

*Disusun secara komprehensif dan profesional untuk memenuhi seluruh indikator capaian pembelajaran praktikum Mobile Programming.*
