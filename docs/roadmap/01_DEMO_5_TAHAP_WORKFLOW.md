# 🟢 CHECKPOINT 01: DEMO 5 TAHAPAN WORKFLOW APLIKASI
> **Target Skor:** 50 Poin (Kelengkapan Workflow 25% + Implementasi & Fungsionalitas 25%)  
> **Durasi Demo:** 1 s.d. 2 Menit di Depan Dosen

---

## 🎯 TUJUAN UTAMA TAHAP INI
Membuktikan secara visual dan fungsional kepada dosen penguji bahwa fitur portofolio kamu memiliki **1 alur kerja lengkap (*One Complete Workflow*)** yang saling terhubung erat tanpa terputus.

```text
[1. Input / Event] ──► [2. State] ──► [3. Validation] ──► [4. Feedback] ──► [5. Navigation / Result]
```

---

## 📋 CHECKLIST PERSIAPAN TEPAT SEBELUM DIPANGGIL
- [x] Laptop dalam kondisi menyala (*charger terpasang*).
- [x] VS Code sudah terbuka di folder project `myteam_app`.
- [x] Aplikasi **sudah berjalan (*running*)** di smartphone Realme (atau emulator) dan berada di layar utama (`DaftarPengalamanScreen` kondisi kosong).
- [x] Jangan membuka aplikasi lain yang tidak relevan agar laptop tetap responsif.

---

## 🎙️ SKENARIO BICARA & DEMO DI DEPAN DOSEN (1 - 2 MENIT)

Duduklah dengan tenang, posisikan layar HP agar dosen bisa melihat jelas, lalu ikuti urutan berikut:

### 1. Pembukaan (Opening)
> *"Selamat pagi/siang Pak/Bu. Untuk tugas individu Practical Challenge ini, saya membangun satu alur kerja lengkap pada fitur **Portofolio Riwayat Pengalaman Mahasiswa (FR-05)** di aplikasi MyTeam. Alur ini mencakup 5 tahapan wajib: Input/Event, State, Validation, Feedback, dan Navigation/Result."*

---

### 2. Tahap 1: Input / Event (Memicu Aksi)
* **Aksi di HP:** Tunjukkan layar awal yang menampilkan **Empty State** (ilustrasi hijau, teks *"Belum Ada Pengalaman"*, dan badge *"0 Pengalaman Tersimpan"*). Kemudian tap tombol hijau **"Tambah Pengalaman"**.
* **Ucapkan:**
  > *"Tahap pertama adalah **Input / Event**. Pada kondisi awal saat belum ada data, aplikasi menyajikan Empty State yang ramah. Saat saya menekan tombol 'Tambah Pengalaman', aplikasi memicu event `Navigator.push` untuk berpindah ke layar formulir, sekaligus melakukan **Forward Data Passing** membawa data yang tersimpan untuk pengecekan validasi."*

---

### 3. Tahap 2: State (Manajemen Data yang Aktif)
* **Aksi di HP:** Form input terbuka bersih dengan 4 field (Nama Kegiatan, Peran, Tahun Pelaksanaan, Deskripsi Kontribusi).
* **Ucapkan:**
  > *"Tahap kedua adalah **State**. Di layar form ini, aplikasi mengelola state teks menggunakan 4 buah `TextEditingController`, status validasi form menggunakan `GlobalKey<FormState>()`, dan status proses menggunakan variabel boolean `_isLoading`."*

---

### 4. Tahap 3: Validation (Pencegahan Input Salah)
* **Aksi di HP:** Jangan isi apapun di form, langsung ketuk tombol hijau **"Simpan Pengalaman"**.
* **Tampilan di HP:** Muncul garis tepi merah (*errorBorder*) dan teks peringatan merah di bawah tiap field:
  - *"Nama kegiatan wajib diisi!"*
  - *"Peran wajib diisi!"*
  - *"Tahun wajib diisi!"*
* **Ucapkan:**
  > *"Tahap ketiga adalah **Validation**. Jika pengguna langsung menyimpan form kosong, sistem menolaknya secara berlapis: Nama kegiatan wajib minimal 3 karakter, peran wajib diisi, dan tahun pelaksanaan harus berupa angka bulat sah antara rentang tahun 2000 hingga 2026. Selain itu, ada aturan **Anti-Duplikasi Cerdas** yang akan menolak jika kombinasi nama, peran, dan tahun sama persis dengan yang sudah tersimpan."*

