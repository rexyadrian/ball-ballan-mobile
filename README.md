# Ball-Ballan Mobile

Proyek Flutter sederhana yang dikembangkan oleh Rexy Adrian Fernando 2406495666 sebagai pemenuhan tugas mata kuliah Pemrograman Berbasis Platform (PBP).

---

# Tugas 7

## Widget Tree pada Flutter dan Bagaimana Hubungan parent-child (induk-anak) Bekerja Antar-widget

Hampir semua elemen yang membentuk UI (teks, tombol, layout, container, dan lain-lain) di flutter diwakili oleh _widget_.

### Widget tree pada flutter

_Widget tree_ adalah representasi logika bagaimana widget-widget pada flutter disusun satu sama lain, mengatur _rendering_, serta _hit testing (touch interaction)_. Tiap _node_ pada _tree_ adalah _widget_, dan hubungan antar-_node_ mencerminkan siapa _parent_ (induk) dan siapa _child_ (anak).

### Hubungan _parent-child_ (induk-anak) antar-_widget_

- Mengatur _Nest_ (penanaman) widget dalam ```build()```

  Widget _parent_ mengatur widget-widget anaknya. 

- Parent mengatur _constraints_ atau layout _child_
  
  _Parent widget_ memberi batasan (_constraints_) pada anaknya, misalnya ukuran maksimum/minimum, posisi, alignment. _Child_ kemudian menyesuaikan dirinya sesuai aturan tersebut. Sebagai contoh, ```Row``` dan ```Column``` mengatur bagaimana _child_-nya dibagi ruang letaknya.

  Misal dalam kode:
  
  ```dart
  @override
  Widget build(BuildContext context) {
    return Card(
      // Membuat kotak kartu dengan bayangan dibawahnya.
      elevation: 2.0,
      child: Container(
        // Mengatur ukuran dan jarak di dalam kartu.
        width: MediaQuery.of(context).size.width / 3.5, // menyesuaikan dengan lebar device yang digunakan.
        padding: const EdgeInsets.all(16.0),
        // Menyusun title dan content secara vertikal.
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(content),
          ],
        ),
      ),
    );
  }
  ```

  - ```Card``` adalah _parent_ dari ```Container```, berfungsi membungkus semua elemen ```Ccntainer```.
  - ```Container``` adalah _parent_ dari ```Column```, berfungsi mengatur lebar (_width_) dan _padding_ untuk kartu yang akan disusun untuk ```Container```.
  - ```Column``` adalah _parent_ dari ```Text(title)```, ```SizedBox```, ```Text(content)```, berfungsi mengatur _widget_ untuk masing-masing _card_.

## Semua Widget yang Digunakan Dalam Proyek

### Scaffold

- ```Scaffold``` digunakan sebagai layout dasar pada flutter yang digunakan untuk menyediakan struktur _Material Design_ seperti ```AppBar```, ```body```, dan lainnya.

### AppBar (child dari Scaffold)

- ```AppBar``` digunakan untuk menampilkan judul aplikasi dan berfungsi seperti navigation bar pada web.

### Body (child dari Scaffold)

- ```Body``` adalah bagian utama yang mengatur konten utama pada aplikasi.

### Widget tampilan UI, layout, dan utilitas

- ```Text```: menampilkan teks.

- ```Container``` digunakan sebagai pembungkus layout dan styling pada ```InfoCard``` dan ```ItemCard```

- ```Padding```: memberi jarak pada konten.

- ```Column```: mengatur susunan widget secara vertikal.

- ```Row```: mengatur susunan widget secara horizontal.

- ```MediaQuery```: mengatur ukuran widget agar bersifat responsif menyesuaikan device dengan ukuran yang berbeda-beda.

- ```SizedBox```: memberi jarak vertikal antarelemen, misalnya antara teks dan konten.

- ```Center```: menempatkan _child_-nya di posisi tengah.

- ```GridView```: menyusun Item dalam tampilan _grid_.

