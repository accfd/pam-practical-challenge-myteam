# 🤖 PANDUAN LENGKAP PROMPTING AI CODING ASSISTANT
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5) — Universitas Andalas  
> **Komponen Penilaian:** Kemampuan Pemanfaatan AI dalam Pemrograman (**Bobot 20%**)  
> **Target Capaian:** **Excellent (4 Poin Penuh)** — *"Prompt jelas, spesifik, memiliki konteks dan menghasilkan solusi relevan"*  
> **Referensi Modul Resmi:** Slide *"From Vague Prompt to Structured Prompt"* & Formula R-C-T-C-O / C-T-C-O-V  
> **Aplikasi:** MyTeam App — Portofolio Pengalaman Mahasiswa UNAND

---

## 🏆 1. RUBRIK PENILAIAN DOSEN (BOBOT 20%)

```text
┌─────────────────┬──────────┬────────────────────────────────────────────────────────────────────────┐
│ Tingkat Skor    │ Poin     │ Kriteria Penilaian Dosen                                               │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ 🌟 Excellent    │ 4 Poin   │ Prompt jelas, spesifik, memiliki konteks, batasan teknis kuat,         │
│                 │          │ dan langsung menghasilkan solusi yang relevan tanpa bolak-balik error. │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ 👍 Good         │ 3 Poin   │ Prompt cukup jelas, solusi sesuai, tapi konteks/batasan kurang lengkap.│
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ ⚠️ Fair         │ 2 Poin   │ Prompt terlalu umum/singkat, kurang konteks, butuh beberapa perbaikan. │
├─────────────────┼──────────┼────────────────────────────────────────────────────────────────────────┤
│ ❌ Poor         │ 1 Poin   │ Tidak mampu menyusun prompt yang relevan atau tidak paham kode AI.     │
└─────────────────┴──────────┴────────────────────────────────────────────────────────────────────────┘
```

---

## 🔍 2. DUA FORMULA RESMI: MODUL KULIAH (C-T-C-O-V) VS METODE R-C-T-C-O

Berdasarkan slide materi kuliah resmi (**"From Vague Prompt to Structured Prompt"**), dosen mengajarkan perbedaan antara prompt yang ambigu (*Vague*) dengan prompt yang terstruktur (*Structured*):

### A. 5 Elemen Resmi dari Slide Modul Kuliah (C-T-C-O-V):
1. **Context:** Project background + target users (aplikasi apa & untuk siapa).
2. **Task:** Specific problem / function (fungsi atau masalah konkret yang ingin diselesaikan).
3. **Constraints:** Flutter + Dart + scope (aturan arsitektur, bahasa, batasan teknologi).
4. **Expected Output:** Files, code, explanation (format luaran yang diharapkan).
5. **Validation:** Edge cases + tests (penanganan kasus khusus, null safety, & unit test).

### B. Hubungannya dengan Metode R-C-T-C-O:
- Di industri & perkuliahan, elemen **Role** (*"Bertindaklah sebagai Senior Flutter Developer"*) sering ditambahkan di paling awal sebagai pembuka persona AI.
- Sedangkan **Expected Output** dan **Validation** pada slide modul dirangkum ke dalam **Output** dan **Constraints**.
- **Keduanya 100% selaras dan saling melengkapi!**

---

## ⚡ 3. TEMPLATE PROMPT "SAKTI" UNIVERSAL (TINGGAL GANTI TASK!)

Ini adalah template pamungkas yang bisa kamu pakai di **segala kondisi saat live review**.  
Semua bagian **Context**, **Constraints**, **Expected Output**, dan **Validation** sudah **DIKUNCI / PERMANEN** untuk proyek *MyTeam*.  

Kamu **HANYA PERLU MENGGANTI 1-2 KALIMAT DI BAGIAN `[TASK]`** sesuai apa pun yang diperintahkan oleh dosen!

```text
[CONTEXT]
Aplikasi Flutter 'MyTeam' untuk portofolio riwayat pengalaman mahasiswa UNAND menggunakan Material 3 dan arsitektur MVVM (Model di lib/models/, ViewModel di lib/viewmodels/, dan View di lib/screens/).

[TASK]
>>> [ISI PERINTAH SPONTAN DOSEN DI SINI] <<<

[CONSTRAINTS]
Gunakan Dart & Flutter dengan Sound Null Safety, pertahankan MVVM, jangan tambahkan package/library pihak ketiga baru, dan jangan merusak unit test yang sudah ada.

[EXPECTED OUTPUT]
Hanya berikan potongan kode yang dimodifikasi (Before vs After) beserta nama file dan penjelasannya.

[VALIDATION]
Tangani edge cases (pengecekan null, string kosong, safe parsing) dan cegah memory leak pada controller.
```

