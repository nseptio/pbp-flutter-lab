# Tugas 7: Elemen Dasar Flutter

### _Stateless Widget_ dan _Stateful Widget_
Stateless widget adalah widget yang tidak memiliki state/kondisi sehingga sifatnya statis, tidak pernah berubah
dari awal dibuat hingga program dihentikan. Sementara itu, Stateful widget adalah widget yang bersifat dinamis
karena mempunyai state/kondisi tertentu saat program dijalankan.

### Widget yang digunakan
- `MaterialApp`: Aplikasi yang menggunakan desain material
- `Scaffold`: kontainer dasar, yang memiliki beberapa elemen seperti AppBar dan floatingActionButton
- `AppBar`: widget bar yang berada di bagian atas layar
- `Center`: untuk meletakkan widget child berada di bagian tengah parent 
-  `Column`: berguna untuk layout widget secara vertikal
-  `Row`: berguna untuk layout widget secara horizontal
-  `Text`: membuat widget teks
-  `TextStyle`: untuk styling widget `Text`
-  `Container`: wadah untuk menyimpan widget-widget lain, berguna untuk mengatur layout
-  `Icon`: menampilkan icon
-  `FloatingActionButton`: menampilkan tombol melayang yang dapat diisi suatu event

### Fungsi `setState()`
Berguna untuk mengubah nilai data yang dinamis dan akan mem-build ulang objek dari data yang diubah. Fungsi
ini dipanggil saat ada perubahan state dan variabel yang terdampak dalah variabel yang diubah
nilainya dalam fungsi `setState()` tersebut.

### Perbedaan `const` dan `final`
variabel `const` dan `final` merupakan variabel yang sama-sama bersifat immutable (tidak dapat diubah).
Perbedaannya adalah varibel `const` bersifat immutable sejak compile-time dan harus didefinisikan
terlebih dahulu sebelum dicompile. Sementara itu, variabel `final` bersifat immutable saat running-time.

### Implementasi
1. Mengubah judul aplikasi menjadi `Program Counter`
2. membuat fungsi `_decrementCounter()`
3. Membuat variabel `isEven` untuk mengecek `_counter` genap atau ganjil. Setelah itu, membuat variabel `_text`
yang berisi genap/ganjil sesuai nilai `_isEven` serta mengubah warna teks dengan biru jika genap dan merah jika ganjil 
4. Membuat tampilan `FloatingActionButton` dan _logic_ ketika `_counter_` kurang dari nol
5. Mengatur posisi  `FloatingActionButton` dengan memanfaatkan widget `Container`, `Column`, dan `Row`.

# Counter_7

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