- ```InkWell```: memberi efek klik dan aksi ```onTap()``` saat ditekan.

- ```ScaffoldMessenger```: menampilkan ```SnackBar``` (pesan _pop-up_ sementara) ketika ```Card``` ditekan.

- ```SnackBar```: pesan _pop-up_ sementara yang muncul di layar.

- ```Colors```: memberi warna pada widget (contohnya ```Colors.blue```, ```Colors.white```, ```item.color```).

- ```EdgeInsets```: mengatur _padding_ atau _margin_ dari berbagai _widget_.

- ```Icon```: menampilkan berbagai jenis _icon_.

### InfoCard

- ```InfoCard``` adalah kelas yang digunakan untuk membungkus ```Card```

### Card

- ```Card``` digunakan untuk memberikan tampilan kartu _widget_ yang digunakan di ```InfoCard```

### ItemCard

- ```ItemCard``` digunakan untuk menampilkan ikon + teks dalam _card_, mengatur akses ```SnackBar```, serta mengatur _hit testing_ (ketika widget ditekan) pada ```Card```

## Apa fungsi dari widget ```MaterialApp```? Mengapa widget ini sering digunakan sebagai widget root?

### Fungsi widget ```MaterialApp```

```MaterialApp``` berfungsi sebagai wadah (_container_ utama) yang menyiapkan:

- Struktur dasar aplikasi _Material Design_

  Menyediakan _widget_ dasar untuk aplikasi

- Navigasi antar halaman (routing)
  
  Otomatis meneydiakan ```Navigator``` dan ```Route``` di belakang layar

- Tema dan Tampilan Global (warna, font, ikon, dan lain-lain)

- Mengatur Bahasa dan Aksesibilitas Global
  
  ```MaterialApp``` mendukung sistem ```Localizations``` untuk _multi-language_, serta fitur _accessibility_ seperti _directionality_ (LTR/RTL).

### Mengapa sering digunakan sebagai widget root?

Karena ```MaterialApp``` sudah mengatur banyak hal (tema, _routing_, navigasi, _widget_ dasar, dan lain-lain), menempatkannya di root membuat kode aplikasi lebih terstruktur dan mudah dikembangkan.

## Perbedaan ```StatelessWidget``` dan ```StatefulWidget```

### ```StatelessWidget```

Widget yang tidak memiliki _state mutable_ (_stateless_) internal, tampilannya tidak berubah berdasarkan _widget_ itu sendiri melainkan bergantung dari parameter konstruktor. Contoh penggunaan widget ini adalah untuk menampilkan data statis atau data yang tidak akan berubah.

### ```StatefulWidget```

Widget yang mempunyai _state mutable (stateful)_, yaitu terdapat objek _State_ yang dapat berubah selama lifecycle widget dan memicu rebuild ketika state berubah. Widget ini digunakan ketika UI harus merespon input pengguna, data yang berubah, atau kondisi yang menyimpan _state_. Contoh pengunaannya ketika elemen bersifat dinamis: form input, counter, animasi, checkbox, slider.

## ```BuildContext``` pada Flutter

```BuildContext``` adalah objek yang merepresentasikan lokasi sebuah _widget_ di dalam _widget tree_ Flutter. Dengan kata lain, ```BuildContext``` adalah “alamat” sebuah _widget_ dalam struktur UI aplikasi.

### Penggunaan ```BuildContext``` pada metode ```build```

```BuildContext``` memungkinkan _widget_ untuk membangun (_build_) tampilan _widget_ dengan benar. Flutter memanggil method ```build(BuildContext context)``` dan memberi konteks posisi _widget_ tersebut dalam _widget tree_. 

## Penggunaan "hot reload" pada flutter

_Hot Reload_ adalah fitur Flutter yang memungkinkan perubahan kode langsung ke aplikasi yang sedang berjalan, tanpa kehilangan keadaan (_state_) aplikasi.