*(Catatan: Jika dosen suka role-playing, kamu cukup tambahkan di baris paling atas: `[ROLE] Bertindaklah sebagai Senior Flutter Developer.`)*

---

## 🎮 4. CONTOH PENERAPAN SPONTAN (TINGGAL ISI SLOT `[TASK]`)

Berikut contoh praktis bagaimana kamu cukup mengganti slot `[TASK]` saat dosen menyuruh hal-hal spontan:

---

### 📌 Skenario 1: "Coba pindahin button-nya ke atas!" (Kasus Nyata Temanmu)
Tinggal isi slot `[TASK]` dengan:
```text
[TASK]
Pada file lib/screens/tambah_pengalaman_screen.dart, pindahkan widget tombol ElevatedButton 'Simpan Pengalaman' dari bagian paling bawah form ke posisi paling atas form (tepat sebelum field input 'Judul Pengalaman') dan beri SizedBox(height: 16) sebagai pemisah di bawahnya.
```

#### 💡 Hasil Kode Before vs After:
```dart
// SEBELUM (Tombol di Paling Bawah Form):
ListView(
  children: [
    TextFormField(controller: _judulController, ...),
    SizedBox(height: 16),
    TextFormField(controller: _peranController, ...),
    SizedBox(height: 16),
    TextFormField(controller: _tahunController, ...),
    SizedBox(height: 16),
    TextFormField(controller: _deskripsiController, ...),
    SizedBox(height: 24),
    ElevatedButton(onPressed: _submitForm, child: Text('Simpan Pengalaman')),
  ],
)

// SESUDAH (Tombol Pindah ke Paling Atas Form):
ListView(
  children: [
    // 🟢 Tombol sekarang berada di paling atas
    ElevatedButton(
      key: const Key('btn_simpan_pengalaman'),
      onPressed: _isLoading ? null : _submitForm,
      child: _isLoading 
          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) 
          : const Text('Simpan Pengalaman'),
    ),
    const SizedBox(height: 16), // Jarak ke input berikutnya

    // Input form di bawahnya:
    TextFormField(controller: _judulController, ...),
    const SizedBox(height: 16),
    TextFormField(controller: _peranController, ...),
    const SizedBox(height: 16),
    TextFormField(controller: _tahunController, ...),
    const SizedBox(height: 16),
    TextFormField(controller: _deskripsiController, ...),
  ],
)
```

---

### 📌 Skenario 2: "Coba ubah batasan tahunnya jadi 2010 - 2030!"
Tinggal isi slot `[TASK]` dengan:
```text
[TASK]
Pada file lib/viewmodels/pengalaman_viewmodel.dart, modifikasi method validateTahun agar hanya menerima angka tahun antara 2010 hingga 2030, serta ubah pesan error-nya menjadi 'Masukkan tahun valid antara 2010 - 2030!'.
```

#### 💡 Hasil Kode:
```dart
String? validateTahun(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Tahun wajib diisi!';
  }
  final tahun = int.tryParse(value.trim());
  if (tahun == null || tahun < 2010 || tahun > 2030) {
    return 'Masukkan tahun valid antara 2010 - 2030!';
  }
  return null;
}
```

---

### 📌 Skenario 3: "Ganti Pop-up Dialog Sukses Jadi SnackBar!"
Tinggal isi slot `[TASK]` dengan:
```text
[TASK]
Pada file lib/screens/tambah_pengalaman_screen.dart, hapus pop-up AlertDialog ketika form berhasil disimpan. Ganti alurnya agar langsung memanggil Navigator.pop(context, newPengalaman) dan tampilkan SnackBar hijau berpesan 'Pengalaman berhasil ditambahkan!'.
```

---

