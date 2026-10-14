# 🟢 CHECKPOINT 02: BEDAH SOURCE CODE & ARSITEKTUR MVVM
> **Target Skor:** 30 Poin (Pemahaman dan Analisis Kode)  
> **Fokus Utama:** Mampu menjelaskan fungsi dan maksud setiap baris kode secara mandiri dan percaya diri saat dosen menunjuk layar VS Code.

---

## 🏛️ 1. PETA ARSITEKTUR PURE MVVM

Aplikasi ini menerapkan pola arsitektur **Pure MVVM (Model - View - ViewModel)** murni tanpa library pihak ketiga, sesuai arahan Modul 3 Slide 18 dan Modul 4 Slide 10:

```text
┌────────────────────────────────────────────────────────┐
│                      VIEW (UI)                         │
│  • DaftarPengalamanScreen (Menampilkan Card & Button)  │
│  • TambahPengalamanScreen (Form Input & Controller)    │
└─────────────────────────▲──────────────────────────────┘
                          │ (ListenableBuilder mendengarkan)
                          │ (notifyListeners memicu render ulang)
┌─────────────────────────┴──────────────────────────────┐
│                  VIEWMODEL (LOGIKA & STATE)            │
│  • PengalamanViewModel                                 │
│  • State Privat: _listPengalaman                       │
│  • Aturan Validasi Bisnis & Anti-Duplikasi             │
└─────────────────────────▲──────────────────────────────┘
                          │ (Mengelola kumpulan objek model)
┌─────────────────────────┴──────────────────────────────┐
│                     MODEL (DATA ENTITY)                │
│  • PengalamanModel (final properties, fromJson, toJson)│
└────────────────────────────────────────────────────────┘
```

---

## 📁 2. BEDAH FILE 1: `lib/models/pengalaman_model.dart` (Data Layer)

File ini murni mendefinisikan bentuk data bisnis tanpa ada kaitannya dengan widget tampilan.

```dart
class PengalamanModel {
  final String namaKegiatan;
  final String peran;
  final String tahun;
  final String deskripsi;
  ...
}
```

### Konsep & Istilah Teknis yang Wajib Dikuasai:
1. **Mengapa pakai kata kunci `final`? (*Immutability*)**
   * *Jawaban:* Agar properti objek bersifat **kekal (immutable)** setelah dibuat. Objek tidak bisa diubah-ubah nilainya secara diam-diam oleh proses lain di latar belakang, sehingga aplikasi bebas dari bug manipulasi data liar.
2. **Apa maksud *Strongly-Typed*?**
   * *Jawaban:* Tipe data ditentukan secara pasti dan ketat (`String`, bukan tipe `dynamic`). Jika kita salah memasukkan tipe data, compiler langsung memberi tahu error saat menulis kode (*Compile Time*), bukan saat aplikasi berjalan di tangan pengguna (*Runtime*).
3. **Apa fungsi `required`? (*Sound Null Safety*)**
   * *Jawaban:* Memastikan bahwa saat membuat objek, parameter tersebut **wajib diisi** dan tidak boleh dibiarkan bernilai `null` (kosong), sehingga aplikasi terhindar dari *crash* akibat *Null Pointer Exception*.
4. **Apa beda *Named Constructor* dan *Factory Constructor*?**
   * **Named Constructor** (`PengalamanModel({required this.namaKegiatan, ...})`): Cara membuat objek dengan menyebutkan nama propertinya secara jelas. Urutan penulisan parameter tidak akan tertukar.
   * **Factory Constructor** (`factory PengalamanModel.fromJson(Map<String, dynamic> json)`): Konstruktor fleksibel yang bisa menjalankan logika penguraian data mentah (Map/JSON dari database atau internet) menjadi objek Dart yang aman sebelum dikembalikan.
5. **Apa fungsi `toJson()`? (*Serializer*)**
   * *Jawaban:* Mengubah objek PengalamanModel kembali menjadi Map/JSON umum jika data ingin dikirimkan ke server API atau disimpan ke memori penyimpanan lokal HP.