Ketika tombol “r” ditekan pada terminal, atau klik “Hot Reload” di IDE (VS Code/Android Studio),

Flutter akan:

- Mengompilasi ulang hanya file Dart yang diubah.

- Menyuntikkan (_inject_) perubahan kode ke dalam Dart Virtual Machine (VM) yang sedang berjalan.

- Menjalankan ulang fungsi ```build()``` dari widget yang terpengaruh.

- UI langsung diperbarui tanpa menghapus state saat ini.

### Apa perbedaannya dengan "hot restart"

_Hot Restart_ akan memulai ulang aplikasi dari awal (_reset state_), tetapi tanpa melakukan full _rebuild_ seperti menjalankan ulang aplikasi secara penuh. Proses ini lebih lambat dari "hot reload".

Flutter akan:

- Menghapus semua objek yang ada di memory (_state_),

- Memanggil kembali fungsi ```main()``` dan membangun ulang seluruh _widget tree_ dari awal.

---

# Tugas 8

## Perbedaan antara ```Navigator.push()``` dan ```Navigator.pushReplacement()``` pada Flutter

```Navigator``` di flutter digunakan untuk mengatur rute atau halaman dalam suatu aplikasi.

### Navigator.push()

```Navigator.push()``` digunakan untuk menambahkan halaman baru ke atas _stack_ navigasi. Hal ini menyebabkan navigasi tetap menyimpan halaman sebelumnya dengan ```Navigator.pop()``` atau tombol back. Navigator ini cocok digunakan ketika pengguna ingin kembali ke halaman utama atau tidak ingin langsung keluar aplikasi.

### Navigator.pushReplacement()

```Navigator.pushReplacement()``` digunakan untuk mengganti (_replace_) halaman saat ini dengan halaman baru. Halaman lama akan dihapus dari _stack_ sehingga pengguna tidak bisa kembali ke halaman sebelumnya menggunakan back button. Navigator ini cocok digunakan ketika halaman sebelumnya tidak lagi relevan untuk halaman sekarang seperti login ke home, atau splash screen ke main screen.

## Pemanfaatkan Hierarchy Widget: Scaffold, AppBar, dan Drawer Sebagai Struktur Halaman yang Konsisten pada Aplikasi

- ```Scaffold``` adalah widget utama yang digunakan sebagai layout dasar dari suatu halaman. Dalam hal ini, ```Scaffold``` digunakan untuk membungkus ```AppBar``` dan ```Drawer```.
  
- ```AppBar``` berfungsi seperti "navigation bar", yaitu menyediakan fitur-fitur pada aplikasi. Dalam hal ini, saya menggunakan ```AppBar``` untuk menampilkan judul aplikasi. Karena ```AppBar``` diletakkan di dalam ```Scaffold```, saya bisa membuat custom AppBar agar semua halaman punya tampilan header yang konsisten.

- ```Drawer``` digunakan untuk menyediakan menu navigasi samping yang muncul dari kiri layar. Sangat berguna jika aplikasi punya banyak halaman yang bisa diakses dari mana saja.

## Kelebihan Penggunaan Layout Widget seperti Padding, SingleChildScrollView, dan ListView saat Menampilkan Elemen-Elemen Form

- ```Padding``` digunakan untuk menambahkan ruang di sekitar widget sehingga form tidak terlalu rapat dan lebih nyaman dibaca.

  Kelebihan:

  - Mencegah elemen form saling menempel.

  - Mudah diatur secara konsisten di seluruh form.

- ```SingleChildScrollView``` memungkinkan konten bisa digulir (scrollable) ketika layar tidak cukup untuk menampilkan semua elemen form.

  Kelebihan:

  - Form tetap bisa diakses penuh di layar kecil atau saat keyboard muncul.

  - Mengurangi error overflow (RenderFlex overflowed) yang sering muncul saat keyboard muncul.

  - Mudah membungkus satu kolom form panjang.
 
