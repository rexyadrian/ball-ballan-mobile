# Ball-Ballan Mobile

Proyek Flutter sederhana yang dikembangkan oleh Rexy Adrian Fernando 2406495666 sebagai pemenuhan tugas mata kuliah Pemrograman Berbasis Platform (PBP).

---

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

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
  
  Parent widget memberi batasan (_constraints_) pada anaknya, misalnya ukuran maksimum/minimum, posisi, alignment. _Child_ kemudian menyesuaikan dirinya sesuai aturan tersebut. Sebagai contoh, ```Row``` dan ```Column``` mengatur bagaimana _child_-nya dibagi ruang letaknya.

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

  * ```Card``` adalah parent dari ```Container```, berfungsi membungkus semua elemen ```Ccntainer```.
  * ```Container``` adalah parent dari ```Column```, berfungsi mengatur lebar (_width_) dan _padding_ untuk kartu yang akan disusun untuk ```Container```.
  * ```Column``` adalah parent dari ```Text(title)```, ```SizedBox```, ```Text(content)```, berfungsi mengatur widget untuk masing-masing card.

## Semua Widget yang Digunakan Dalam Proyek

### Scaffold

```Scaffold``` digunakan sebagai layout dasar pada flutter yang digunakan untuk menyediakan struktur Material Design seperti ```AppBar```, ```body```, dan lainnya.

### AppBar (child dari Scaffold)

```AppBar``` digunakan untuk menampilkan judul aplikasi dan berfungsi seperti navigation bar pada web.

### Body (child dari Scaffold)

```Body``` adalah bagian utama yang mengatur konten utama pada aplikasi.

### Widget tampilan UI, layout, dan utilitas

```Text```: menampilkan teks.
```Container``` digunakan sebagai pembungkus layout dan styling pada ```InfoCard``` dan ```ItemCard```
```Padding```: memberi jarak pada konten.
```Column```: mengatur susunan widget secara vertikal.
```Row```: mengatur susunan widget secara horizontal.
```MediaQuery```: mengatur ukuran widget agar bersifat responsif menyesuaikan device dengan ukuran yang berbeda-beda.
```SizedBox```: memberi jarak vertikal antarelemen, misalnya antara teks dan konten.
```Center```: menempatkan child-nya di posisi tengah.
```GridView.count```: menyusun Item dalam tampilan grid.
```InkWell```: memberi efek klik dan aksi ```onTap()``` saat ditekan.
```ScaffoldMessenger```: menampilkan ```SnackBar``` (pesan popup sementara) ketika ```Card``` ditekan.
```SnackBar```: pesan pop-up sementara yang muncul di layar.
```Colors```: memberi warna pada widget (contohnya Colors.blue, Colors.white, item.color).
```EdgeInsets```: mengatur padding atau margin dari berbagai widget.
```Icon```: menampilkan icon.

### InfoCard

```InfoCard``` adalah kelas yang digunakan untuk membungkus ```Card```

### Card

```Card``` digunakan untuk memberikan tampilan kartu widget yang digunakan di ```InfoCard```

### ItemCard

```ItemCard``` digunakan untuk menampilkan ikon + teks dalam card, mengatur akses ```SnackBar```, serta mengatur hit testing (ketika widget ditekan) pada ```Card```

``````
###

``````


## Apa fungsi dari widget ```MaterialApp```? Mengapa widget ini sering digunakan sebagai widget root?

### Fungsi widget ```MaterialApp```

```MaterialApp``` berfungsi sebagai wadah (container utama) yang menyiapkan:

* Struktur dasar aplikasi Material Design

  Menyediakan widget dasar untuk aplikasi

* Navigasi antar halaman (routing)
  
  Otomatis meneydiakan Navigator dan Route di belakang layar

* Tema dan Tampilan Global (warna, font, ikon, dan lain-lain)

* Mengatur Bahasa dan Aksesibilitas Global
  
  ```MaterialApp``` mendukung sistem ```Localizations``` untuk multi-language, serta fitur _accessibility_ seperti _directionality_ (LTR/RTL).

### Mengapa sering digunakan sebagai widget root?

Karena ```MaterialApp``` sudah mengatur banyak hal (tema, routing, navigasi, widget dasar, dan lain-lain), menempatkannya di root membuat kode aplikasi lebih terstruktur dan mudah dikembangkan.

## Perbedaan ```StatelessWidget``` dan ```StatefulWidget```

### ```StatelessWidget```

Widget yang tidak memiliki _state mutable_ (_stateless_) internal, tampilannya tidak berubah berdasarkan widget itu sendiri melainkan bergantung dari parameter konstruktor / parent. Contoh penggunaan widget ini adalah untuk menampilkan data statis atau data yang tidak akan berubah.

### ```StatefulWidget```

Widget yang mempunyai state mutable (_stateful_), yaitu terdapat objek State yang dapat berubah selama lifecycle widget dan memicu rebuild ketika state berubah. Widget ini digunakan ketika UI harus merespon input pengguna, data yang berubah, atau kondisi yang menyimpan _state_. Contoh pengunaannya ketika elemen bersifat dinamis: form input, counter, animasi, checkbox, slider.

## ```BuildContext``` pada Flutter

BuildContext adalah objek yang merepresentasikan lokasi sebuah widget di dalam widget tree Flutter. Dengan kata lain, BuildContext adalah “alamat” sebuah widget dalam struktur UI aplikasi.

### Penggunaan ```BuildContext``` pada metode ```build```

BuildContext memungkinkan widget untuk membangun (build) tampilan widget dengan benar. Flutter memanggil method build(BuildContext context) dan memberi konteks posisi widget tersebut dalam _widget tree_. 

## Penggunaan "hot reload" pada flutter

Hot Reload adalah fitur Flutter yang memungkinkan perubahan kode langsung ke aplikasi yang sedang berjalan, tanpa kehilangan state (keadaan) aplikasi.

Ketika tombol “r” ditekan pada terminal, atau klik “Hot Reload” di IDE (VS Code/Android Studio),

Flutter akan:

* Mengompilasi ulang hanya file Dart yang diubah.

* Menyuntikkan (inject) perubahan kode ke dalam Dart Virtual Machine (VM) yang sedang berjalan.

* Menjalankan ulang fungsi ```build()``` dari widget yang terpengaruh.

* UI langsung diperbarui tanpa menghapus state saat ini.

### Apa perbedaannya dengan "hot restart"

Hot Restart akan memulai ulang aplikasi dari awal (reset state), tetapi tanpa melakukan full rebuild seperti menjalankan ulang aplikasi secara penuh. Proses ini lebih lambat dari "hot reload".

Flutter akan:

* Menghapus semua objek yang ada di memory (_state_),

* Memanggil kembali fungsi ```main()``` dan membangun ulang seluruh widget tree dari awal.

---