---

## 📁 3. BEDAH FILE 2: `lib/viewmodels/pengalaman_viewmodel.dart` (Business Logic)

File ini bertindak sebagai otak yang mengelola data, state, dan memegang aturan validasi bisnis.

```dart
class PengalamanViewModel extends ChangeNotifier {
  final List<PengalamanModel> _listPengalaman = [];

  List<PengalamanModel> get listPengalaman => List.unmodifiable(_listPengalaman);
  ...
}
```

### Konsep & Istilah Teknis yang Wajib Dikuasai:
1. **Mengapa mewarisi `ChangeNotifier`?**
   * *Jawaban:* `ChangeNotifier` adalah class bawaan resmi Flutter yang bertindak seperti **"menara pemancar"** (*Observer Pattern*). Ketika ada data baru yang masuk, ViewModel cukup memanggil `notifyListeners()`, dan semua widget UI yang mendengarkannya akan otomatis mengetahui dan menggambar ulang tampilannya.
2. **Mengapa variabelnya `_listPengalaman` memakai garis bawah `_`? (*Enkapsulasi*)**
   * *Jawaban:* Garis bawah berarti variabel tersebut berstatus **private** (rahasia internal class). Layar luar dilarang mengakses atau mengubah data ini secara langsung tanpa melalui fungsi resmi `tambahPengalaman()`.
3. **Mengapa menggunakan `List.unmodifiable(_listPengalaman)`?**
   * *Jawaban:* Mengembalikan salinan data yang **hanya bisa dibaca (*Read-Only*)**. Jika ada kode luar yang mencoba memanggil `_listPengalaman.add(...)` secara ilegal, sistem akan melempar error. Ini menjaga keutuhan integritas data.
4. **Kapan `notifyListeners()` dipanggil?**
   * *Jawaban:* Dipanggil tepat setelah data baru dimasukkan (`_listPengalaman.add(pengalaman)`). Tujuannya membunyikan sinyal ke widget pendengar (`ListenableBuilder`) agar kartu baru langsung muncul di layar.
5. **Mengapa fungsi validasi diletakkan di ViewModel, bukan di Form?**
   * *Jawaban:* Sesuai materi Modul 3, aturan validasi adalah bagian dari **Business Rules**. Meletakkannya di ViewModel membuat logika tersebut berstatus **Unit-Testable** (dapat diuji kebenarannya secara otomatis melalui file tes tanpa butuh emulator HP).
6. **Bagaimana cara kerja fungsi `isDuplikatKombinasi`?**
   * *Jawaban:* Memeriksa apakah nama (huruf kecil), peran (huruf kecil), dan tahun ketiganya sama persis dengan data yang sudah tersimpan. Jika salah satu berbeda, fungsi mengembalikan `false` (diizinkan).

---

## 📁 4. BEDAH FILE 3: `lib/screens/daftar_pengalaman_screen.dart` (View 1)

Layar utama yang menampilkan portofolio riwayat pengalaman mahasiswa.

```dart
class _DaftarPengalamanScreenState extends State<DaftarPengalamanScreen> {
  final PengalamanViewModel _viewModel = PengalamanViewModel();

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  ...
```

### Konsep & Istilah Teknis yang Wajib Dikuasai:
1. **Apa maksud *Single Source of Truth*?**
   * *Jawaban:* Prinsip arsitektur di mana data riwayat pengalaman hanya disimpan dan diatur di **SATU tempat resmi**, yaitu di dalam `_viewModel`. Layar UI hanya menampilkan apa yang ada di ViewModel, sehingga data tidak pernah berbeda versi.
2. **Mengapa `_viewModel.dispose()` wajib dipanggil? (*Memory Leak Prevention*)**
   * *Jawaban:* Jika layar dihancurkan/ditutup tetapi listener ViewModel tidak dibersihkan, objek tersebut akan terus hidup di RAM HP (*Memory Leak*), membuat HP boros baterai dan lambat. Memanggil `dispose()` membersihkan memori dengan tertib.