- ```ListView``` berfungsi seperti ```Column```, tetapi _scrollable_ secara default, dan bisa lebih efisien untuk form yang panjang karena mendukung _lazy loading_ (hanya widget yang terlihat di layar yang dirender).

  Kelebihan:

  - Tidak perlu membungkus ```Column``` dengan ```SingleChildScrollView```.

  - Bisa menambahkan banyak elemen form tanpa khawatir _overflow_.

  - Mudah menambahkan separator atau divider antarelemen.

## Penyesuaian Warna Tema yang Dilakukan Agar Aplikasi Memiliki Identitas Visual yang Konsisten dengan Brand Toko

Dalam menyesuaikan warna tema aplikasi "Ball-Ballan" agar sejalan dengan identitas visual brand, saya menetapkan tema warna yang mencerminkan identitas toko. Dalam hal ini,saya menggunakan warna biru dengan _shade_ 900 sebagai warna utama dan biru dengan _shade_ 400 sebagai aksen. Kemudian, warna-warna ini diterapkan secara konsisten di seluruh komponen aplikasi melalui ```ThemeData``` pada ```MaterialApp```, termasuk ```AppBar```, tombol, dan latar belakang. Pendekatan ini memastikan setiap halaman memiliki tampilan yang seragam dan mudah dikenali sebagai bagian dari brand "Ball-Ballan".

---

# Tugas 9

## Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan ```Map<String, dynamic>``` tanpa model (terkait validasi tipe, null-safety, maintainability)?

### Alasan kita perlu membuat model Dart saat mengambil/mengirim data JSON

- **Tipe aman (type-safe)**
  
  Dart akan memeriksa tipe data pada saat compile. Misal **user_id** harus int, kalau data dari JSON ternyata String, maka kita bisa mengetahuinya dan mengatasi eror dengan lebih mudah.

- **_Null-safety_ lebih mudah diterapkan**

  Kita bisa tandai properti sebagai required atau nullable String?, sehingga lebih aman terhadap null.

- **Maintainability & readability**

  Code lebih jelas, misalnya ```product.name``` jauh lebih readable daripada ```json['name']```. Hal ini juga mempermudah menambahkan validasi atau logika tambahan di model (misal validasi harga > 0).

- **Konversi pada satu tempat**

  Semua logika parsing JSON ada di satu class (fromJson & toJson), sehingga memudahkan _debugging_.

### konsekuensinya jika langsung memetakan ```Map<String, dynamic>``` tanpa model

- **Tidak ada tipe pengecekan compile-time**

  ```json['price']``` bisa saja null atau tipe yang salah, baru ketahuan saat runtime → rentan crash.

- **Null-safety lebih sulit diterapkan**

  Kita harus selalu pakai ```json['name'] ?? ''``` atau ```as String?```.

- **Kurang readable & maintainable**

  Kalau JSON kompleks (nested object, list), code akan penuh ```json['key']['subkey'][i]```. Hal ini juga memengaruhi proses _debugging_.

- **Sulit menambahkan validasi atau logika tambahan**

  Misal ingin cek price > 0, harus selalu ingat tiap kali akses Map, sedangkan jika kita menggunakan model, logika bisa di-handle di constructor.

- **Refactoring sulit**

  Kalau key JSON berubah, misal (price menjadi cost), semua akses Map harus dicari dan diganti manual, sedangkan model cukup update di ```fromJson```.

## Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

### Fungsi package http dan CookieRequest

- Package ```http``` adalah package standar di Flutter/Dart untuk melakukan HTTP request (GET, POST, PUT, DELETE) ke server. Fungsinya yaitu mengirim request dan menerima response, biasanya berupa JSON.

- Package ```CookieRequest``` berfungsi mengelola cookie secara otomatis, termasuk session login Django. Karena itu, package inicocok untuk aplikasi yang memerlukan autentikasi berbasis session cookie. Package ini juga digunakan untuk mengintegrasikan authentication pada Django dan Flutter.

### Perbedaan http dan CookieRequest

