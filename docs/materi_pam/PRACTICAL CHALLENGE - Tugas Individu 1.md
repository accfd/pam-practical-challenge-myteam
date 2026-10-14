# 📋 Praktikal Challenge: Membangun Satu Alur Kerja Lengkap (*Build One Complete Workflow*)

> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Jenis Tugas:** Tugas Individu 1  
> **Institusi:** Universitas Andalas  
> **Fokus Evaluasi:** Kemampuan mahasiswa merancang dan memahami alur kerja fitur interaktif dari awal hingga akhir (*Event $ightarrow$ State $ightarrow$ Validation $ightarrow$ Feedback $ightarrow$ Navigation/Result*).

---

## 📌 1. Deskripsi Tugas

Setiap mahasiswa diminta membuat **1 workflow fitur yang lengkap dan dapat dijalankan (*executable*)** dari awal sampai akhir pada aplikasi mobile.

Sangat disarankan menggunakan salah satu fitur dari modul proyek kelompok masing-masing (misalnya pada aplikasi **MyTeam App: Fitur Portofolio Riwayat Pengalaman Mahasiswa - FR-05**), sehingga tugas mandiri ini sekaligus berkontribusi langsung pada penyelesaian proyek besar kelompok.

---

## 🔄 2. Lima Tahapan Wajib dalam Workflow

Workflow yang dibuat wajib menunjukkan 5 tahapan yang saling terhubung erat:

```text
[1. Input / Event] ──► [2. State] ──► [3. Validation] ──► [4. Feedback] ──► [5. Navigation / Result]
```

| Tahap | Pertanyaan Kunci | Contoh Implementasi |
|---|---|---|
| **1. Input / Event** | Apa yang dilakukan oleh pengguna? | Menekan tombol *"Tambah Pengalaman"*, mengetik nama kegiatan, memilih tahun, tap *"Simpan"*. |
| **2. State** | Data atau kondisi apa yang berubah setelah event? | Nilai pada `TextEditingController`, instansiasi objek `PengalamanModel`, penambahan data ke `List<PengalamanModel>`. |
| **3. Validation** | Apa yang dianggap tidak valid dan bagaimana aplikasi menolaknya? | Validasi field wajib diisi, validasi format tahun berupa angka, serta batas tahun logis ($2000 \le 	ext{tahun} \le 2026$). |
| **4. Feedback** | Apa yang ditampilkan saat proses berhasil, gagal, atau berlangsung? | Border merah dan teks peringatan jika input salah; Modal Dialog popup sukses bertema hijau saat data berhasil disimpan. |
| **5. Navigation / Result** | Ke mana pengguna dibawa dan data apa yang diteruskan/dikembalikan? | `Navigator.push` membuka form; `Navigator.pop(context, newPengalaman)` mengembalikan data baru ke daftar utama untuk langsung dirender. |

---

## 📑 3. Ketentuan Pengerjaan Tugas
1. **Workflow Berjalan Utuh:** Aplikasi wajib dapat dijalankan langsung di emulator/perangkat fisik (bukan sekadar desain UI statis tanpa logika).
2. **Memiliki Awal, Proses, dan Akhir yang Jelas:** Mulai dari layar awal (daftar/empty state), pembukaan form, pengisian, hingga data tampil di layar awal.
3. **Minimal Terdapat 1 Aturan Validasi:** Aplikasi harus mampu menolak input yang salah dan mengunci aksi penyimpanan sampai kesalahan diperbaiki.
4. **Terdapat Feedback Visual:** Pengguna harus mengetahui secara pasti apakah aksinya berhasil atau gagal.
5. **Dua Arah Navigasi Data (*Data Passing & Return*):** Menunjukkan data yang dikirim ke layar berikutnya atau data hasil (*result*) yang dikembalikan ke layar pemanggil.

---

## 🎤 4. Tata Cara Demo & Code Review (Pertemuan Ke-7)

* **Pelaksanaan:** Sesi tatap muka satu per satu (*one-on-one*) bersama dosen pengampu.
* **Materi Uji:**
  1. Mahasiswa mendemokan aplikasi yang berjalan pada emulator/smartphone.
  2. Mahasiswa menunjukkan *source code* dan menjelaskan alur 5 tahap workflow.
  3. Mahasiswa menjawab pertanyaan konseptual seputar kode yang dibuat.
  4. **Live-Coding Challenge:** Dosen akan memberikan instruksi perubahan kecil secara langsung pada kode (misalnya mengubah batas validasi angka, mengganti dialog menjadi snackbar, atau menambah field baru).
  5. Mahasiswa diperbolehkan dan diarahkan menggunakan **AI Coding Assistant** untuk membantu menyelesaikan modifikasi kode tersebut secara terarah.

---

## 🏆 5. Rubrik Penilaian Resmi (Skor Maksimal 100 / 4 Poin Tiap Kriteria)

| Kriteria Penilaian | Bobot | Kriteria Skor 4 (Excellent) | Kriteria Skor 3 (Good) | Kriteria Skor 2 (Fair) | Kriteria Skor 1 (Poor) |
|---|:---:|---|---|---|---|
| **1. Kelengkapan Workflow** | **25%** | Semua tahap workflow terlihat sangat jelas dan terhubung secara utuh tanpa celah. | Hampir semua tahap terlihat dan terhubung dengan baik. | Ada beberapa tahapan alur yang kurang jelas atau melompat. | Alur tidak lengkap / tidak menunjukkan alur kerja utuh. |
| **2. Implementasi & Fungsionalitas** | **25%** | Fitur berjalan lancar dari awal hingga akhir tanpa bug atau masalah berarti. | Fitur berjalan baik dengan sedikit kendala minor. | Fitur hanya berjalan sebagian. | Fitur gagal dijalankan / mengalami crash. |
| **3. State & Data Flow** | **15%** | Perubahan state dan aliran data antar widget/layar sangat jelas dan dikelola secara benar. | Aliran data berjalan tetapi ada bagian manajemen state yang kurang rapi. | Hanya sebagian kecil state yang dikelola dengan benar. | Tidak mampu mendemonstrasikan perubahan state atau aliran data. |
| **4. Validation** | **15%** | Aturan validasi relevan, presisi, dan aplikasi menangani input salah secara tepat. | Validasi tersedia dan sebagian besar berfungsi baik. | Validasi sangat sederhana dan penanganannya kurang tepat. | Tidak ada validasi atau validasi tidak berfungsi. |
| **5. Feedback & Error Handling** | **10%** | Feedback informatif dan tepat sasaran untuk kondisi berhasil, gagal, maupun proses. | Feedback tersedia namun desain atau timing-nya belum optimal. | Feedback sangat terbatas atau kurang informatif. | Tidak ada feedback visual sama sekali. |
| **6. Navigation / Result** | **10%** | Navigasi berjalan sempurna dan data diteruskan serta dikembalikan dengan benar. | Navigasi berjalan dengan sedikit kekurangan minor. | Navigasi ada tetapi transfer data bermasalah. | Navigasi gagal atau data tidak kembali. |

---

## 💡 6. Kunci Sukses Mendapatkan Nilai 100
1. Kuasai fungsi `Navigator.push<Type>` dan `Navigator.pop(context, result)`.
2. Pahami mengapa `TextEditingController` memerlukan `.dispose()`.
3. Pahami bagaimana `_formKey.currentState!.validate()` memicu method `validator` pada tiap `TextFormField`.
4. Siap memodifikasi kode secara tenang saat live-coding challenge dengan panduan AI.
