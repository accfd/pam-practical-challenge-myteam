# 📚 KONSEP STRUKTUR DATA NAVIGATION STACK (PUSH & POP)
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5) — Universitas Andalas  
> **Referensi Modul:** [Modul 4: User Interaction, State & Navigation](https://github.com/accfd/pam-practical-challenge-myteam/blob/main/docs/materi_pam/Module%204%20User%20Interaction%2C%20State%20%26%20Navigation.md)  
> **Aplikasi Studi Kasus:** MyTeam App — Fitur FR-05 (Portofolio Riwayat Pengalaman Mahasiswa)

---

## 📌 HUBUNGAN NAVIGASI FLUTTER DENGAN STRUKTUR DATA STACK

Hubungannya **sangat erat dan langsung**, karena sistem navigasi di Flutter (dan semua sistem operasi mobile seperti Android/iOS) **100% mengimplementasikan Struktur Data Stack (Tumpukan)**.

Bahkan, nama method resminya yaitu **`Navigator.push()`** dan **`Navigator.pop()`** diambil langsung dari istilah resmi operasi pada struktur data Stack dalam ilmu komputer (*Computer Science Fundamentals*).

---

## 📚 1. APA ITU STACK (TUMPUKAN)?

Dalam ilmu komputer, **Stack** adalah struktur data linier yang bekerja dengan prinsip:

$$\mathbf{LIFO} \quad (\mathbf{Last} \text{ } \mathbf{In,} \text{ } \mathbf{First} \text{ } \mathbf{Out})$$

> *"Elemen yang **terakhir kali dimasukkan** adalah elemen yang **pertama kali dikeluarkan**."*  
> (Persis seperti tumpukan buku, piring di meja prasmanan, atau tumpukan kartu).

Di Flutter, sistem pengelola tumpukan halaman ini disebut **Navigation Stack**.

---

## 🔄 2. HUBUNGAN PUSH & POP DENGAN STACK DI MYTEAM APP

Mari kita lihat apa yang terjadi di dalam memori HP kamu langkah demi langkah:

### 🔹 KONDISI 1: Saat Aplikasi Pertama Kali Dibuka
Di dalam Navigation Stack hanya ada 1 layar:
```text
┌─────────────────────────────────┐
│ 1. DaftarPengalamanScreen       │ ◄── TOP OF STACK (Layar aktif yang sedang dilihat user)
└─────────────────────────────────┘
```

---

### 🔹 KONDISI 2: Saat Menekan Tombol "Tambah Pengalaman"
Di kodingan kamu memanggil [lib/screens/daftar_pengalaman_screen.dart: baris 25](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/daftar_pengalaman_screen.dart#L25):
```dart
final result = await Navigator.push<PengalamanModel>(
  context,
  MaterialPageRoute(
    builder: (ctx) => TambahPengalamanScreen(
      pengalamanTerdaftar: _viewModel.listPengalaman,
    ),
  ),
);
```
* **Hubungan dengan Stack:** Operasi **`push`** artinya *menaruh elemen baru di posisi paling atas tumpukan (Top of Stack)*.
* **Kondisi Stack Sekarang:**
```text
┌─────────────────────────────────┐
│ 2. TambahPengalamanScreen       │ ◄── TOP OF STACK BARU (Layar form menutupi layar lama)
├─────────────────────────────────┤
│ 1. DaftarPengalamanScreen       │ ◄── Masih hidup di memori, tetapi tertutup di bawahnya
└─────────────────────────────────┘
```
Pengguna sekarang melihat form input di layar HP-nya.

---

### 🔹 KONDISI 3: Saat Form Berhasil Disimpan & Tombol OK Ditekan
Di kodingan kamu memanggil [lib/screens/tambah_pengalaman_screen.dart: baris 84](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_pengalaman/lib/screens/tambah_pengalaman_screen.dart#L84):
```dart
Navigator.pop(context, newPengalaman);
```
* **Hubungan dengan Stack:** Operasi **`pop`** artinya *mengangkat dan membuang elemen teratas dari tumpukan*.
* Layar `TambahPengalamanScreen` dihancurkan dari memori (*destroyed*), sambil melemparkan objek data `newPengalaman` ke layar pemanggil di bawahnya (*return result*).
* **Kondisi Stack Kembali:**
```text
┌─────────────────────────────────┐
│ 1. DaftarPengalamanScreen       │ ◄── TOP OF STACK KEMBALI (Layar utama otomatis muncul lagi!)
└─────────────────────────────────┘
```

---

## 📊 3. TABEL PERBANDINGAN OPERASI PUSH VS POP

| Pembeda | `Navigator.push()` | `Navigator.pop()` |
|---|---|---|
| **Arah Alur** | **Maju** ke layar berikutnya | **Mundur** / Kembali ke layar sebelumnya |
| **Operasi Stack** | Menambahkan elemen baru ke puncak *stack* | Menghapus elemen aktif dari puncak *stack* |
| **Status Layar Lama** | Tetap tersimpan di memori di lapisan bawah | Layar aktif dihancurkan, layar di bawahnya aktif lagi |
| **Arah Data Passing** | *Forward Passing* (via *constructor*) | *Backward Passing* (via *return argument*) |
| **Analogi Kehidupan** | Membuka lembaran baru buku ke depan | Menutup lembaran aktif dan kembali ke halaman sebelumnya |

---

## 🗣️ 4. CARA MENJAWAB KE DOSEN (NILAI MAKSIMAL 4 POIN):

Jika dosen bertanya:  
> *"Apa hubungan fungsi `Navigator.push` dan `Navigator.pop` dengan konsep struktur data Stack?"*

**Jawaban Cerdas Kamu (Fuadi):**
> *"Izin menjawab Pak/Bu. Sistem navigasi di Flutter mengimplementasikan struktur data **Navigation Stack** dengan prinsip **LIFO (Last In, First Out)**:*  
> 1. *Operasi **`push()`** bertugas memasukkan halaman baru ke puncak stack (*Top of Stack*), seperti saat `DaftarPengalamanScreen` membuka `TambahPengalamanScreen` sambil menunggu balikan data menggunakan kata kunci `await`.*  
> 2. *Sedangkan operasi **`pop()`** bertugas mengeluarkan dan menghancurkan halaman teratas dari stack, sehingga halaman yang berada di bawahnya otomatis kembali aktif ke hadapan pengguna.*  
> 3. *Itulah kenapa di Flutter nama fungsinya menggunakan istilah standar ilmu komputer, yaitu `push()` dan `pop()`."*

Dosen akan langsung melihat bahwa kamu tidak hanya bisa merancang tampilan antarmuka, melainkan **benar-benar memahami konsep fundamental ilmu komputer (*Computer Science*)** di balik framework Flutter! 🚀💯