- Tipe request http berupa stateless (GET/POST/PUT/DELETE), sedangkan CookieRequest berupa stateful (cookie.session).
  
- Use case: http digunakan untuk mengambil data publik (JSON), CookieRequest digunakan untuk endpoint login, profile, aksi yang butuh login

## Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

Instance ```CookieRequest``` perlu dibagikan ke semua komponen di aplikasi Flutter karena menyimpan session/cookie login, misal saat login ke backend Django, server mengirim cookie (misal sessionid). Kemudian ```CookieRequest``` menyimpan cookie ini di memori agar request selanjutnya bisa diautentikasi. Hal ini membuat semua reqyest ke server yang memerlukan autentikasi dapat langsung menggunakan cookie login yang sama, yang sebelumnya disimpan. Dari sisi user, hal ini tentu sangat mempermudah dalam menggunakan aplikasi karena tidak perlu login untuk tiap screen.

## Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

### Mengapa kita perlu menambahkan ```10.0.2.2``` pada ALLOWED_HOSTS?

Hal ini karena Django secara default hanya menerima request dari host yang tercantum di ```ALLOWED_HOSTS```. Saat menjalankan Flutter di emulator Android, IP ```10.0.2.2``` digunakan untuk merujuk ke localhost komputer developer. Oleh karena itu, kita perlu menambahkan ```10.0.2.2``` ke ```ALLOWED_HOSTS``` agar request dari emulator dapat diterima. Jika tidak ditambahkan, Django akan menolak request dengan "DisallowedHost".

### Mengapa kita perlu mengaktifkan CORS dan pengaturan SameSite/cookie?

- Flutter biasanya mengirim request ke server Django yang berada di domain atau port berbeda. Browser atau emulator menolak request lintas domain tanpa izin. Dengan mengaktifkan CORS di Django, kita memberi izin agar aplikasi Flutter dapat melakukan request ke server. Tanpa pengaturan CORS, request akan diblokir dengan error “CORS policy”.

- Jika backend menggunakan session-based authentication, cookie harus dikirim dengan pengaturan yang benar agar browser atau Flutter dapat menyimpannya dan mengirimnya kembali pada request berikutnya. Pengaturan SameSite=None dan Secure=True diperlukan agar cookie dapat dikirim lintas domain. Tanpa pengaturan ini, session login tidak akan berfungsi, dan pengguna tidak dapat mengakses endpoint yang membutuhkan autentikasi.

### Mengapa kita perlu menambahkan izin akses internet di Android?

Flutter di Android memerlukan izin eksplisit untuk mengakses internet. Hal ini diatur di file ```AndroidManifest.xml```. Jika izin ini tidak diberikan, aplikasi tidak dapat melakukan request HTTP apapun, sehingga komunikasi dengan Django tidak akan berhasil.

### Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Jika salah satu konfigurasi tersebut tidak dilakukan dengan benar, berbagai masalah dapat muncul: request ditolak oleh Django (DisallowedHost), diblokir karena CORS, cookie tidak dikirim atau diterima sehingga session login gagal, atau aplikasi Flutter tidak bisa mengakses internet sama sekali. Semua masalah ini akan membuat integrasi Flutter-Django tidak berjalan sebagaimana mestinya.

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

1. Input di Flutter
   
  Pengguna mengisi form atau melakukan aksi yang menghasilkan data. Data ini ditangkap oleh state di Flutter, bisa menggunakan state management seperti ```Provider```.

2. Pengiriman data ke backend
   
  Setelah data didapat, Flutter mengirimkannya ke server Django melalui HTTP request (POST). Data dikirim dalam format JSON agar mudah diproses di backend.

3. Proses di backend dengan Django

  Server menerima request, memvalidasi data, dan menyimpannya di database. Django dapat melakukan pengecekan tipe data, validasi field, dan pengolahan lain seperti konversi atau perhitungan sebelum menyimpannya. Setelah berhasil, server mengirim response berupa JSON yang berisi data terbaru atau status berhasil/gagal.

