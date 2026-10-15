# 🟢 CHECKPOINT 05: FORMULA PROMPTING AI CODING ASSISTANT (METODE R-C-T-C-O)
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5) — Universitas Andalas  
> **Target Skor:** **4 Poin (Excellent)** pada Rubrik Kemampuan Pemanfaatan AI (**Bobot 20%**)  
> **Fokus Utama:** Menyusun prompt yang jelas, spesifik, memiliki konteks, batasan teknis kuat, dan menghasilkan solusi relevan sesuai panduan **Modul 2 Slide 24** dan kaidah **R-C-T-C-O**.

---

## 🏆 STANDAR PENILAIAN RUBRIK AI (BOBOT 20%)

| Skor | Kriteria Rubrik | Apa yang Dilihat Dosen? | Strategi Mencapai Skor |
|:---:|---|---|---|
| **4 (Excellent)** | **Prompt jelas, spesifik, memiliki konteks, dan menghasilkan solusi relevan.** | Mahasiswa tidak cuma menulis satu kalimat pendek, melainkan memberikan konteks file, tujuan spesifik, arsitektur, dan batasan teknis. | Gunakan **Metode R-C-T-C-O** secara lengkap! |
| **3 (Good)** | Prompt cukup jelas dan solusi yang dihasilkan sesuai. | Prompt lumayan jelas tetapi ada konteks atau batasan yang terlewat. | Hanya menyebutkan tugas dan nama file tanpa batasan arsitektur. |
| **2 (Fair)** | Prompt masih umum/kurang konteks dan perlu beberapa kali perbaikan. | Prompt terlalu pendek (misal: *"perbaiki error ini"* atau *"pindahin tombolnya"*). | Bolak-balik merevisi prompt karena hasil AI salah. |
| **1 (Poor)** | Tidak mampu menyusun prompt yang relevan atau memahami hasil AI. | Tidak tahu cara meminta tolong ke AI secara terarah atau bengong. | Tidak menggunakan struktur prompt apa pun. |

---

## 📐 FORMULA PROMPTING RESMI: METODE R-C-T-C-O

$$\mathbf{PROMPT} = \mathbf{Role} + \mathbf{Context} + \mathbf{Task} + \mathbf{Constraints} + \mathbf{Output}$$

1. **ROLE (Peran):** Tetapkan siapa AI bertindak (misal: *"Bertindaklah sebagai Senior Flutter Developer."*).
2. **CONTEXT (Konteks Proyek):** Kondisi aplikasi dan file terkait (misal: *"Saya sedang membangun aplikasi Flutter 'MyTeam' untuk portofolio mahasiswa UNAND dengan Material 3 dan arsitektur MVVM di file lib/screens/tambah_pengalaman_screen.dart"*).
3. **TASK (Tugas Spesifik):** Instruksi perubahan dari dosen secara presisi (misal: *"Pindahkan tombol 'Simpan Pengalaman' ke posisi paling atas form sebelum input judul"*).
4. **CONSTRAINTS (Batasan Aturan):** Apa yang tidak boleh dilanggar (misal: *"Gunakan Sound Null Safety, pertahankan validasi _formKey, pertahankan loading indicator, jangan pakai package baru"*).
5. **OUTPUT (Format Luaran):** Format hasil yang diminta (misal: *"Berikan potongan kode Dart yang bersih beserta perbandingan before vs after"*).

---

## 📋 KUMPULAN PROMPT SIAP PAKAI SAAT LIVE CODING DENGAN DOSEN

### 1. Kasus Spontan: Memindahkan Tombol Simpan ke Atas Form (Kasus Nyata Pengujian)
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Saya sedang mengembangkan aplikasi Flutter 'MyTeam' pada file lib/screens/tambah_pengalaman_screen.dart. Saat ini tombol 'Simpan Pengalaman' (ElevatedButton) berada di posisi paling bawah ListView form.

Task:
Pindahkan widget tombol 'Simpan Pengalaman' ke posisi paling atas form, yaitu tepat sebelum input TextFormField 'Judul Pengalaman'. Berikan jarak SizedBox(height: 16) di bawah tombol.

Constraints:
- Pertahankan validasi FormState (_formKey.currentState!.validate()) dan pemanggilan ViewModel.
- Pastikan loading indicator (_isLoading ? CircularProgressIndicator : Text) tetap berfungsi.
- Gunakan Sound Null Safety.

Output:
Berikan potongan kode ListView form sebelum dan sesudah dipindahkan.
```

---

### 2. Kasus Spontan: Memindahkan Tombol Tambah ke AppBar (Layar Utama)
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Pada file lib/screens/daftar_pengalaman_screen.dart di aplikasi 'MyTeam', saya ingin memindahkan aksi tambah portofolio.

Task:
Tambahkan tombol aksi di AppBar (property actions) berupa IconButton dengan icon Icons.add. Ketika diklik, arahkan pengguna ke TambahPengalamanScreen dan tangani return value untuk disimpan ke ViewModel.

Constraints:
- Gunakan async-await saat Navigator.push.
- Pertahankan tampilan Empty State di body.

Output:
Tampilkan kode AppBar yang telah dimodifikasi.
```