---

### 5. Tahap 4: Feedback (Respon Visual ke Pengguna)
* **Aksi di HP:**
  1. Isi data valid:
     - **Nama Kegiatan:** `PIMNAS 37`
     - **Peran:** `Ketua Tim`
     - **Tahun Pelaksanaan:** `2025`
     - **Deskripsi:** `Mengembangkan aplikasi mobile dan analisis data.`
  2. Tekan tombol **"Simpan Pengalaman"**.
  3. Sorot tombol yang langsung berubah menjadi animasi lingkaran berputar (*loading spinner*) dengan teks *"Menyimpan..."* selama 700 milidetik.
  4. Muncul jendela sembulan hijau (**Modal Success Dialog**) bertuliskan *"Pengalaman disimpan!"*.
* **Ucapkan:**
  > *"Tahap keempat adalah **Feedback**. Aplikasi menyediakan respon visual di setiap kondisi:  
  > - Status **Gagal**: Muncul border merah dan teks error.  
  > - Status **Proses**: Tombol berubah menampilkan spinner loading selama 700ms dan input terkunci untuk mencegah penekanan ganda (*anti double-submit*).  
  > - Status **Sukses**: Muncul Modal Dialog konfirmasi dengan ikon centang hijau."*

---

### 6. Tahap 5: Navigation / Result (Pengembalian Data & Render Akhir)
* **Aksi di HP:**
  1. Pada Modal Dialog, ketuk tombol **"Lihat Daftar Pengalaman"**.
  2. Jendela dialog menutup, layar form otomatis tertutup, dan kembali ke halaman beranda.
  3. Kartu pengalaman `PIMNAS 37` **langsung tampil secara instan** di layar utama dengan aksen garis hijau Universitas Andalas di sisi kirinya.
  4. Di bagian bawah layar, muncul **SnackBar hijau**: *"Berhasil menambahkan 'PIMNAS 37' ke daftar pengalaman!"*.
* **Ucapkan:**
  > *"Tahap kelima adalah **Navigation / Result**. Ketika tombol dialog ditekan, layar form memanggil `Navigator.pop(context, newPengalaman)` untuk mengembalikan data baru ke layar utama (**Backward Result Passing**). Objek diterima dan disimpan di ViewModel, lalu `ListenableBuilder` secara reaktif langsung menggambar kartu pengalaman baru di layar utama tanpa memuat ulang seluruh halaman."*

---

## 🌟 POIN PLUS DEMO: DEMONSTRASIKAN ANTI-DUPLIKASI CERDAS
Jika dosen tampak antusias, tambahkan 30 detik untuk mendemokan keunggulan logika bisnismu:
1. Tap kembali tombol **"Tambah Pengalaman"**.
2. Masukkan data yang sama persis: `PIMNAS 37`, `Ketua Tim`, `2025`.
3. Tekan **"Simpan Pengalaman"**.
4. Muncul SnackBar merah: *"Pengalaman 'PIMNAS 37' sebagai 'Ketua Tim' pada tahun 2025 sudah ada di daftar!"*.
5. Ganti perannya menjadi `Anggota Tim`, lalu tekan Simpan $\rightarrow$ **Berhasil disimpan!**
6. *Ucapkan:*
   > *"Sistem kami sangat realistis: Jika mahasiswa mengikuti kegiatan yang sama tetapi perannya berbeda di tahun lain (misalnya promosi jabatan), data tetap diizinkan. Sistem hanya menolak jika data ketiga-tiganya kembar murni."*

---

## 📊 KESIAPAN RUBRIK EVALUASI
Dengan skenario di atas, kamu memenuhi kriteria:
* ✅ **Kelengkapan Workflow (Bobot 25%):** Nilai 4 (Excellent) — Semua 5 tahap terlihat jelas dan saling terhubung.
* ✅ **Implementasi & Fungsionalitas (Bobot 25%):** Nilai 4 (Excellent) — Berjalan mulus tanpa crash/bug.

---
👉 **Langkah Selanjutnya:** Setelah demo selesai, dosen akan berkata: *"Oke, coba buka kodenya..."*. Lanjutkan pelajari modul berikutnya: [**02_BEDAH_KODE_DAN_ARSITEKTUR.md**](./02_BEDAH_KODE_DAN_ARSITEKTUR.md).
