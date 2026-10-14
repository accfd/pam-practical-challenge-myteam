# 📘 Modul 4: Interaksi Pengguna, Manajemen State & Navigasi Antar Layar

> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Institusi:** Universitas Andalas  
> **Fokus Utama:** *Event handling*, manipulasi state lokal dengan `StatefulWidget` & `setState()`, validasi form dengan `GlobalKey`, feedback multi-kondisi, dan navigasi bolak-balik membawa data.

---

## 🎯 Tujuan Pembelajaran
Setelah mempelajari modul ini, mahasiswa diharapkan mampu:
1. **Menangani Event & Interaksi Pengguna:** Menggunakan event handler seperti `onPressed`, `onChanged`, dan `onTap`.
2. **Mengelola State Lokal Interaktif:** Menggunakan `StatefulWidget` dan memicu pembaruan UI secara tepat dengan `setState()`.
3. **Membangun Form Tervalidasi & Menangani Edge Cases:** Memanfaatkan `Form`, `TextFormField`, dan `GlobalKey<FormState>`.
4. **Memberikan Feedback Pengguna:** Menampilkan status proses, error inline, dan modal konfirmasi keberhasilan.
5. **Mengimplementasikan Navigasi Lengkap (*Navigation Flow*):** Memahami *navigation stack*, mengirim data ke halaman baru (*push*), dan mengembalikan data hasil (*pop result*).

---

## 💡 Kutipan Pengantar
> *"Don’t make me think!"*  
> — **Steve Krug** (*A Common Sense Approach to Web Usability*)  
*(Aplikasi yang baik tidak membuat pengguna bingung. Setiap interaksi, respon error, dan alur navigasi harus terasa jelas dan alami).*

---

## ⚡ 1. Alur Perilaku Aplikasi (*Application Behavior Model*)

Aplikasi mobile nyata bukan sekadar gambar diam, melainkan sistem yang terus merespon pengguna. Seluruh modul ini terangkum dalam satu siklus perilaku utuh:

```text
┌──────────────┐     ┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  USER ACTION │ ──► │ EVENT HANDLER│ ──► │ STATE CHANGE │ ──► │  REBUILD UI  │
│ Tap / Input  │     │  onPressed   │     │  setState()  │     │ Tampilan Baru│
└──────────────┘     └──────────────┘     └──────────────┘     └──────────────┘
```

### Event Handlers Utama di Flutter:
* **Tombol (`ElevatedButton`, `IconButton`):** Memiliki callback `onPressed` untuk memicu aksi submit atau membuka form.
* **Input Teks (`TextField`, `TextFormField`):** Memiliki callback `onChanged` untuk mendeteksi setiap ketikan pengguna.
* **Gestur Sembarang Widget (`GestureDetector`, `InkWell`):** Callback `onTap` untuk membuat container atau gambar dapat disentuh.
* **Toggle / Pilihan (`Switch`, `Checkbox`):** Callback `onChanged` untuk mengubah nilai boolean.

---

## 📝 2. Logika Pemrosesan Input & `TextEditingController`

Input bukan hanya mengumpulkan huruf, tetapi **memahami niat pengguna (*user intent*)**:
1. Menghapus spasi tidak sengaja di awal/akhir dengan `.trim()`.
2. Memeriksa apakah input kosong (`.isEmpty`).
3. Memastikan tipe data sesuai (misalnya konversi string angka ke integer dengan `int.tryParse()`).

### Penggunaan `TextEditingController`:
Digunakan ketika aplikasi membutuhkan akses langsung ke nilai teks yang sedang diketik atau ingin mengubah isi input secara programatis.

```dart
class _ContohInputState extends State<ContohInput> {
  // 1. Inisialisasi controller
  final _namaController = TextEditingController();

  @override
  void dispose() {
    // 2. WAJIB membebaskan memori controller saat widget ditutup
    _namaController.dispose();
    super.dispose();
  }

  void _simpan() {
    // 3. Membaca teks input yang sudah dibersihkan
    final nama = _namaController.text.trim();
    if (nama.isNotEmpty) {
      print('Nama tersimpan: $nama');
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _namaController,
      decoration: const InputDecoration(labelText: 'Nama Lengkap'),
    );
  }
}
```

---