---

### 3. Kasus Spontan: Mengubah Aturan Validasi Tahun
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Pada aplikasi Flutter 'MyTeam', logika validasi form dipisahkan di file lib/viewmodels/pengalaman_viewmodel.dart sesuai arsitektur MVVM.

Task:
Modifikasi fungsi 'validateTahun(String? value)' agar hanya menerima rentang tahun antara 2010 sampai 2030 (inklusif). Jika di luar rentang itu atau bukan angka, kembalikan pesan: 'Masukkan tahun valid antara 2010 - 2030!'.

Constraints:
- Wajib menggunakan int.tryParse() untuk safe numeric parsing.
- Pertahankan pengecekan string kosong.
- Jangan mengubah method lainnya.

Output:
Berikan kode fungsi validateTahun yang sudah diperbarui.
```

---

### 4. Kasus Spontan: Menambahkan Field Baru 'Penyelenggara'
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Aplikasi Flutter 'MyTeam' menggunakan arsitektur MVVM dengan file:
1. lib/models/pengalaman_model.dart
2. lib/screens/tambah_pengalaman_screen.dart
3. lib/screens/daftar_pengalaman_screen.dart

Task:
Tambahkan field baru 'penyelenggara' (String):
1. Tambahkan pada PengalamanModel dengan default value '' agar backward compatible.
2. Tambahkan controller dan TextFormField 'Penyelenggara' pada TambahPengalamanScreen.
3. Tampilkan penyelenggara pada Card pengalaman di DaftarPengalamanScreen.

Constraints:
- Semua atribut model harus final (immutable).
- Controller baru wajib di-dispose di method dispose().
- Sound Null Safety aktif.

Output:
Berikan potongan kode perubahan untuk model, form screen, dan card item.
```

---

### 5. Kasus Spontan: Mengganti Dialog Pop-up Menjadi SnackBar
```text
Role:
Bertindaklah sebagai Senior Flutter Developer.

Context:
Pada file lib/screens/tambah_pengalaman_screen.dart, aplikasi menampilkan AlertDialog setelah form sukses disimpan.

Task:
Hapus AlertDialog tersebut. Ganti alurnya sehingga setelah proses simpan selesai, langsung memanggil Navigator.pop(context, newPengalaman) dan tampilkan SnackBar hijau bertuliskan 'Pengalaman berhasil ditambahkan!'.

Constraints:
- Gunakan 'if (!mounted) return;' sebelum memanggil context.
- Objek newPengalaman tetap harus di-return agar data baru langsung muncul di layar utama.

Output:
Tampilkan potongan kode method _submitForm yang telah diperbarui.
```

---

### 6. Kasus Spontan: Mengatasi Error Debugging (Live Error Fixing)
```text
Role:
Bertindaklah sebagai Flutter Debugging Specialist.

Context:
Setelah memodifikasi file [Nama File], muncul pesan error berikut di debug console:
---
[PASTE PESAN ERROR]
---

Task:
1. Jelaskan penyebab error secara ringkas (1-2 kalimat).
2. Berikan perbaikan kode yang tepat pada baris yang bermasalah.

Constraints:
- Perbaiki hanya pada root cause error tanpa merombak struktur komponen lainnya.

Output:
Tunjukkan perbaikan kodenya beserta penjelasan letak barisnya.
```

---

## 🗣️ CARA MENJELASKAN KE DOSEN SAAT REVIEW (HAFALKAN INI!)

> *"Pak/Bu, dalam menyusun prompt untuk AI Coding Assistant, saya selalu menerapkan **Metode R-C-T-C-O**, yaitu mendefinisikan **Role** (Senior Flutter Dev), **Context** (proyek MyTeam, arsitektur MVVM, file terkait), **Task** (tugas spesifik seperti memindahkan tombol ke atas), **Constraints** (batasan seperti Sound Null Safety, pemanggilan _formKey validate, dan tanpa library baru), serta **Output** (kode bersih before-after). Dengan formula ini, AI langsung memberikan solusi yang 100% tepat dan tidak merusak arsitektur aplikasi."*

---

> [!TIP]
> Dokumentasi lengkap dengan komparasi before-after kode tersedia di [docs/PANDUAN_PROMPTING_AI_RCTCO.md](file:///d:/%23%23%20SEMESTER%205/Pengembangan%20Aplikasi%20Mobile/PRACTICAL%20CHALLENGE/myteam_app/docs/PANDUAN_PROMPTING_AI_RCTCO.md).