4. Penerimaan data di Flutter

  Flutter menerima response JSON dari backend, lalu mem-parsing-nya menjadi model Dart menggunakan factory method fromJson(). Dengan cara ini, data memiliki tipe aman (type-safe) dan null-safety, sehingga mudah digunakan di UI.

5. Menampilkan di UI Flutter

  Data yang sudah menjadi model Dart kemudian di-bind ke widget, misalnya menampilkan daftar produk dengan ListView.builder. Setiap perubahan data dari server dapat memicu rebuild widget untuk menampilkan informasi terbaru secara realtime atau saat refresh.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

### Register

- Pengguna mengisi form register di Flutter, seperti username, password, dan konfirmasi password.

- Data dikumpulkan menggunakan controller atau state management, lalu dikirim ke backend melalui HTTP POST request dalam format JSON.
  
- Django menerima request, melakukan validasi data (misal memeriksa username, panjang password, dan tipe data), kemudian menyimpan akun baru ke database.

- Setelah berhasil, server mengirimkan response berupa status sukses atau pesan error, yang diterima Flutter, untuk ditampilkan ke notifikasi pengguna.

### Login

- Pengguna mengisi username dan password pada form login Flutter.

- Flutter mengirimkan request POST ke endpoint login Django.
  
- Django akan memverifikasi kredensial, dan jika valid, mengembalikan cookie session (sessionid) yang menandakan pengguna telah login (session-based authentication).

- Di Flutter, cookie ini ditangani oleh instance ```CookieRequest``` sehingga sesi login pengguna tersimpan dan dapat digunakan untuk request berikutnya.

- Flutter kemudian menavigasi pengguna ke halaman utama atau menampilkan menu yang hanya dapat diakses oleh pengguna terautentikasi.

- Setelah login, setiap request ke endpoint yang memerlukan autentikasi akan menyertakan cookie session secara otomatis melalui ```CookieRequest```.

- Backend Django memeriksa session tersebut untuk memastikan request datang dari pengguna yang sah, sehingga data pribadi atau menu khusus pengguna dapat diakses.

### Logout

- Saat pengguna memilih logout, Flutter mengirimkan request POST ke endpoint logout Django.

- Server akan menghapus session yang terkait dengan pengguna dan mengirim response sukses.

- Di Flutter, cookie session juga dihapus dari ```CookieRequest```, sehingga request berikutnya dianggap sebagai pengguna tidak terautentikasi.

- UI kembali menampilkan halaman login atau menu sesuai status pengguna tidak terautentikasi.

## Mengimplementasikan checklist secara step-by-step.

- Pertama, saya memastikan bahwa proyek Django saya berjalan dengan benar dan tidak mempunyai bug., serta dapat diakses pada browser atau postman.

- Membuat ```django-app``` authentication sebagai penghubung authentication pada Flutter.

- Mengimplementasikan fitur registrasi pada Flutter, kemudian mengirimkan data ke endpoint register Django via HTTP POST.

- Membuat halaman login: form login dan kirim kredensial ke Django.

- Simpan session/cookie di CookieRequest agar request berikutnya bisa terdeteksi sebagai authenticated. Semua request ke endpoint yang membutuhkan autentikasi menggunakan instance ini.

- Membuat model Flutter untuk memetakan data JSON yang diterima dari server.

- Membuat halaman daftar Item:

  - Mengambil data dari endpoint JSON menggunakan HTTP request.

  - mem-parse JSON menjadi model Dart (Item.fromJson).

  - Menampilkan di UI dengan ListView.builder atau grid.
 
  - Membuat ```product_detail.dart``` untuk menampilkan seluruh atribut dari model product.

- Menambahkan filter produk untuk pengguna yang login: saat mengambil data item, hanya ambil item yang terkait dengan user yang sedang login. Validasi dilakukan dengan mencocokkan userId pada JSON, kemudian item yang sesuai dimasukkan ke dalam list produk.

---


 
