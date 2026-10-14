# 📘 Modul 2: Fondasi Dart, Pemrograman Berorientasi Objek (OOP), PRD & Prompt Engineering

> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Institusi:** Universitas Andalas  
> **Fokus Utama:** Sintaks dasar Dart, Sound Null Safety, paradigma OOP modern, penyusunan Product Requirements Document (PRD), dan teknik Prompt Engineering terstruktur untuk AI.

---

## 🎯 Tujuan Pembelajaran
Setelah mempelajari modul ini, mahasiswa diharapkan mampu:
1. **Memahami Peran Dart dalam Flutter:** Menjelaskan alasan Flutter menggunakan Dart sebagai fondasi utama.
2. **Menguasai Sintaks Inti Dart:** Menggunakan variabel, tipe data, control flow, collections, dan fungsi.
3. **Menerapkan OOP di Dart:** Membangun *class*, *constructor*, enkapsulasi, pewarisan (*inheritance*), dan *mixin*.
4. **Menyusun Dokumen Kebutuhan Produk (PRD):** Mengubah permasalahan nyata pengguna menjadi daftar kebutuhan teknis yang jelas.
5. **Menulis Prompt AI Terstruktur:** Memberikan konteks yang tepat kepada asisten AI agar menghasilkan kode berkualitas tinggi.

---

## 💡 Kutipan Pengantar
> *"The hardest single part of building a software system is deciding precisely what to build."*  
> — **Fred Brooks**  
*(Bagian tersulit dalam membangun sistem perangkat lunak adalah menentukan secara tepat apa yang sebenarnya perlu dibangun).*

---

## 🎯 1. Mengapa Flutter Menggunakan Bahasa Dart?
1. **Client-Optimized:** Dirancang khusus untuk kebutuhan pengembangan aplikasi antarmuka (*front-end UI*).
2. **Kompilasi Ganda (JIT & AOT):**
   - *Just-In-Time (JIT):* Mendukung fitur **Stateful Hot Reload** saat pengembangan, sehingga perubahan kode tampil seketika dalam hitungan milidetik.
   - *Ahead-Of-Time (AOT):* Mengompilasi kode langsung menjadi kode mesin biner (*native ARM/x86*) saat rilis, menghasilkan performa tinggi 60/120 FPS.
3. **Sound Null Safety:** Menjamin error *null pointer exception* terdeteksi sejak masa kompilasi (*compile-time*), bukan saat aplikasi berjalan di tangan pengguna.
4. **Semua Elemen adalah Objek:** Termasuk angka, fungsi, dan nilai boolean.

---

## 💻 2. Sintaks Dasar Dart

### Program Pertama
Eksekusi program Dart selalu dimulai dari fungsi utama tingkat teratas:
```dart
void main() {
  print('Hello, Flutter!');
}
```

### Variabel & Tipe Data
Dart mendukung *type inference* (menebak tipe data secara otomatis) serta deklarasi tipe eksplisit:
```dart
// Type inference (tipe otomatis terdeteksi sebagai String)
var nama = 'Alya'; 

// Deklarasi tipe eksplisit
int umur = 20;
double nilai = 87.5;
bool isActive = true;

// Variabel Immutable (nilai tidak dapat diubah setelah diisi)
final String mataKuliah = 'Pengembangan Aplikasi Mobile'; // Ditentukan saat runtime
const int batasTim = 5; // Konstanta compile-time
```

---

## 🛡️ 3. Konsep Sound Null Safety

Secara default di Dart modern, variabel bersifat **non-nullable** (tidak boleh bernilai null).
Jika suatu variabel memang diizinkan kosong, tambahkan tanda tanya (`?`):

```dart
String namaPasti = 'Fuadi'; // Tidak boleh null sama sekali
String? namaPanggilan = null; // Boleh berisi String atau null

// 1. Operator Null-Aware Access (?.)
// Memanggil method hanya jika objek TIDAK null
print(namaPanggilan?.toUpperCase()); // Menghasilkan: null (tidak crash)

// 2. Operator Null-Coalescing (??)
// Memberikan nilai default jika variabel bernilai null
print(namaPanggilan ?? 'Belum ada panggilan'); // Menghasilkan: 'Belum ada panggilan'

// 3. Operator Bang (!)
// Menegaskan kepada compiler bahwa nilai pasti TIDAK null (Gunakan hati-hati!)
String hasil = namaPanggilan!; // Berisiko crash jika ternyata bernilai null!
```

---

## 🗃️ 4. Struktur Data Koleksi (Collections)

### List (Daftar Berurutan)
```dart
List<String> anggota = ['Fuadi', 'Dhiya', 'Ulhaq'];
anggota.add('Budi');
print(anggota[0]); // Fuadi
print(anggota.length); // 4
```

### Map (Pasangan Key-Value / Dictionary)
```dart
Map<String, dynamic> mahasiswa = {
  'nim': '2411522001',
  'nama': 'Fuadi Dhiyaulhaq',
  'ipk': 3.90,
  'isActive': true,
};
print(mahasiswa['nama']); // Fuadi Dhiyaulhaq
```