3. **Mengapa menggunakan `ListenableBuilder` bukan `setState`?**
   * *Jawaban:* Sesuai Modul 4 Slide 10-11, `ListenableBuilder` mendengarkan `ChangeNotifier`. Ketika `notifyListeners()` berbunyi, **hanya widget di dalam builder ini yang dirender ulang**, sedangkan AppBar dan Scaffold tidak ikut dirender ulang. Ini jauh lebih cepat dan hemat daya.
4. **Apa fungsi kurung siku pada `Navigator.push<PengalamanModel>`? (*Generic Type*)**
   * *Jawaban:* Memberikan kepastian tipe (*Type-Safety*) bahwa nilai hasil kembalian (`result`) dari layar form PASTI bertipe objek `PengalamanModel`, bukan data lain yang salah.
5. **Bagaimana logika Empty State vs Populated List?**
   * *Jawaban:* Menggunakan operator ternary `_viewModel.isEmpty ? TampilanKosong() : ListView.builder(...)`. Jika data kosong, tampilkan pesan ramah dan tombol aksi; jika ada data, tampilkan deretan kartu.

---

## 📁 5. BEDAH FILE 4: `lib/screens/tambah_pengalaman_screen.dart` (View 2 - Form)

Layar formulir untuk menangkap input riwayat kegiatan mahasiswa.

```dart
class _TambahPengalamanScreenState extends State<TambahPengalamanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  ...
  bool _isLoading = false;
```

### Konsep & Istilah Teknis yang Wajib Dikuasai:
1. **Apa fungsi `GlobalKey<FormState>()`?**
   * *Jawaban:* Kunci pengenal unik yang bertindak sebagai "remote control" untuk mengendalikan widget `Form`. Dengan memanggil `_formKey.currentState!.validate()`, seluruh field teks diperiksa validitasnya secara serentak.
2. **Mengapa butuh `TextEditingController` dan wajib di-`dispose()`?**
   * *Jawaban:* Controller berfungsi membaca teks ketikan pengguna, membersihkan spasi liar (`.trim()`), dan mengontrol kursor. Wajib di-`dispose()` di method `dispose()` agar tidak menimbulkan kebocoran memori RAM (*Memory Leak*).
3. **Apa fungsi `FocusScope.of(context).unfocus()`?**
   * *Jawaban:* Menutup keyboard virtual di layar HP secara otomatis saat tombol simpan ditekan, agar keyboard tidak menutupi tampilan dialog sukses.
4. **Bagaimana alur `_isLoading` bekerja?**
   * *Jawaban:* Saat submit ditekan, `_isLoading` diset `true`. Tombol langsung berubah menampilkan animasi `CircularProgressIndicator` dan tombol dinonaktifkan sementara (*disabled*) untuk mencegah pengguna menekan tombol berkali-kali (*anti double-submit*). Setelah jeda selesai, diset kembali `false`.
5. **Apa fungsi `barrierDismissible: false` pada `showDialog`?**
   * *Jawaban:* Mengunci popup modal sukses agar pengguna **tidak bisa menutup dialog secara tidak sengaja** hanya dengan mengetuk area kosong di luar kotak dialog. Pengguna wajib menekan tombol di dalam dialog.
6. **Bagaimana data dikembalikan ke layar awal? (*Backward Result Passing*)**
   * *Jawaban:* Menggunakan perintah `Navigator.pop(context, newPengalaman)`. Objek model baru dikirimkan kembali ke layar pemanggil.

---
👉 **Langkah Selanjutnya:** Lanjutkan ke modul teori perkuliahan untuk menguasai konsep dasar dari Modul 1 s.d. 4: [**03_PENGUASAAN_TEORI_4_MODUL.md**](./03_PENGUASAAN_TEORI_4_MODUL.md).
