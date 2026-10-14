# 📘 PRACTICAL CHALLENGE - Tugas Individu 1

> **Sumber File:** `PRACTICAL CHALLENGE - Tugas Individu 1.pdf`  
> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Total Halaman:** 3 Halaman  

---

## 📄 Halaman / Slide 1

PRACTICAL CHALLENGE
Build One Complete Workflow
Tugas Individu
1. Deskripsi Tugas
Setiap mahasiswa diminta membuat 1 workflow fitur yang lengkap dari awal
sampai akhir pada aplikasi mobile. Fitur yang dibuat sangat disarankan menggunakan
salah satu fitur dari modul project kelompok masing-masing, sehingga tugas ini
sekaligus dapat menjadi bagian dari project kelompok. Jika fitur project belum siap
digunakan, mahasiswa dapat membuat aplikasi sederhana khusus untuk
mendemonstrasikan workflow.
Workflow harus menunjukkan alur berikut:
Input / Event → State → Validation → Feedback → Navigation / Result
Tahap Yang Harus Ditunjukkan
Apa yang dilakukan user? Misalnya tap button, mengisi form,
Input / Event
atau memilih item.
State Data atau kondisi apa yang berubah setelah event?
Apa yang dianggap tidak valid dan bagaimana aplikasi
Validation
menanganinya?
Apa yang ditampilkan ketika proses berhasil, gagal, atau
Feedback
sedang berlangsung?
Setelah proses selesai, user dibawa ke mana atau hasil apa
Navigation / Result
yang diterima?

| Tahap | Yang Harus Ditunjukkan |
| --- | --- |
| Input / Event | Apa yang dilakukan user? Misalnya tap button, mengisi form, atau memilih item. |
| State | Data atau kondisi apa yang berubah setelah event? |
| Validation | Apa yang dianggap tidak valid dan bagaimana aplikasi menanganinya? |
| Feedback | Apa yang ditampilkan ketika proses berhasil, gagal, atau sedang berlangsung? |
| Navigation / Result | Setelah proses selesai, user dibawa ke mana atau hasil apa yang diterima? |

### 🖼️ Konten Slide Visual / Diagram / Kode (Slide 1)
```text
1 INPUT / EVENT What enters or gets tapped? My Tasks (2) STATE What changes? Add Task 3 VALIDATION What is invalid? Add Task 4 FEEDBACK Loading / success / error? Task added! 0K 5 NAVIGATION Where next? What data? My Tasks o Buy groceries Read a book GO for a run + Add Task User taps the "Add Task" button. Deliverable Buy coffee Add Open an input screen and update the form state as the user types. Enter a task... Task cannot be ertvty Add Show an error if the task is empty (or invalid). Show a success message (or error message if it fails). o Buy groceries o Read a book o GO for a run + Add Task Navigate back to the list, and display the new task. A working feature + a short explanation of its event, state, validation, feedback, and navigation.
```

---

## 📄 Halaman / Slide 2

Contoh Workflow: Fitur Tambah Task
User menekan Add Task → halaman form terbuka → user mengisi nama task →
aplikasi melakukan validasi → jika valid, task disimpan → muncul pesan “Task
added!” → kembali ke halaman daftar → task baru ditampilkan. Jika input tidak valid:
aplikasi menampilkan pesan error, aksi dapat ditolak atau tombol Add dapat
dinonaktifkan, dan user tetap berada di form untuk memperbaiki input.
2. Ketentuan
• Setiap mahasiswa membuat 1 workflow lengkap.
• Workflow harus dapat dijalankan, bukan hanya berupa desain UI.
• Harus memiliki awal, proses, dan hasil akhir yang jelas.
• Harus terdapat minimal 1 validasi.
• Harus terdapat feedback kepada user.
• Jika berpindah screen, tunjukkan data yang dikirim ke screen berikutnya.
• Jika ada hasil yang dikembalikan, tunjukkan result yang dikirim kembali ke
screen sebelumnya.
• Disarankan menggunakan fitur project kelompok masing-masing agar tugas ini
sekaligus membantu penyelesaian project.
3. Pengumpulan dan Demo
Tugas ini tidak perlu dikumpulkan melalui Ms.Teams. Namun, setiap mahasiswa wajib
mendemokan langsung workflow yang dibuat pada Pertemuan ke-7.
Hari/Tanggal Jumat, 9 Oktober 2026
Kegiatan Demo Tugas + Code Review
Kelas A 09.00–13.00 WIB
Kelas B 13.00–17.00 WIB
• Mahasiswa akan bergantian melakukan demo dan code review secara langsung
bersama dosen, satu per satu.
• Pada saat demo, mahasiswa perlu menunjukkan aplikasi yang berjalan sekaligus
source code-nya, kemudian menjelaskan workflow yang dibuat dan menjawab
pertanyaan terkait implementasinya.
• Dosen juga akan memberikan perubahan kecil pada fitur yang sudah dibuat dan
meminta mahasiswa untuk melakukan perubahan secara langsung pada kode.
Perubahan tidak dimaksudkan sebagai pembuatan fitur baru yang besar, tetapi
untuk melihat apakah mahasiswa memahami kode yang telah mereka buat.
• Mahasiswa akan diminta menggunakan AI coding assistant untuk membantu
menyelesaikan perubahan atau permasalahan sederhana pada kode.
• Bentuk pertanyaan atau pengujian akan tetap berada dalam lingkup materi dan
kode yang telah dipelajari/dibuat mahasiswa. Seluruh modul dan video
pembelajaran sudah diupload pada Ms.Teams.

| Hari/Tanggal | Jumat, 9 Oktober 2026 |
| --- | --- |
| Kegiatan | Demo Tugas + Code Review |
| Kelas A | 09.00–13.00 WIB |
| Kelas B | 13.00–17.00 WIB |

---

## 📄 Halaman / Slide 3

4. Ketentuan Tambahan
• Apabila terdapat ujian terjadwal yang waktunya bersamaan dengan sesi demo,
ikuti ujian terlebih dahulu. Demo tugas dan code review dapat dilakukan
sebelum atau setelah ujian, dengan menyesuaikan waktu yang tersedia pada sesi
pertemuan tersebut.
• Yang dinilai bukan banyaknya fitur atau banyaknya screen, tetapi apakah
mahasiswa mampu membangun dan memahami satu workflow secara utuh dari
sisi event, state, validation, feedback, hingga navigation/result.
• Apabila ada yang tidak jelas, silahkan tanyakan kepada saya melalui Ms.Teams

---