### Set (Kumpulan Elemen Unik)
```dart
Set<String> kategoriUnik = {'Mobile', 'Web', 'Mobile'};
print(kategoriUnik); // {'Mobile', 'Web'} -> duplikat otomatis dihapus
```

---

## ⚙️ 5. Fungsi & Parameter Fleksibel

Dart mendukung *Named Parameters* di dalam tanda kurung kurawal `{}` yang sangat sering digunakan saat membuat widget Flutter:

```dart
// Named parameters dengan kata kunci 'required' dan nilai default
void buatProfil({
  required String nama,
  required String nim,
  String status = 'Aktif',
}) {
  print('Mahasiswa: $nama ($nim), Status: $status');
}

void main() {
  // Pemanggilan sangat jelas dan tidak bergantung pada urutan posisi
  buatProfil(nama: 'Fuadi', nim: '2411522001');
}
```

---

## 🏛️ 6. Pemrograman Berorientasi Objek (OOP) di Dart

### Deklarasi Class & Constructor Ringkas
```dart
class Mahasiswa {
  // Properti
  final String nim;
  final String nama;
  String jurusan;

  // Constructor ringkas khas Dart
  Mahasiswa({
    required this.nim,
    required this.nama,
    this.jurusan = 'Sistem Informasi',
  });

  // Method
  void perkenalkanDiri() {
    print('Halo, saya $nama dengan NIM $nim dari jurusan $jurusan.');
  }
}
```

### Enkapsulasi (Encapsulation)
Di Dart, tanda garis bawah (`_`) di depan nama variabel atau fungsi menandakan akses **private** dalam cakupan file (*library-private*):
```dart
class RekeningBank {
  double _saldo = 0; // Private field

  double get saldo => _saldo; // Getter

  void setor(double jumlah) {
    if (jumlah > 0) {
      _saldo += jumlah;
    }
  }
}
```

### Pewarisan (Inheritance) & Polimorfisme
```dart
class Pengguna {
  final String id;
  final String nama;
  Pengguna(this.id, this.nama);

  void tampilkanInfo() => print('User: $nama');
}

class MahasiswaAktif extends Pengguna {
  final String semester;

  MahasiswaAktif(super.id, super.nama, this.semester);

  @override
  void tampilkanInfo() {
    super.tampilkanInfo();
    print('Status: Mahasiswa Aktif Semester $semester');
  }
}
```

---

## 📋 7. Product Requirements Document (PRD)

Sebelum menulis sebaris kode pun, pengembang profesional selalu mendefinisikan **apa yang akan dibangun** melalui dokumen PRD ringkas:

### Struktur Utama Dokumen PRD:
1. **Pernyataan Masalah (*Problem Statement*):** Apa masalah nyata yang dialami pengguna?
2. **Target Pengguna (*User Persona*):** Siapa yang akan menggunakan aplikasi ini?
3. **User Stories:** Deskripsi fitur dari sudut pandang pengguna:  
   *Format:* *"Sebagai [peran], saya ingin [aksi/fitur], sehingga [manfaat/tujuan]."*
4. **Kebutuhan Fungsional (*Functional Requirements*):** Daftar fitur wajib yang dapat dijalankan sistem.
5. **Kebutuhan Non-Fungsional:** Kecepatan respon, kemudahan navigasi, keamanan data.
6. **Batasan Cakupan (*Scope & Out-of-Scope*):** Apa yang dikerjakan pada versi ini dan apa yang ditunda.

---

## 🎯 8. Prompt Engineering untuk AI Coding Assistant

Memberikan instruksi yang buruk kepada AI akan menghasilkan kode yang buruk (*Garbage In, Garbage Out*).

### Rumus Prompt Terstruktur (Metode R-C-T-C-O):
1. **Role (Peran):** *"Bertindaklah sebagai Senior Flutter Developer."*
2. **Context (Konteks Proyek):** *"Saya sedang membangun aplikasi Flutter 'MyTeam' untuk portofolio mahasiswa UNAND menggunakan Material 3."*
3. **Task (Tugas Spesifik):** *"Buatkan satu file class model data Dart bernama 'PengalamanModel'."*
4. **Constraints (Batasan Aturan):** *"Gunakan null safety, semua properti final, sediakan named constructor, jangan gunakan library pihak ketiga."*
5. **Output (Format Luaran):** *"Hanya berikan kode Dart yang bersih beserta komentar dokumentasinya."*

---

## 🏁 Rangkuman Inti Modul 2
* Dart adalah bahasa modern yang aman (*type-safe & sound null safe*), menjadikannya fondasi ideal untuk Flutter.
* Pemahaman OOP (Class, Model, Enkapsulasi) wajib dikuasai untuk menyusun data model aplikasi mobile.
* Kombinasi dokumen spesifikasi yang jelas (PRD) dan instruksi terstruktur (Prompt Engineering) adalah kunci keberhasilan developer modern di era AI.
