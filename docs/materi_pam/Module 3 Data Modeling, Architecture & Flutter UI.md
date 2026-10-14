# 📘 Modul 3: Pemodelan Data, Arsitektur Aplikasi & Antarmuka Flutter

> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Institusi:** Universitas Andalas  
> **Fokus Utama:** Transformasi PRD ke Technical Design, perancangan ERD/Model Data Dart, pemisahan layer arsitektur, hierarki Widget Tree, dan perancangan UI adaptif.

---

## 🎯 Tujuan Pembelajaran
Setelah mempelajari modul ini, mahasiswa diharapkan mampu:
1. **Mentransformasikan Kebutuhan Produk ke Desain Teknis:** Menghubungkan PRD dengan arsitektur data dan UI.
2. **Merancang Model Data (Entity Modeling):** Membuat relasi entitas dan merepresentasikannya ke dalam kelas model Dart.
3. **Menerapkan Pemisahan Tanggung Jawab (*Separation of Concerns*):** Memisahkan lapisan tampilan (UI), logika bisnis, dan lapisan data.
4. **Memahami Konsep Dasar Widget & Widget Tree:** Mengetahui bagaimana Flutter membangun antarmuka secara deklaratif.
5. **Menerapkan Layout Constraints & UI Responsif:** Menggunakan `Column`, `Row`, `Expanded`, `ListView`, dan `Card` secara proporsional.

---

## 💡 Kutipan Pengantar
> *"Simplicity is prerequisite for reliability."*  
> — **Edsger W. Dijkstra**  
*(Kesederhanaan desain adalah prasyarat mutlak untuk menghasilkan perangkat lunak yang andal dan bebas bug).*

---

## 🔄 1. Dari Dokumen PRD Menuju Desain Teknis

| Dokumen PRD (What to Build) | Desain Teknis (How to Build) |
|---|---|
| Masalah pengguna & target audiens | Struktur Entitas Data & Relasi ERD |
| Daftar fitur & fungsionalitas | Pemilihan Pola Arsitektur (Layering) |
| Kriteria penerimaan (*Acceptance Criteria*) | Perancangan Antarmuka Widget & Komponen UI |

### Studi Kasus: Aplikasi Makanan Kampus (*Campus Food App*)
* **Kebutuhan PRD:** Mahasiswa ingin melihat daftar menu makanan di kantin kampus beserta kategori dan harganya.
* **Analisis Data:** Diperlukan 2 entitas: `Cafeteria` (Kantin) dan `MenuItem` (Menu Makanan).
* **Relasi Data:** 1 Kantin memiliki Banyak Menu Makanan (*One-to-Many / 1:N*).

---

## 🗄️ 2. Pemodelan Data & Dart Model Class

Untuk menjaga konsistensi data dan menghindari kesalahan pengetikan key pada struktur Map/JSON, data wajib dibungkus ke dalam **Class Model**:

```dart
/// Model data entitas Menu Makanan (Strongly-Typed)
class MenuItem {
  final String id;
  final String nama;
  final double harga;
  final String kategori;
  final String fotoUrl;
  final String kantinId;

  MenuItem({
    required this.id,
    required this.nama,
    required this.harga,
    required this.kategori,
    required this.fotoUrl,
    required this.kantinId,
  });

  // Konversi dari data Map/JSON ke objek Dart
  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['id'] as String,
      nama: json['nama'] as String,
      harga: (json['harga'] as num).toDouble(),
      kategori: json['kategori'] as String,
      fotoUrl: json['fotoUrl'] as String,
      kantinId: json['kantinId'] as String,
    );
  }

  // Konversi dari objek Dart ke format Map/JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'harga': harga,
      'kategori': kategori,
      'fotoUrl': fotoUrl,
      'kantinId': kantinId,
    };
  }
}
```

---

## 🏢 3. Pemisahan Layer Arsitektur (Separation of Concerns)

Aplikasi mobile yang baik tidak menumpuk seluruh kode di dalam satu file screen. Kode dibagi menjadi 3 lapisan independen:

```text
┌─────────────────────────────────────────────────────────────┐
│ 1. PRESENTATION LAYER (Lapisan Antarmuka / UI)              │
│    - Screens, Custom Widgets, Form Input                    │
│    - Tugas: Menampilkan data ke layar & menangkap aksi user │
├─────────────────────────────────────────────────────────────┤
│ 2. BUSINESS LOGIC LAYER (Lapisan Logika Bisnis)             │
│    - ViewModel / Controller / State Notifier                │
│    - Tugas: Mengelola state, memfilter data, validasi alur  │
├─────────────────────────────────────────────────────────────┤
│ 3. DATA LAYER (Lapisan Data)                                │
│    - Model Classes, API Services, Local Database            │
│    - Tugas: Mengambil & menyimpan data mentah               │
└─────────────────────────────────────────────────────────────┘
```

---

## 🧩 4. Konsep Fundamental Widget di Flutter

Di Flutter, **"Everything is a Widget"** (Semua komponen tampilan adalah widget).  
Flutter menggunakan pendekatan UI **Deklaratif**: Tampilan antarmuka adalah refleksi langsung dari state aplikasi saat ini:
$$	ext{UI} = f(	ext{State})$$

### Dua Jenis Widget Utama:
1. **StatelessWidget:** Widget statis yang tidak pernah berubah setelah dirender. Contoh: `Text`, `Icon`, `Divider`.
2. **StatefulWidget:** Widget dinamis yang dapat berubah tampilannya seiring interaksi pengguna atau perubahan data. Contoh: `Checkbox`, `TextField`, halaman Form.

---

## 🌳 5. Widget Tree & Layout Constraints

Antarmuka Flutter tersusun dalam struktur pohon hierarki (*Widget Tree*):

```text
Scaffold
 ├── AppBar
 │    └── Text("Daftar Pengalaman")
 └── Body: Padding
      └── Column
           ├── Container (Ringkasan Header)
           └── Expanded
                └── ListView.builder
                     └── Card (Item Pengalaman)
```

### Aturan Emas Layout di Flutter:
1. **Constraints go down:** Widget induk memberikan batasan ukuran (min/max lebar dan tinggi) kepada widget anak.
2. **Sizes go up:** Widget anak menentukan ukurannya sendiri berdasarkan batasan tersebut.
3. **Parents set positions:** Widget induk menentukan posisi peletakan widget anak pada layar.

> [!WARNING]
> Kesalahan umum `Unbounded height / RenderFlex overflowed`: Terjadi jika meletakkan `ListView` (yang butuh tinggi tak terbatas) langsung di dalam `Column` tanpa membungkusnya dengan `Expanded` atau `SizedBox`.

---

## 🎨 6. Komponen Inti UI (Material Design 3)

* **`Scaffold`:** Struktur dasar halaman yang menyediakan `appBar`, `body`, `floatingActionButton`, dan `bottomNavigationBar`.
* **`Column` & `Row`:** Menyusun widget secara vertikal atau horizontal.
* **`Container` & `Padding`:** Memberikan margin, padding, border radius, dan warna latar belakang.
* **`Card` & `ListTile`:** Menampilkan item data secara rapi dengan bayangan (*elevation*).
* **`ListView.builder`:** Merender daftar data dalam jumlah banyak secara efisien (*lazy rendering* hanya untuk item yang tampak di layar).

---

## 📐 7. Desain Responsif & Adaptif

Aplikasi harus nyaman dipandang di berbagai ukuran layar:
* **`MediaQuery.of(context).size`:** Mengetahui lebar dan tinggi layar pengguna secara real-time.
* **`LayoutBuilder`:** Menyesuaikan tata letak berdasarkan batasan ruang (*constraints*) komponen induk.
* **`Flexible` & `Expanded`:** Mengisi ruang kosong yang tersisa secara proporsional.

---

## 🏁 Rangkuman Inti Modul 3
* Technical design yang matang menjembatani kebutuhan PRD menjadi kode terstruktur.
* Data model bertipe kuat (*strongly-typed model*) mencegah bug dan mempermudah manipulasi data.
* Memahami relasi *Constraints* pada *Widget Tree* adalah kunci utama menghindari error layout saat mendesain UI Flutter.
