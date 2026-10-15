# 📘 PRINSIP MANAJEMEN STATE & MULTI-STATE FEEDBACK (MODUL 4)
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5) — Universitas Andalas  
> **Referensi Modul:** [Modul 4: User Interaction, State & Navigation](https://github.com/accfd/pam-practical-challenge-myteam/blob/main/docs/materi_pam/Module%204%20User%20Interaction%2C%20State%20%26%20Navigation.md)  
> **Aplikasi Studi Kasus:** MyTeam App — Fitur FR-05 (Portofolio Riwayat Pengalaman Mahasiswa)

---

## ⚡ BAGIAN 1: MENGELOLA STATE INTERAKTIF DENGAN `setState()`

Aplikasi mobile nyata bukanlah gambar diam, melainkan antarmuka hidup yang terus bereaksi terhadap aksi pengguna melalui siklus **Application Behavior Model**:

```text
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  USER ACTION │ ──► │ EVENT HANDLER│ ──► │ STATE CHANGE │ ──► │  REBUILD UI  │
│ Tap / Submit │     │  _submitForm │     │  setState()  │     │ Tampilan Baru│
└──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
```

---

### 🔑 3 KONSEP KUNCI MANAJEMEN STATE

#### 1. STATE (Keadaan Data)
* **Definisi:**  
  Data atau informasi yang disimpan di dalam memori aplikasi pada satu titik waktu tertentu, yang nilainya bersifat dinamis (dapat berubah selama runtime), dan perubahan nilainya menentukan bagaimana antarmuka (UI) digambar.
* **Implementasi Konkret di `myteam_pengalaman`:**
  - **State Lokal UI (Ephemeral State):** Variabel `bool _isLoading = false` di file [lib/screens/tambah_pengalaman_screen.dart: baris 25](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/tambah_pengalaman_screen.dart#L25). Variabel ini menyimpan status apakah aplikasi sedang memproses penyimpanan data atau tidak.
  - **State Bisnis Aplikasi (App State):** `List<PengalamanModel> _listPengalaman` di file [lib/viewmodels/pengalaman_viewmodel.dart: baris 7](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/viewmodels/pengalaman_viewmodel.dart#L7). Menyimpan seluruh koleksi data kartu portofolio mahasiswa.

---

#### 2. `setState()` (Fungsi Pemicu Pembaruan)
* **Definisi:**  
  Fungsi bawaan kelas `State` pada `StatefulWidget` yang bertugas memberi tahu framework Flutter:  
  > *"Nilai data internal pada objek ini telah berubah, tolong tandai widget ini sebagai dirty dan gambar ulang (rebuild) tampilannya di frame berikutnya!"*
* **Implementasi Konkret di `myteam_pengalaman`:**  
  Terdapat di method `_submitForm()` pada [lib/screens/tambah_pengalaman_screen.dart: baris 70](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/tambah_pengalaman_screen.dart#L70):
  ```dart
  // Mengubah state dan memicu rebuild UI
  setState(() {
    _isLoading = true;
  });
  ```
  Saat baris ini dieksekusi, Flutter langsung menjadwalkan render ulang agar tombol simpan berubah menjadi animasi loading spinner.

---

#### 3. `build()` (Fungsi Pembangun Antarmuka)
* **Definisi:**  
  Fungsi wajib pada setiap widget yang dieksekusi oleh framework Flutter untuk mengembalikan struktur *Widget Tree* terbaru sesuai dengan nilai state terkini.
* **Implementasi Konkret di `myteam_pengalaman`:**  
  Ketika `setState(() => _isLoading = true)` dipanggil, fungsi `build()` di `_TambahPengalamanScreenState` dipanggil kembali:
  ```dart
  // Baris 178-188 di tambah_pengalaman_screen.dart:
  ElevatedButton(
    onPressed: _isLoading ? null : _submitForm, // Otomatis disabled jika loading
    child: _isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
          )
        : const Text('Simpan Pengalaman'), // Berubah dari teks menjadi spinner!
  )
  ```

---

## 💬 BAGIAN 2: MEKANISME MULTI-STATE FEEDBACK PENGGUNA

Prinsip dasar interaksi pengguna (Steve Krug: *"Don't make me think"*): **Aplikasi tidak boleh membiarkan pengguna menebak apa yang sedang terjadi.** Sistem wajib memberikan kepastian visual dalam **3 Kondisi**:

```text
┌─────────────────────────────────────────────────────────────────────────────────┐
│                       3 KONDISI FEEDBACK MULTI-STATE                            │
├───────────────────────┬─────────────────────────┬───────────────────────────────┤
│ 1. KONDISI GAGAL      │ 2. KONDISI PROSES       │ 3. KONDISI BERHASIL           │
│    (Invalid / Error)  │    (Loading State)      │    (Success / Confirmation)   │
├───────────────────────┼─────────────────────────┼───────────────────────────────┤
│ - Pesan error inline  │ - Spinner putar         │ - Pop-up Dialog konfirmasi    │
│ - SnackBar merah      │ - Tombol disabled       │ - SnackBar hijau melayang     │
└───────────────────────┴─────────────────────────┴───────────────────────────────┘
```

---

### 🔴 1. KONDISI INVALID / GAGAL (Handling Error)
Diberikan ketika pengguna melanggar aturan input atau aturan bisnis:

1. **Error Form Input (Field-Level Validation):**
   * *Mekanisme:* Ketika input tidak valid (misal: nama < 3 huruf, tahun di luar 2000-2026, deskripsi > 3000 huruf).
   * *Tampilan Visual:* Teks error berwarna merah langsung muncul tepat di bawah kolom input terkait (*inline error text*), dan garis border kolom berubah menjadi merah (*errorBorder*).
   * *Kodingan:* `_formKey.currentState!.validate()` di [lib/screens/tambah_pengalaman_screen.dart: baris 38](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/tambah_pengalaman_screen.dart#L38).
2. **Error Logika Bisnis (Anti-Duplikasi):**
   * *Mekanisme:* Ketika user menginput nama kegiatan, peran, dan tahun yang sudah ada di database.
   * *Tampilan Visual:* `SnackBar` berwarna merah gelap (`Colors.red`) mengambang di bawah layar bertuliskan: *"Pengalaman '[Nama]' sebagai '[Peran]' tahun [Tahun] sudah ada!"*.
   * *Kodingan:* [lib/screens/tambah_pengalaman_screen.dart: baris 53-61](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/tambah_pengalaman_screen.dart#L53-L61).

---

### 🟡 2. KONDISI PROSES / LOADING (Handling In-Progress State)
Diberikan saat sistem sedang bekerja menyimpan data atau berkomunikasi secara asinkronus:

* *Mekanisme:* Simulasi jeda komputasi/jaringan selama 700 milidetik menggunakan `await Future.delayed(const Duration(milliseconds: 700))`.
* *Tampilan Visual:*
  1. Teks *"Simpan Pengalaman"* pada tombol menghilang dan digantikan oleh animasi lingkaran putar **`CircularProgressIndicator`** berwarna putih.
  2. Tombol secara otomatis menjadi **disabled (berwarna redup & tidak bisa disentuh)** karena `onPressed: _isLoading ? null : _submitForm`. Ini mencegah pengguna menekan tombol berkali-kali secara tidak sengaja (**mencegah double-submission**).
* *Kodingan:* [lib/screens/tambah_pengalaman_screen.dart: baris 70-74 & 178-188](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/tambah_pengalaman_screen.dart#L70-L74).

---

### 🟢 3. KONDISI BERHASIL / SUKSES (Handling Success State)
Diberikan untuk memberi kepastian mutlak bahwa data telah sah tersimpan di portofolio:

1. **Modal Konfirmasi Pop-up (`AlertDialog`):**
   * *Mekanisme:* Muncul tepat setelah loading 700ms selesai menggunakan `showDialog()`.
   * *Tampilan Visual:* Kotak dialog berlatar putih dengan ikon checklist hijau besar, judul *"Berhasil Disimpan!"*, rincian nama kegiatan yang baru ditambahkan, dan tombol konfirmasi *"OK, Mantap"*.
   * *Kodingan:* [lib/screens/tambah_pengalaman_screen.dart: baris 75-101](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/tambah_pengalaman_screen.dart#L75-L101).
2. **Notifikasi Mengambang di Beranda (`SnackBar` Sukses):**
   * *Mekanisme:* Saat pop-up ditutup, layar form melakukan `Navigator.pop(context, newPengalaman)` kembali ke halaman utama.
   * *Tampilan Visual:* Muncul `SnackBar` berwarna hijau UNAND (`Color(0xFF006400)`) bertuliskan: *"Berhasil menambahkan '[Nama Kegiatan]'!"*.
   * *Kodingan:* [lib/screens/daftar_pengalaman_screen.dart: baris 39-46](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/daftar_pengalaman_screen.dart#L39-L46).

---

## 🗣️ CARA MENJAWAB KE DOSEN SAAT CODE REVIEW

Jika dosen bertanya:  
> *"Bagaimana kamu menerapkan konsep State dan Multi-State Feedback di aplikasi ini?"*

**Jawaban Berbobot Sempurna (Fuadi):**
> *"Izin menjawab Pak/Bu. Mengacu pada Modul 4 perkuliahan:*  
> 1. ***State Management dengan `setState()`:*** *Kami mengelola state lokal `_isLoading` pada form. Ketika tombol simpan diklik, `setState()` dipanggil untuk mengubah nilai variabel menjadi `true`, yang secara otomatis memicu method `build()` me-rebuild widget tombol menjadi animasi `CircularProgressIndicator`.*  
> 2. ***Multi-State Feedback:*** *Aplikasi kami memberikan kepastian visual dalam 3 kondisi:*  
>    - *Saat **Invalid**: Teks error inline merah di bawah input dan SnackBar merah jika terdeteksi duplikat.*  
>    - *Saat **Proses**: Spinner loading dan tombol dinonaktifkan (`onPressed: null`) untuk mencegah double submission.*  
>    - *Saat **Sukses**: Menampilkan modal pop-up `AlertDialog` dan notifikasi `SnackBar` hijau saat kartu baru terbit di beranda.*  
> *Dengan alur ini, pengguna tidak pernah bingung mengenai status sistem aplikasi."* 🚀💯
