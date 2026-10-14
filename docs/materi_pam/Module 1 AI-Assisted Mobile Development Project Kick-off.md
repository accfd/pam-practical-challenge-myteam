# 📘 Modul 1: Pengembangan Aplikasi Mobile dengan Bantuan AI & Project Kick-off

> **Mata Kuliah:** Pengembangan Aplikasi Mobile (Semester 5)  
> **Institusi:** Universitas Andalas  
> **Fokus Utama:** Pengenalan ekosistem mobile, tren terkini, mental model kolaborasi Developer + AI, aturan penggunaan Generative AI, dan persiapan proyek tim.

---

## 🎯 Tujuan Pembelajaran
Setelah mempelajari modul ini, mahasiswa diharapkan mampu:
1. **Menjelaskan Platform Mobile & Evolusinya:** Memahami karakteristik unik perangkat mobile dibandingkan desktop/web.
2. **Memahami Konsep AI-Assisted Development:** Menjelaskan bagaimana kecerdasan buatan membantu alur kerja rekayasa perangkat lunak mobile.
3. **Mengidentifikasi Manfaat & Batasan GenAI:** Mengetahui kapan AI boleh digunakan dan kapan keputusan teknis wajib diambil oleh mahasiswa.
4. **Membentuk Tim & Repositori Proyek:** Menyiapkan repositori Git untuk kolaborasi tim dalam satu semester.

---

## 📑 Agenda Perkuliahan
1. Pengantar Pengembangan Mobile Berbantuan AI (*AI-Assisted Mobile Development*)
2. Konsep *Vibe Coding* & Mental Model Developer Modern
3. Siklus Hidup Pengembangan Perangkat Lunak (SDLC) & Integrasi AI
4. Tren & Evolusi Teknologi Aplikasi Mobile
5. *Project Kick-off* & Pembagian Peran Tim

---

## 💡 Kutipan Pengantar
> *"Programming is learned by writing programs."*  
> — **Brian Kernighan**  
*(Kemampuan pemrograman sejati diasah melalui praktik langsung menulis kode, bukan sekadar menyalin solusi).*

---

## 📱 1. Karakteristik Unik Aplikasi Mobile
Apa yang membedakan aplikasi mobile dengan aplikasi web atau desktop pada laptop?
* **Input Berbasis Sentuhan & Gestur:** Tidak mengandalkan mouse/keyboard fisik, melainkan *tap*, *swipe*, *pinch*, dan *long press*.
* **Keterbatasan Sumber Daya Hardware:** Memori (RAM), masa pakai baterai, dan daya pemrosesan lebih terbatas.
* **Konektivitas Dinamis:** Jaringan seluler sering kali tidak stabil, berpindah antara Wi-Fi dan 4G/5G, atau bahkan masuk mode *offline*.
* **Siklus Hidup Aplikasi (*Lifecycle*):** Aplikasi dapat sewaktu-waktu dijeda (*paused*), berjalan di latar belakang (*background*), atau dihentikan oleh sistem operasi untuk menghemat RAM.
* **Integrasi Sensor Fisik:** GPS, kamera, akselerometer, sensor biometrik (sidik jari/wajah), dan notifikasi *push*.

---

## 🤖 2. Konsep AI-Assisted Development (Pengembangan Berbantuan AI)

### Definisi Dasar
Pengembangan perangkat lunak berbantuan AI adalah pendekatan di mana pengembang (*developer*) memanfaatkan asisten kecerdasan buatan untuk mempercepat dan meningkatkan kualitas berbagai aktivitas rekayasa perangkat lunak.

### Prinsip Utama: *"AI Generates, Developer Decides"*
* **AI Bertugas Merekomendasikan:** AI menghasilkan draf kode, alternatif logika, penjelasan konsep, atau saran perbaikan bug.
* **Developer Memegang Kendali:** Pengembang tetap menjadi penanggung jawab penuh atas arsitektur, kebenaran fungsional, performa, dan keamanan kode.

