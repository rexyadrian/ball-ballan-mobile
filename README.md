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

* Mengatur Nest (penanaman) widget dalam ```build()```

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

  ```Card``` adalah parent dari ```Container```, berfungsi membungkus semua elemen ```Ccntainer```.
  ```Container``` adalah parent dari ```Column```, berfungsi mengatur lebar (_width_) dan _padding_ untuk kartu yang akan disusun untuk ```Container```.
  ```Column``` adalah parent dari ```Text(title)```, ```SizedBox```, ```Text(content)```, berfungsi mengatur widget untuk masing-masing card.

  
---