### 📌 Skenario 4: "Coba tambahkan field baru 'Penyelenggara'!"
Tinggal isi slot `[TASK]` dengan:
```text
[TASK]
Tambahkan field baru 'penyelenggara' (String):
1. Di PengalamanModel (lib/models/pengalaman_model.dart) dengan default value '' agar backward compatible.
2. Di TambahPengalamanScreen (lib/screens/tambah_pengalaman_screen.dart) tambahkan controller & TextFormField 'Penyelenggara'.
3. Di DaftarPengalamanScreen (lib/screens/daftar_pengalaman_screen.dart) tampilkan penyelenggara di dalam Card.
```

---

### 📌 Skenario 5: "Pindahkan tombol Tambah ke pojok kanan atas AppBar!"
Tinggal isi slot `[TASK]` dengan:
```text
[TASK]
Pada file lib/screens/daftar_pengalaman_screen.dart, tambahkan tombol aksi di AppBar (property actions) berupa IconButton dengan icon Icons.add yang jika diklik akan membuka TambahPengalamanScreen.
```

---

### 📌 Skenario 6: "Ada Error / Bug! Minta AI Perbaiki!" (Debugging)
Tinggal isi slot `[TASK]` dengan:
```text
[TASK]
Analisis dan perbaiki pesan error berikut yang muncul saat menjalankan aplikasi:
---
[PASTE PESAN ERROR DARI TERMINAL DI SINI]
---
Jelaskan penyebab error secara singkat dan tunjukkan perbaikan baris kodenya.
```

---

## ⚖️ 5. TABEL PERBANDINGAN NILAI RUBRIK (POOR HINGGA EXCELLENT)

| Tingkat Nilai | Contoh Prompt yang Diberikan Mahasiswa | Dampak / Penilaian Dosen |
|---|---|---|
| **❌ 1 Poin (Poor)** | *"Pindahin tombolnya ke atas"* | AI bingung tombol yang mana, di file apa, dan hasil kodenya bisa merusak arsitektur. Nilai terendah. |
| **⚠️ 2 Poin (Fair)** | *"Tolong pindahkan tombol simpan ke atas form di flutter"* | Prompt masih umum tanpa konteks proyek atau batasan teknis. Mahasiswa harus beberapa kali merevisi prompt. |
| **👍 3 Poin (Good)** | *"Pindahkan ElevatedButton simpan di tambah_pengalaman_screen.dart ke atas input judul"* | Solusi sesuai, tetapi belum ada batasan Sound Null Safety, MVVM, dan format output spesifik. |
| **🌟 4 Poin (Excellent)** | **Menggunakan Template Sakti (Context + Task spesifik + Constraints + Expected Output + Validation)** | AI menghasilkan kode tepat, bersih, tidak merusak test, dan langsung jalan dalam 1 kali percobaan! |

---

## 🗣️ 6. CARA MENJAWAB DAN MENJELASKAN KE DOSEN

Ketika dosen menanyakan alasan pembuatan prompt kamu:
> **Dosen:** *"Kenapa kamu bikin prompt yang detail seperti ini ke AI?"*

**Jawaban Cerdas Mahasiswa (Fuadi - Skor Maksimal):**
> *"Izin menjawab Pak/Bu. Mengacu pada materi modul perkuliahan **'From Vague Prompt to Structured Prompt'**, prompt yang ambigu (*Vague Prompt*) akan membuat AI mengasumsikan sendiri arsitektur dan teknologinya, sehingga kodenya sering salah atau error.*  
>
> *Oleh karena itu, saya menyusun prompt terstruktur dengan 5 pilar utama:*  
> 1. ***Context:*** *Memberitahukan bahwa proyek ini adalah MyTeam untuk mahasiswa UNAND dengan pola MVVM.*  
> 2. ***Task:*** *Menyebutkan secara presisi file dan widget yang ingin diubah.*  
> 3. ***Constraints:*** *Memberikan batasan tegas seperti Sound Null Safety dan larangan library pihak ketiga.*  
> 4. ***Expected Output:*** *Meminta format potongan kode Before vs After agar mudah ditinjau.*  
> 5. ***Validation:*** *Memastikan edge cases, null check, dan unit test tetap aman.*  
>
> *Dengan cara ini, AI bekerja secara terarah dan solusinya langsung relevan tanpa bolak-balik revisi."*

---

> [!TIP]
> File ini dirancang agar Fuadi tenang dan percaya diri saat live coding tatap muka. Cukup simpan template di atas di memori/catatan, lalu tinggal masukkan perintah spontan dosen ke bagian **`[TASK]`**! 🚀🎓
