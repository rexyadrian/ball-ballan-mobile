# Ball-Ballan Mobile

Proyek Flutter sederhana yang dikembangkan oleh Rexy Adrian Fernando 2406495666 sebagai pemenuhan tugas mata kuliah Pemrograman Berbasis Platform (PBP).

---

# Tugas 7

## Widget Tree pada Flutter dan Bagaimana Hubungan parent-child (induk-anak) Bekerja Antar-widget

Hampir semua elemen yang membentuk UI (teks, tombol, layout, container, dan lain-lain) di flutter diwakili oleh _widget_.

### Widget tree pada flutter

_Widget tree_ adalah representasi logika bagaimana widget-widget pada flutter disusun satu sama lain, mengatur _rendering_, serta _hit testing (touch interaction)_. Tiap _node_ pada _tree_ adalah _widget_, dan hubungan antar-_node_ mencerminkan siapa _parent_ (induk) dan siapa _child_ (anak).

### Hubungan _parent-child_ (induk-anak) antar-_widget_

* Mengatur _Nest_ (penanaman) widget dalam ```build()```

  Widget _parent_ mengatur widget-widget anaknya. 

* Parent mengatur _constraints_ atau layout _child_
  
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

  * ```Card``` adalah _parent_ dari ```Container```, berfungsi membungkus semua elemen ```Ccntainer```.
  * ```Container``` adalah _parent_ dari ```Column```, berfungsi mengatur lebar (_width_) dan _padding_ untuk kartu yang akan disusun untuk ```Container```.
  * ```Column``` adalah _parent_ dari ```Text(title)```, ```SizedBox```, ```Text(content)```, berfungsi mengatur _widget_ untuk masing-masing _card_.

## Semua Widget yang Digunakan Dalam Proyek

### Scaffold

* ```Scaffold``` digunakan sebagai layout dasar pada flutter yang digunakan untuk menyediakan struktur _Material Design_ seperti ```AppBar```, ```body```, dan lainnya.

### AppBar (child dari Scaffold)

* ```AppBar``` digunakan untuk menampilkan judul aplikasi dan berfungsi seperti navigation bar pada web.

### Body (child dari Scaffold)

* ```Body``` adalah bagian utama yang mengatur konten utama pada aplikasi.

### Widget tampilan UI, layout, dan utilitas

* ```Text```: menampilkan teks.

* ```Container``` digunakan sebagai pembungkus layout dan styling pada ```InfoCard``` dan ```ItemCard```

* ```Padding```: memberi jarak pada konten.

* ```Column```: mengatur susunan widget secara vertikal.

* ```Row```: mengatur susunan widget secara horizontal.

* ```MediaQuery```: mengatur ukuran widget agar bersifat responsif menyesuaikan device dengan ukuran yang berbeda-beda.

* ```SizedBox```: memberi jarak vertikal antarelemen, misalnya antara teks dan konten.

* ```Center```: menempatkan _child_-nya di posisi tengah.

* ```GridView```: menyusun Item dalam tampilan _grid_.

* ```InkWell```: memberi efek klik dan aksi ```onTap()``` saat ditekan.

* ```ScaffoldMessenger```: menampilkan ```SnackBar``` (pesan _pop-up_ sementara) ketika ```Card``` ditekan.

* ```SnackBar```: pesan _pop-up_ sementara yang muncul di layar.

* ```Colors```: memberi warna pada widget (contohnya ```Colors.blue```, ```Colors.white```, ```item.color```).

* ```EdgeInsets```: mengatur _padding_ atau _margin_ dari berbagai _widget_.

* ```Icon```: menampilkan berbagai jenis _icon_.

### InfoCard

* ```InfoCard``` adalah kelas yang digunakan untuk membungkus ```Card```

### Card

* ```Card``` digunakan untuk memberikan tampilan kartu _widget_ yang digunakan di ```InfoCard```

### ItemCard

* ```ItemCard``` digunakan untuk menampilkan ikon + teks dalam _card_, mengatur akses ```SnackBar```, serta mengatur _hit testing_ (ketika widget ditekan) pada ```Card```

## Apa fungsi dari widget ```MaterialApp```? Mengapa widget ini sering digunakan sebagai widget root?

### Fungsi widget ```MaterialApp```

```MaterialApp``` berfungsi sebagai wadah (_container_ utama) yang menyiapkan:

* Struktur dasar aplikasi _Material Design_

  Menyediakan _widget_ dasar untuk aplikasi

* Navigasi antar halaman (routing)
  
  Otomatis meneydiakan ```Navigator``` dan ```Route``` di belakang layar

* Tema dan Tampilan Global (warna, font, ikon, dan lain-lain)

* Mengatur Bahasa dan Aksesibilitas Global
  
  ```MaterialApp``` mendukung sistem ```Localizations``` untuk _multi-language_, serta fitur _accessibility_ seperti _directionality_ (LTR/RTL).

### Mengapa sering digunakan sebagai widget root?

Karena ```MaterialApp``` sudah mengatur banyak hal (tema, ```routing```, navigasi, _widget_ dasar, dan lain-lain), menempatkannya di root membuat kode aplikasi lebih terstruktur dan mudah dikembangkan.

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

* Mengompilasi ulang hanya file Dart yang diubah.

* Menyuntikkan (_inject_) perubahan kode ke dalam Dart Virtual Machine (VM) yang sedang berjalan.

* Menjalankan ulang fungsi ```build()``` dari widget yang terpengaruh.

* UI langsung diperbarui tanpa menghapus state saat ini.

### Apa perbedaannya dengan "hot restart"

_Hot Restart_ akan memulai ulang aplikasi dari awal (_reset state_), tetapi tanpa melakukan full _rebuild_ seperti menjalankan ulang aplikasi secara penuh. Proses ini lebih lambat dari "hot reload".

Flutter akan:

* Menghapus semua objek yang ada di memory (_state_),

* Memanggil kembali fungsi ```main()``` dan membangun ulang seluruh _widget tree_ dari awal.

---
