
# Dokumentasi Arsitektur Starter Flutter

## 1. Pendahuluan

Starter project Flutter ini dikembangkan sebagai bagian dari
Tugas Proyek Pertemuan 5.

Aplikasi menggunakan arsitektur Model-View-ViewModel (MVVM)
untuk memisahkan tampilan, pengelolaan state, dan akses data.

## 2. Struktur Folder

```text
lib/
├── app/
│   └── app.dart
├── data/
│   ├── models/
│   │   └── user_model.dart
│   ├── repositories/
│   │   └── user_repository.dart
│   └── services/
│       └── api_service.dart
├── presentation/
│   ├── views/
│   │   └── home_view.dart
│   ├── viewmodels/
│   │   └── home_viewmodel.dart
│   └── widgets/
│       └── custom_button.dart
├── utils/
│   └── app_constants.dart
└── main.dart
```

## 3. Penjelasan Arsitektur MVVM

### Model
Model mendefinisikan struktur data aplikasi.
File user_model.dart menjadi contoh model pengguna.

### View
View bertanggung jawab menampilkan antarmuka pengguna.
File home_view.dart menampilkan halaman utama aplikasi.

### ViewModel
ViewModel mengelola state dan menyediakan data untuk View.
HomeViewModel menggunakan ChangeNotifier untuk
memberitahukan perubahan kepada tampilan.

### Repository
Repository menjadi perantara antara ViewModel dan
sumber data. UserRepository saat ini menggunakan
data contoh sebagai kerangka awal.

### Service
Service disiapkan untuk komunikasi HTTP dengan
REST API Laravel. Implementasi HTTP belum dilakukan.

### Utils
Utils menyimpan konstanta dan fungsi pendukung
yang dapat digunakan oleh berbagai lapisan.

## 4. Alur Data Aplikasi

Alur yang direncanakan:

Pengguna
  ↓
View (HomeView)
  ↓
ViewModel (HomeViewModel)
  ↓
Repository (UserRepository)
  ↓
Service (ApiService)
  ↓
REST API Laravel
  ↓
Database

Respons data kembali melalui Repository dan ViewModel
untuk ditampilkan oleh View.

## 5. Contoh Alur End-to-End

Contoh skenario pengambilan daftar pengguna:

1. Pengguna membuka halaman daftar pengguna.
2. View meminta data melalui ViewModel.
3. ViewModel memanggil UserRepository.
4. Repository meminta data melalui ApiService.
5. ApiService mengirim HTTP GET ke /api/users.
6. Laravel memproses permintaan melalui API Controller.
7. Model Laravel mengambil data dari database.
8. Laravel mengembalikan respons JSON.
9. Flutter mengubah JSON menjadi UserModel.
10. ViewModel memperbarui state dan View menampilkan data.

Catatan: Alur ini merupakan rancangan integrasi.
Endpoint dan komunikasi HTTP belum diimplementasikan.

## 6. Cara Menjalankan

Persyaratan:
- Flutter SDK
- Dart SDK
- Visual Studio Code
- Google Chrome

Perintah:

```bash
flutter pub get
flutter run -d chrome
```

## 7. Status Implementasi

- Struktur folder MVVM telah disiapkan.
- Halaman awal Flutter telah dibuat.
- View dan ViewModel telah dihubungkan.
- Model dan Repository contoh telah dibuat.
- Service API masih berupa kerangka.
- Integrasi Laravel belum diimplementasikan.
- Logika bisnis lengkap belum dibuat.

## 8. Kesimpulan

Starter Flutter disusun menggunakan arsitektur MVVM
agar setiap lapisan memiliki tanggung jawab yang jelas.

Struktur ini menjadi dasar pengembangan aplikasi
pada pertemuan selanjutnya.