## 🔄 3. Mengelola State Interaktif dengan `setState()`

### Tiga Konsep Kunci:
1. **State:** Data yang dapat berubah selama aplikasi berjalan (contoh: indeks kategori yang dipilih, daftar item).
2. **`setState()`:** Fungsi yang memberi tahu Flutter: *"Data telah berubah, tolong gambar ulang (rebuild) widget ini!"*
3. **`build()`:** Fungsi yang dipanggil kembali untuk menghasilkan antarmuka baru sesuai nilai state terkini.

```dart
int _jumlah = 1;

void _tambahJumlah() {
  setState(() {
    _jumlah++; // State berubah, UI otomatis ter-update
  });
}
```

---

## 🛡️ 4. Validasi Form yang Kuat (*Robust Form Validation*)

Untuk mencegah data kotor masuk ke sistem, gunakan widget `Form` yang dikendalikan oleh `GlobalKey<FormState>`:

```dart
final _formKey = GlobalKey<FormState>();

// Di dalam build:
Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        controller: _tahunController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(labelText: 'Tahun Kegiatan'),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Tahun wajib diisi!';
          }
          final tahun = int.tryParse(value.trim());
          if (tahun == null) {
            return 'Tahun harus berupa angka!';
          }
          if (tahun < 2000 || tahun > 2026) {
            return 'Rentang tahun valid: 2000 - 2026!';
          }
          return null; // Return null artinya input VALID!
        },
      ),
      ElevatedButton(
        onPressed: () {
          // Memeriksa seluruh validator dalam Form secara serentak
          if (_formKey.currentState!.validate()) {
            // Semua field valid -> lanjutkan proses penyimpanan
          }
        },
        child: const Text('Simpan'),
      ),
    ],
  ),
);
```

---

## 💬 5. Mekanisme Feedback Pengguna (Multi-State Feedback)

Aplikasi harus selalu memberikan kepastian visual kepada pengguna dalam 3 kondisi:
1. **Kondisi Invalid / Gagal:** Pesan error warna merah langsung muncul di bawah field terkait (`errorBorder`).
2. **Kondisi Proses (*Loading*):** Menampilkan `CircularProgressIndicator` saat proses penyimpanan/jaringan berlangsung.
3. **Kondisi Berhasil (*Success*):** Menampilkan popup dialog konfirmasi (`showDialog` / `AlertDialog`) atau notifikasi bawah (`SnackBar`).

---

## 🧭 6. Arsitektur Navigasi: Navigation Stack (Push & Pop)

Flutter mengelola perpindahan halaman menggunakan prinsip tumpukan kartu (*Stack - Last In, First Out / LIFO*):

```text
[ TambahPengalamanScreen ]  ▲ Layar paling atas (tampak oleh user)
[ DaftarPengalamanScreen ]  │ Layar di bawahnya (tertahan di memory)
```

### 1. Berpindah Halaman & Menunggu Hasil (`Navigator.push`):
```dart
void _bukaHalamanTambah() async {
  // Pindah ke halaman form dan menunggu (await) sampai halaman tersebut ditutup
  final result = await Navigator.push<PengalamanModel>(
    context,
    MaterialPageRoute(builder: (ctx) => const TambahPengalamanScreen()),
  );

  // Jika halaman form mengembalikan data (bukan sekadar tekan tombol back)
  if (result != null) {
    setState(() {
      _listPengalaman.add(result); // Tambahkan ke daftar utama
    });
  }
}
```

### 2. Menutup Halaman & Mengembalikan Data (`Navigator.pop`):
```dart
void _selesaiDanKirimData(PengalamanModel dataBaru) {
  // Menutup layar saat ini dan mengoper data kembali ke pemanggil
  Navigator.pop(context, dataBaru);
}
```

---

## 🏁 Rangkuman Inti Modul 4
* Interaksi pengguna yang solid menggabungkan: **Input Handler $ightarrow$ Validasi Berlapis $ightarrow$ Feedback Jelas $ightarrow$ Pembaruan State.**
* `TextEditingController` harus selalu memiliki pasangan `.dispose()` untuk mencegah memory leak.
* Pola komunikasi data dua arah menggunakan `await Navigator.push()` dan `Navigator.pop(context, result)` adalah standar emas dalam Flutter untuk alur pengisian form.