```text
┌─────────────────────────────────────────────────────────────┐
│                       ALUR KOLABORASI                       │
├─────────────────────────────────────────────────────────────┤
│  INPUT DARI DEVELOPER:                                      │
│  - Kebutuhan Pengguna (User Requirements)                   │
│  - Desain & Spesifikasi Teknis                              │
│  - Konteks Kode & Catatan Masalah / Error                   │
│                              ▼                              │
│  PROSES OLEH AI ASSISTANT:                                  │
│  - Memberikan rekomendasi & kode rancangan                  │
│  - Menjelaskan alternatif algoritma                         │
│  - Mengidentifikasi potensi celah / bug                     │
│                              ▼                              │
│  KONTROL KUALITAS OLEH DEVELOPER:                           │
│  - Review (Telaah)  ->  Validate (Validasi Kebenaran)       │
│  - Modify (Modifikasi) -> Test (Uji Coba Fungsional)        │
│  - Integrate (Integrasikan ke dalam Proyek)                 │
└─────────────────────────────────────────────────────────────┘
```

---

## 💬 3. Studi Kasus: "Jika AI Bisa Coding, Mengapa Developer Masih Dibutuhkan?"

**Skenario:**
Seorang mahasiswa meminta AI: *"Buatkan aplikasi mobile pemesanan makanan lengkap dengan login, database, sistem pembayaran, dan notifikasi."*  
AI menghasilkan kode lengkap dan aplikasi dapat dijalankan. Namun, saat dievaluasi:
1. Tidak semua kebutuhan spesifik pengguna terpenuhi.
2. Mahasiswa tidak memahami alur kerja kode yang dihasilkan.
3. Terdapat celah keamanan (*security vulnerabilities*).
4. Fitur mengalami crash saat diuji dalam kondisi jaringan lambat atau input tak terduga (*edge cases*).

**Pelajaran Kunci:**
* Aplikasi tidak bisa dikatakan sukses hanya karena "bisa di-*run*".
* Tanggung jawab atas kegagalan sistem berada di tangan **pengembang**, bukan AI.
* Keahlian inti developer di era AI bergeser dari sekadar mengetik sintaks menjadi: **pemahaman arsitektur, pemecahan masalah, validasi logika, analisis keamanan, dan pemahaman kebutuhan pengguna.**

---

## ⚡ 4. Mengenal "Vibe Coding" & Mental Model AI

### Apa itu *Vibe Coding*?
*Vibe Coding* adalah istilah ketika pengembang menggunakan bahasa alami (*natural language*) untuk menginstruksikan AI agar membuat, memodifikasi, atau memvalidasi kode.

### Mental Model yang Tepat
* AI adalah **Asisten / Co-Pilot**, bukan "programmer pengganti".
* Jangan memperlakukan AI seperti pesulap. Berikan konteks, instruksi spesifik, dan batasan arsitektur yang jelas.

### Ekosistem Perangkat Kerja (Tools):
1. **IDE:** VS Code, Android Studio, Google Antigravity IDE.
2. **AI Coding Assistant:** GitHub Copilot, Gemini Code Assist, ChatGPT, Claude.
3. **Version Control:** Git & GitHub untuk melacak setiap perubahan secara disiplin.

---

## ⚖️ 5. Aturan & Batasan Penggunaan AI di Kelas

Untuk memastikan mahasiswa benar-benar menguasai ilmu pemrograman mobile, berikut batasan penggunaan AI:

