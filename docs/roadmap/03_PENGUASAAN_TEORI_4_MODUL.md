# 🟢 CHECKPOINT 03: PENGUASAAN KONSEP TEORI 4 MODUL PAM
> **Target Skor:** 25 Poin (Penguasaan Konsep dan Materi)  
> **Fokus Utama:** Mampu menjawab pertanyaan teoritis dosen dan mengaitkannya secara tepat dengan kode yang telah kita buat.

---

## 📚 KORELASI KODE DENGAN 4 MODUL PERKULIAHAN

Dosen ingin melihat apakah mahasiswa **benar-benar memahami konsep di balik kode**, bukan sekadar menjiplak atau menjalankan aplikasi tanpa tahu alasannya.

---

### 1. MODUL 1: AI-Assisted Mobile Development & Mental Model Flutter
* **Konsep Inti:**
  1. **UI as Code & Deklaratif vs Imperatif:**
     - *Imperatif (Cara Lama):* Mengubah tampilan satu per satu secara manual (misal: `button.text = "Loading..."`, `button.disabled = true`).
     - *Deklaratif (Cara Flutter):* Kita hanya mendeskripsikan tampilan berdasarkan kondisi state saat ini:
       ```dart
       child: _isLoading ? CircularProgressIndicator() : Text('Simpan Pengalaman')
       ```
       Jika state berubah, Flutter otomatis menggambar ulang tampilannya.
  2. **Widget Tree (Pohon Komponen):**
     - Semua tampilan di Flutter adalah pohon hierarki widget (dari `MaterialApp` $\rightarrow$ `Scaffold` $\rightarrow$ `AppBar` / `Column` $\rightarrow$ `TextFormField` $\rightarrow$ `ElevatedButton`).
  3. **Reactive UI:**
     - Tampilan layar bereaksi otomatis terhadap perubahan data yang dipancarkan oleh ViewModel (`notifyListeners()`).

---

### 2. MODUL 2: Dart Fundamentals, OOP & Prompt Engineering
* **Konsep Inti:**
  1. **OOP (Object-Oriented Programming):**
     - Menerapkan prinsip *Class* dan *Object* pada `PengalamanModel` dan `PengalamanViewModel`.
  2. **Immutability (Kekekalan Objek):**
     - Penggunaan kata kunci `final` pada semua atribut model. Sekali objek dibuat, nilainya tidak bisa diubah-ubah sembarangan.
  3. **Sound Null Safety:**
     - Dart menjamin secara mutlak bahwa variabel bertipe `String` tidak akan pernah bernilai `null` kecuali diberi tanda `?` (`String?`).
     - Penggunaan kata kunci `required` pada konstruktor memastikan tidak ada data yang terlewat saat pembuatan objek.
  4. **Enkapsulasi (Encapsulation):**
     - Menyembunyikan data internal dengan awalan garis bawah (`_listPengalaman`), sehingga hanya bisa dimanipulasi melalui method resmi class tersebut.
  5. **Prompt Engineering Sesuai Modul 2 Slide 24:**
     - Menyusun instruksi ke AI dengan struktur 4 elemen: **Peran (Role) + Tugas (Task) + Konteks (Context) + Batasan (Constraints)**.

---

### 3. MODUL 3: Data Modeling, Architecture (MVVM) & Layering
* **Konsep Inti:**
  1. **Prinsip *Separation of Concerns* (Pemisahan Tanggung Jawab):**
     - Kode tidak ditumpuk menjadi satu file raksasa (*Spaghetti Code*), melainkan dibagi ke dalam 3 lapisan:
       - **Data Layer (Model):** Hanya tahu bentuk data (`PengalamanModel`).
       - **Business Logic Layer (ViewModel):** Mengatur aliran data, state, dan memegang aturan validasi bisnis (`PengalamanViewModel`).
       - **Presentation Layer (View):** Hanya tahu cara menggambar antarmuka dan menangkap sentuhan pengguna (`DaftarPengalamanScreen` & `TambahPengalamanScreen`).
  2. **Strongly-Typed Data Modeling:**
     - Mengubah data Map/JSON mentah menjadi objek class Dart melalui *Factory Constructor* (`fromJson`), sehingga terlindung dari salah ketik nama kolom (*typo*).
  3. **Unit-Testability:**
     - Keuntungan memisahkan fungsi validasi ke dalam ViewModel adalah logika aturan bisnis dapat diuji secara mandiri (*automated unit test*) tanpa perlu menjalankan antarmuka grafis atau emulator HP.

---

### 4. MODUL 4: User Interaction, Local State & Navigation
* **Konsep Inti:**
  1. **Local Interactive State via Native `ChangeNotifier`:**
     - Sesuai arahan **Modul 4 Slide 10**: *"Focus on local interactive state before introducing state-management packages"*.
     - Kita menggunakan fitur asli bawaan Flutter tanpa ketergantungan library luar (Bloc, Provider, Riverpod), menjaga aplikasi tetap ringan, cepat, dan mudah dipahami.
  2. **Memory Lifecycle & Kebocoran Memori (*Memory Leak*):**
     - Sesuai **Modul 4 Slide 8**: Controller dan ViewModel yang menggunakan listener wajib ditutup menggunakan method `dispose()` saat widget dihancurkan, agar memori RAM HP dibersihkan.
  3. **Navigasi Dua Arah (*Two-Way Data Passing*):**
     - Sesuai **Modul 4 Slide 28-29**:
       - *Forward Data Passing:* Mengirim data ke layar tujuan (`Navigator.push(..., pengalamanTerdaftar: ...)`).
       - *Backward Result Passing:* Mengembalikan data hasil kerja ke layar asal (`Navigator.pop(context, newPengalaman)`).
  4. **Multi-State Feedback Visual:**
     - Sesuai **Modul 4 Slide 20-22**: Memberikan kejelasan visual pada 4 kondisi berbeda: Gagal (*error border*), Proses (*spinner loading*), Sukses (*modal dialog*), dan Batal (*snackbar*).

---

## 🎯 PERTANYAAN JEBAKAN DOSEN & JAWABAN TEPATNYA

### Q1: *"Apakah aplikasi ini pakai State Management library seperti Bloc atau Provider?"*
> **Jawaban Kamu:**  
> *"Tidak Pak/Bu. Kami menerapkan **Native ChangeNotifier** bawaan resmi Flutter yang dikombinasikan dengan widget **ListenableBuilder**. Hal ini selaras dengan panduan materi **Modul 4 Slide 10**, di mana kita diarahkan untuk menguasai pengelolaan state interaktif lokal bawaan Flutter terlebih dahulu sebelum menggunakan package eksternal. Pendekatan ini membuat aplikasi jauh lebih ringan dan tanpa dependensi luar."*

### Q2: *"Di mana letak batas antara View dan ViewModel pada form tambah pengalaman kamu?"*
> **Jawaban Kamu:**  
> *"Batasnya sangat jelas: Di lapisan **View**, kodenya menangani `TextEditingController`, animasi loading tombol, dan popup dialog antarmuka. Sedangkan di lapisan **ViewModel**, kodenya menangani logika validasi teks (aturan nama, peran, tahun, dan anti-duplikasi) serta penyimpanan data ke dalam list memori. View hanya memanggil fungsi statis di ViewModel."*

---
👉 **Langkah Selanjutnya:** Latih kesiapan modifikasi kode secara spontan di: [**04_SIMULASI_LIVE_CODING.md**](./04_SIMULASI_LIVE_CODING.md).
