# PROJECT GUIDELINES — STARTER FLUTTER

## 1. Informasi Proyek

Nama Proyek: Starter Flutter Kelompok

Arsitektur: Model-View-ViewModel (MVVM)

Framework: Flutter

Bahasa Pemrograman: Dart

Proyek ini dikembangkan sebagai bagian dari Tugas Proyek Pertemuan 6 tentang Manajemen Konteks dan Alur Kerja Git.

Dokumen ini menjadi pedoman bagi seluruh anggota kelompok dan AI dalam melakukan perubahan kode.

## 2. Struktur Arsitektur MVVM

Proyek Flutter menggunakan struktur:

```text
lib/
├── app/
├── data/
│   ├── models/
│   ├── repositories/
│   └── services/
├── presentation/
│   ├── views/
│   ├── viewmodels/
│   └── widgets/
├── utils/
└── main.dart
```

Setiap folder memiliki tanggung jawab berbeda.

- **app:** Konfigurasi utama aplikasi.
- **models:** Struktur data aplikasi.
- **repositories:** Pengelolaan sumber data.
- **services:** Komunikasi dengan REST API Laravel.
- **views:** Tampilan antarmuka pengguna.
- **viewmodels:** Pengelolaan state dan logika presentasi.
- **widgets:** Komponen antarmuka yang dapat digunakan kembali.
- **utils:** Konstanta dan fungsi pendukung.

Setiap pengembangan wajib mempertahankan pemisahan tanggung jawab tersebut.

## 3. Standar Penulisan Kode

Seluruh anggota kelompok wajib mengikuti ketentuan berikut:

1. Menggunakan penamaan file `snake_case`.
2. Menggunakan penamaan class `PascalCase`.
3. Menggunakan penamaan variabel dan method `camelCase`.
4. Menulis kode yang mudah dibaca dan dipelihara.
5. Tidak mencampurkan logika pengambilan data dengan tampilan.
6. Menambahkan komentar pada bagian kode yang membutuhkan penjelasan.
7. Tidak menghapus fitur yang sudah berjalan tanpa persetujuan kelompok.

## 4. Aturan Penggunaan AI

AI digunakan sebagai alat bantu pengembangan.

Sebelum memberikan perubahan, AI harus:

1. Membaca aturan proyek dalam `AGENTS.md`.
2. Memahami struktur arsitektur MVVM.
3. Menjelaskan rencana perubahan.
4. Menyebutkan file yang akan dimodifikasi.
5. Menghindari perubahan yang tidak diminta.
6. Tidak menghapus file atau dependensi tanpa persetujuan.
7. Tidak mengklaim pengujian berhasil tanpa menjalankan pengujian.

Apabila instruksi pengguna bertentangan dengan aturan proyek, AI harus menjelaskan konflik tersebut dan menawarkan solusi yang aman.

## 5. Strategi Percabangan Git

Proyek menggunakan tiga jenis branch:

| Branch | Fungsi |
|---|---|
| `main` | Menyimpan versi stabil |
| `dev` | Menggabungkan hasil pengembangan |
| `feature/*` | Mengembangkan fitur tertentu |

Contoh nama branch:

```text
feature/update-home-view
feature/product-model
feature/api-service
```

Pengembangan dilakukan pada branch `feature/*`.

Perubahan masuk ke `dev` melalui Pull Request. Perubahan dari `dev` menuju `main` juga harus melalui Pull Request setelah pengujian dan review.

## 6. Aturan Pull Request

Setiap Pull Request wajib:

1. Memiliki judul yang menjelaskan perubahan.
2. Menjelaskan file yang dimodifikasi.
3. Menjelaskan tujuan perubahan.
4. Menyertakan hasil pengujian.
5. Direview oleh anggota kelompok yang berbeda dari pembuat PR.
6. Tidak digabungkan apabila ditemukan error yang belum diselesaikan.

Branch `main` harus dilindungi menggunakan pengaturan GitHub agar perubahan langsung tidak diperbolehkan.

## 7. Pengujian Proyek

Sebelum perubahan digabungkan, jalankan:

```bash
flutter pub get
flutter analyze
flutter test
```

Perubahan hanya boleh dinyatakan lolos pengujian apabila perintah benar-benar berhasil.

Jika pengujian gagal, anggota harus memperbaiki masalah sebelum PR digabungkan.

## 8. Git Safety Net dan Rollback

Git digunakan untuk menyimpan riwayat perubahan dan mengembalikan kondisi aplikasi apabila terjadi kesalahan.

Jika perubahan menyebabkan aplikasi rusak:

1. Identifikasi commit yang menyebabkan masalah.
2. Periksa perubahan menggunakan `git diff` atau `git log`.
3. Gunakan `git revert` untuk membatalkan commit yang sudah dibagikan.
4. Lakukan pengujian ulang.
5. Buat Pull Request untuk memasukkan perbaikan.

Dilarang menggunakan `git push --force` pada branch bersama.

Penggunaan `git reset --hard` hanya diperbolehkan untuk kondisi lokal yang aman setelah memastikan tidak ada perubahan penting yang akan hilang.

## 9. Pengelolaan File

File berikut tidak boleh dimasukkan ke GitHub:

- File `.env` yang berisi konfigurasi sensitif.
- Folder hasil build.
- File sementara.
- File cache.
- File yang berisi token, kata sandi, atau kredensial.

File `.gitignore` harus diperiksa sebelum commit.

## 10. Pengujian Kepatuhan AI

Pengujian AI dilakukan menggunakan Prompt 2 dan Prompt 3 sesuai instruksi modul perkuliahan.

**Prompt 2** digunakan untuk memeriksa apakah AI mengikuti arsitektur, menjelaskan rencana perubahan, dan menyebutkan file yang terdampak.

**Prompt 3** digunakan untuk menguji respons AI terhadap instruksi yang bertentangan dengan aturan proyek.

Hasil pengujian dicatat dalam log audit AI satu halaman yang memuat prompt, respons AI, penilaian kepatuhan, dan bukti screenshot.

## 11. Kesimpulan

Dokumen ini menjadi pedoman pengembangan Flutter agar seluruh anggota kelompok menerapkan arsitektur MVVM secara konsisten.

Penggunaan aturan AI, Git branching, Pull Request, review, dan rollback bertujuan menjaga kualitas kode dan mencegah perubahan yang berisiko terhadap proyek.