| ✅ Diperbolehkan & Dianjurkan | ❌ Dilarang Keras |
|---|---|
| Brainstorming ide fitur & skenario kasus | Pengganti pemahaman konsep pribadi |
| Eksplorasi alternatif solusi & arsitektur | Sumber kebenaran mutlak tanpa verifikasi |
| Meminta penjelasan atas kode/error yang rumit | Memasukkan kode yang tidak dipahami ke proyek |
| Membantu proses *debugging* & mencari akar masalah | Cara instan menghindari tahap analisis & perancangan |
| Refactoring untuk kerapian kode | Menyalin solusi tugas secara membabi buta |
| Pembuatan data *mocking* dan *test case* | Mengabaikan pengujian mandiri |

---

## ❓ 6. Prinsip 5 Pertanyaan Emas (*The 5-Question Principle*)

Sebelum Anda menyetujui (*accept*) atau memasukkan kode buatan AI ke dalam proyek, Anda **wajib** mampu menjawab 5 pertanyaan ini:
1. **Apa yang dilakukan kode ini?** (*What does this code do?*)
2. **Mengapa menggunakan pendekatan ini?** (*Why use this approach?*)
3. **Bagaimana cara kerja teknisnya di balik layar?** (*How does this code work?*)
4. **Apa risiko atau efek sampingnya?** (*What are the risks / edge cases?*)
5. **Bagaimana cara menguji bahwa kode ini benar?** (*How do I test that this code is correct?*)

---

## 🏗️ 7. Fondasi Rekayasa Perangkat Lunak Mobile

### Ekosistem Platform Mobile
* **Android:** Bahasa resmi Kotlin/Java, IDE Android Studio.
* **iOS:** Bahasa resmi Swift/Objective-C, IDE Xcode.
* **Cross-Platform (Multiplatform):** Flutter (bahasa Dart), React Native (JavaScript/TypeScript). Menghemat waktu karena 1 basis kode dapat berjalan di Android & iOS.

### Aspek Krusial Aplikasi Mobile:
1. **UI & UX:** Antarmuka harus intuitif, responsif terhadap berbagai ukuran layar, dan mengikuti pedoman *Material Design* (Android) atau *Human Interface Guidelines* (iOS).
2. **Konektivitas API:** Komunikasi data dengan RESTful API atau GraphQL menggunakan JSON.
3. **Pengujian (*Testing*):** Pengujian unit, widget/komponen, dan pengujian integrasi alur kerja (*end-to-end*).
4. **Distribusi & Pemeliharaan:** Persiapan rilis di Google Play Store / Apple App Store dan pembaruan rutin.

---

## 🔄 8. Siklus Hidup Pengembangan (SDLC) & Tren Masa Depan

### Tahapan Standar SDLC:
`Perencanaan (Planning)` ➔ `Analisis Kebutuhan` ➔ `Perancangan Desain` ➔ `Pengembangan (Coding)` ➔ `Pengujian (Testing)` ➔ `Penyebaran (Deployment)` ➔ `Pemeliharaan (Maintenance)`.

### Model SDLC Populer:
* **Waterfall:** Linier dan berurutan; cocok jika kebutuhan sudah sangat pasti.
* **Agile / Scrum:** Iteratif dan adaptif; paling banyak digunakan dalam pengembangan mobile modern.
* **RAD (Rapid Application Development):** Fokus pada pembuatan prototipe cepat.

### Tren Mobile Terkini:
* **AI & Machine Learning On-Device:** Pemrosesan AI lokal pada smartphone.
* **Cross-Platform Frameworks:** Dominasi Flutter untuk efisiensi tim.
* **Keamanan Data & Privasi:** Perlindungan ketat pada data sensitif pengguna.
* **Dompet Digital & Pembayaran Terintegrasi (QRIS, Payment Gateway).**

---

## 🏁 Rangkuman Inti Modul 1
* Pengembangan aplikasi mobile membutuhkan pemahaman mendalam tentang siklus hidup perangkat, responsivitas antarmuka, dan manajemen memori.
* AI bertindak sebagai akselerator produktivitas, namun **kemampuan berpikir kritis, perancangan arsitektur, dan pemahaman logika kode tetap menjadi tanggung jawab mutlak mahasiswa.**
