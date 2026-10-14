# 🟢 CHECKPOINT 05: FORMULA PROMPTING AI CODING ASSISTANT
> **Target Skor:** 20 Poin (Kemampuan Pemanfaatan AI dalam Pemrograman)  
> **Fokus Utama:** Menyusun prompt yang jelas, spesifik, memiliki konteks, dan menghasilkan kode yang relevan sesuai panduan **Modul 2 Slide 24**.

---

## 🏆 STANDAR PENILAIAN RUBRIK AI (BOBOT 20%)

| Skor | Kriteria Rubrik | Apa yang Dilihat Dosen? |
|:---:|---|---|
| **4 (Excellent)** | **Prompt jelas, spesifik, memiliki konteks, dan menghasilkan solusi relevan.** | Mahasiswa tidak cuma menulis satu kalimat pendek, melainkan memberikan konteks file, tujuan spesifik, dan batasan arsitektur. |
| **3 (Good)** | Prompt cukup jelas dan solusi yang dihasilkan sesuai. | Prompt lumayan jelas tetapi ada konteks yang terlewat. |
| **2 (Fair)** | Prompt masih umum/kurang konteks dan perlu beberapa kali perbaikan. | Prompt terlalu pendek (misal: *"perbaiki error ini"*). |
| **1 (Poor)** | Tidak mampu menyusun prompt yang relevan atau memahami hasil AI. | Tidak tahu cara meminta tolong ke AI secara terarah. |

---

## 📐 FORMULA PROMPTING RESMI (MODUL 2 SLIDE 24)

$$\mathbf{PROMPT} = \mathbf{ROLE} + \mathbf{TASK} + \mathbf{CONTEXT} + \mathbf{CONSTRAINTS}$$

1. **ROLE (Peran):** Tetapkan siapa AI bertindak (misal: *"Sebagai Flutter mobile developer ahli arsitektur MVVM"*).
2. **TASK (Tugas):** Apa tindakan spesifik yang harus dilakukan (misal: *"Tolong tambahkan field baru 'penyelenggara'..."*).
3. **CONTEXT (Konteks):** Beritahu kondisi aplikasi saat ini dan nama file terkait (misal: *"Pada aplikasi MyTeam fitur portofolio mahasiswa di file lib/models/pengalaman_model.dart..."*).
4. **CONSTRAINTS (Batasan):** Apa yang tidak boleh dilanggar (misal: *"Tetap pertahankan Sound Null Safety, jangan ubah method lain, dan pastikan controller baru di-dispose"*).

---

## 📋 TEMPLATE PROMPT SIAP PAKAI SAAT LIVE-CODING

Jika dosen meminta kamu membuat prompt ke AI Coding Assistant di depannya, buka AI dan gunakan template di bawah ini:

### 1. Template: Mengubah Aturan Validasi
```text
Sebagai mobile developer Flutter profesional, tolong modifikasi aturan validasi tahun pada file lib/viewmodels/pengalaman_viewmodel.dart.

Konteks: Saat ini validasi menerima tahun antara 2000 hingga 2026.
Tugas: Ubah batas tahun yang diizinkan menjadi antara 2010 hingga 2030, serta perbarui pesan peringatan error-nya menjadi 'Masukkan tahun antara 2010 - 2030!'.
Batasan: Jangan mengubah fungsi validasi lainnya dan pertahankan penanganan safe numeric parsing (int.tryParse).
```

---

### 2. Template: Menambahkan Field Input Baru
```text
Sebagai software engineer Flutter ahli, tolong bantu saya menambahkan field baru 'penyelenggara' pada aplikasi ini.

Konteks: Aplikasi menggunakan pola arsitektur Pure MVVM (Model di lib/models/pengalaman_model.dart, Form di lib/screens/tambah_pengalaman_screen.dart, dan Daftar di lib/screens/daftar_pengalaman_screen.dart).
Tugas:
1. Tambahkan atribut final String penyelenggara pada class PengalamanModel.
2. Tambahkan TextEditingController dan TextFormField 'Penyelenggara' (wajib diisi) pada form.
3. Tampilkan penyelenggara tersebut di dalam widget Card pada layar daftar pengalaman.
Batasan: Terapkan Immutability, Sound Null Safety (required), dan pastikan controller baru di-dispose dengan benar di method dispose().
```

---

### 3. Template: Mengubah Respon Feedback Visual
```text
Sebagai frontend Flutter developer, tolong ubah mekanisme feedback sukses pada file lib/screens/tambah_pengalaman_screen.dart.

Konteks: Saat ini ketika form berhasil disubmit, aplikasi menampilkan popup AlertDialog (Modal Dialog).
Tugas: Ganti AlertDialog tersebut sehingga setelah jeda loading 700ms selesai, layar form langsung melakukan Navigator.pop(context, newPengalaman) kembali ke halaman utama.
Batasan: Objek newPengalaman tetap harus dikembalikan ke layar pemanggil agar kartu baru tetap ter-render di halaman beranda.
```

---

### 4. Template: Mengatasi Error / Debugging
```text
Sebagai Flutter debugging specialist, tolong bantu saya menganalisis dan memperbaiki error berikut:
[Paste pesan error dari terminal/log]

Konteks: Error ini muncul saat tombol Simpan ditekan pada layar TambahPengalamanScreen.
Tugas: Jelaskan penyebab error secara ringkas dan berikan potongan kode solusinya.
Batasan: Berikan solusi yang langsung memperbaiki root cause tanpa merusak alur data passing antar screen.
```

---

## ❌ CONTOH SALAH VS ✅ CONTOH BENAR DI DEPAN DOSEN

* ❌ **Contoh Salah (Prompt Malas & Kurang Konteks - Nilai Rendah):**
  > *"Tolong ubah validasi tahunnya dong jadi 2030."*  
  *(AI bisa salah mengubah file atau merusak arsitektur MVVM karena tidak diberi tahu nama file dan batasannya).*

* ✅ **Contoh Benar (Prompt Profesional Sesuai Formula - Nilai Maksimal 4 Poin):**
  > *"Sebagai Flutter developer, tolong ubah batas validasi tahun pada file lib/viewmodels/pengalaman_viewmodel.dart agar menerima tahun 2010 sampai 2030. Pertahankan int.tryParse dan pesan error yang deskriptif."*

---
🎉 **Selamat!** Kamu sudah memiliki 5 modul roadmap persiapan yang super lengkap. Kamu siap menghadapi sesi tatap muka dan meraih skor sempurna 100! 🚀🎓
