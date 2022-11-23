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

# Tugas 8: Flutter Form

### Perbedaan `Navigator.push` dan `Navigator.pushReplacement`
- `Navigator.push`: digunakan untuk menambahkan rute lain ke atas tumpukan screen (stack) saat ini. Halaman baru ditampilkan di atas halaman sebelumnya.
- `Navigator.pushReplacement`: digunakan untuk menambahkan rute baru, tetapi rute yang baru akan menggantikan rute sebelumnya.

### Widget yang digunakan
- `Drawer`: widget yang menyediakan sebuah panel yang dapat dimunculkan dan disembunyikan di samping layar. Digunakan sebagai navigasi
- `Form`: widget untuk menampilkan formulir yang digunakan sebagai input dari user
- `DropdownButton`: widget berupa seperti button yang ketika diklik akan memunculkan beberapa pilihan. Bisa digunakan untuk pilihan input user atau menampilkan menu output
- `TextButton`: widget berupa button yang memiliki tulisan dan dapat diberi event
- `TextFormField`: widget yang dapat menerima input text
- `ListTile`: widget dengan satu baris dengan tinggi tetap yang biasanya berisi beberapa teks serta ikon awal atau akhir.
- `ListView`: widget berupa linear array yang menampung widget dan dapat di-scroll
- `card`: widget kartu dengan desain material panel dengan sudut sedikit membulat dan bayangan ketinggian

### Jenis-jenis event yang ada pada Flutter
- `onPressed`: event yang di-trigger ketika suatu tombol ditekan
- `onChanged`: event yang di-trigger ketika terjadi perubahan pada suatu widget
- `onSaved`: event yang di-trigger ketika sebuah form disimpan

### Cara kerja `Navigator` dalam "mengganti" halaman dari aplikasi Flutter
Widget Navigator di Flutter digunakan untuk mempertahankan tumpukan rute stack dan berperan dalam membantu menavigasikan antar rute. Mengganti halaman dapat menggunakan method `Navigator.push()` untuk menimpa halaman sebelumnya, `Navigator.pushReplacement()` untuk menghapus halaman sebelumnya dan mengganti dengan halaman yang baru, `Navigator.pop()` untuk kembali ke halaman sebelumnya (menghapus halaman sekarang).

### Implementasi Tugas 8
1. Membuat file `drawer.dart` untuk membuat widget Drawer secara terpisah. Drawer berisi tombol navigasi untuk ke halaman counter, form, dan halaman yang menampilkan data budget yang telah di-input melalui form.
2. Membuat file baru `form.dart` untuk membuat formulir untuk input data budget. Formulir tersebut berisi widget input judul, nominal, jenis tipe budget, date picker, dan button untuk submit form. Hasil input tersebut akan dibuat objek budget baru.
3. Menambahkan class untuk _blueprint_ objek budget dengan membuat file baru `budget.dart`. Class Budget berisi attribut budget seperti judul, nominal, jenis, dan date, dan array list untuk menampung semua data budgets.
4. Menambahkan file baru (data.dart) untuk menampilkan data budget yang telah di-input melalui form dan disimpan dalam array list budgets.

# Tugas 9: Integrasi Web Service pada Flutter

### Pengambilan Data JSON
Pengambilan data JSON dapat dilakukan tanpa membuat model terlebih dahulu. Namun, tanpa model, data yang didapat dari JSON menjadi kurang representatif dan sulit diolah dengan baik. Oleh karena itu, sebaiknya membuat model terlebih dahulu untuk mendapatkan data JSON yang lebih baik karena dapat merepresentasikan data dan struktur data apa yang akan diterima saat melakukan pengambilan data JSON agar sesuai dengan _response_ yang diterima.

### Widget yang digunakan
- `FutureBuilder`: widget yang digunakan untuk menampilkan data yang didapat dari pengambilan data JSON
- `Expanded`: widget yang digunakan untuk memperluas widget yang ada di dalamnya
- `Link`: widget yang digunakan untuk membuat hyperlink
- `MouseRegion`: widget yang digunakan untuk mendeteksi pergerakan mouse
- `GestureDetector`: widget yang digunakan untuk mendeteksi gesture
- `Checkbox`: widget yang digunakan untuk membuat checkbox
- `CircularProgressIndicator`: widget yang digunakan untuk menampilkan indikator loading

### Mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter
1. Depedensi `http` Flutter dapat melakukan HTTP request seperti GET
2. Setelah membuat model class, data JSON akan dikonversi menjadi objek sesuai model class
3. Menampilkan data dengan `FutureBuilder`

### Implementasi Tugas 9
1. Melakukan refactor menjadi 3 folder, yaitu `model`, `page`, dan `util`
2. Membuat model class `Mywatchlist.dart` untuk menampung data JSON menggunakan website Quicktype
3. Membuat file `fetchmywatchlist.dart` untuk melakukan fetch data JSON dengan class Future
4. Membuat file `mywatchlist.dart` di folder page untuk menampilkan seluruh judul watchlist di halaman mywatchlist. Setiap judul watchlist ditampilkan dengan widget Card
5. Membuat detail untuk setiap judul di watchlist dengan membuat file `mywatchlistdetail.dart` yang berisi judul, release date, rating, status tonton, review. Jika status belum ditonton, isi review akan berisi link menuju review MyAnimeList.


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
