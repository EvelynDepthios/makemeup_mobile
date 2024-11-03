**Nama        : Evelyn Depthios <br />**
**NPM         : 2306207543 <br />**
**Kelas       : PBP F <br />**

[Tugas 7](#tugas-7)

# Tugas 7
##  Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- **Stateless Widget**: Widget yang tidak memiliki state internal yang dapat berubah.Artinya, setelah widget ini dirender, ia tidak akan berubah selama siklus hidupnya. Contoh umum dari stateless widget adalah `Text`, `Icon`, dan `RaisedButton` sederhana.
- **Stateful Widget**: Widget yang memiliki state internal yang dapat berubah selama siklus hidupnya. State ini memungkinkan widget untuk merespons interaksi pengguna atau perubahan data dengan merender ulang dirinya sendiri. Contoh dari stateful widget adalah `Checkbox`, `Slider`, dan `TextField`.

**Perbedaan Utama**:
- **Stateless Widget**: Tidak berubah setelah dirender; cocok untuk UI statis.
- **Stateful Widget**: Dapat berubah selama siklus hidupnya; cocok untuk UI dinamis yang merespons interaksi pengguna.

Source : https://blog.logrocket.com/difference-between-stateless-stateful-widgets-flutter/, https://www.geeksforgeeks.org/flutter-stateful-vs-stateless-widgets/
 
## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
### 1. **File `main.dart`**
   - **MaterialApp**
     - Fungsi: Membungkus aplikasi dan menyediakan pengaturan tema seperti warna dan routing. Di sini, `MaterialApp` diatur untuk menggunakan tema warna dengan nuansa pink dan putih sesuai tampilan aplikasi "MAKE me UP".
   - **Scaffold**
     - Fungsi: Menyediakan struktur dasar aplikasi yang mencakup AppBar dan Body. `Scaffold` menjadi wadah utama untuk menempatkan elemen-elemen di halaman utama.
   - **AppBar**
     - Fungsi: Menampilkan bar di bagian atas aplikasi dengan judul "MAKE me UP" yang menggunakan warna dan font khusus untuk kesan yang konsisten dengan tema aplikasi.
   - **Column** dan **Row**
     - Fungsi: Menyusun tata letak widget secara vertikal (Column) dan horizontal (Row). `Row` digunakan untuk menampilkan widget `InfoCard` (NPM, Nama, dan Kelas pengguna), sedangkan `Column` menampilkan daftar item dan pesan selamat datang.
   - **GridView**
     - Fungsi: Menyusun tampilan widget `ItemCard` dalam bentuk grid dengan 3 kolom. Ini menampilkan tombol fitur (Lihat Produk, Tambah Produk, Logout) dalam layout grid yang rapi.

### 2. **File `menu.dart`**
   - **InfoCard** (Custom Widget)
     - Fungsi: Menampilkan informasi pengguna seperti NPM, Nama, dan Kelas dalam bentuk kartu. Menggunakan `Card` dengan latar belakang putih dan sedikit bayangan untuk memisahkan konten secara visual.
   - **ItemHomepage** (Model Class)
     - Fungsi: Model data untuk setiap item di halaman utama, menyimpan atribut seperti nama tombol, ikon, dan warna latar belakang. Ini membantu menyusun data tombol secara terstruktur.
   - **ItemCard** (Custom Widget)
     - Fungsi: Menampilkan setiap item dari `ItemHomepage` dalam bentuk kartu dengan warna latar belakang yang ditentukan, ikon, dan teks. Setiap `ItemCard` juga memiliki efek `Snackbar` yang muncul saat ditekan untuk memberi umpan balik pada pengguna.
   - **Material** dan **InkWell**
     - Fungsi: `Material` memberikan tampilan material design pada kartu, sementara `InkWell` memberikan efek tap (ripple) ketika tombol ditekan, menghasilkan efek yang lebih interaktif.
   - **ScaffoldMessenger** dan **Snackbar**
     - Fungsi: Menampilkan pesan sementara di bagian bawah layar untuk setiap tindakan pengguna pada tombol (Lihat Produk, Tambah Produk, Logout).
 
Source : https://docs.flutter.dev/ui

## Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
### Fungsi `setState()`
**`setState()`** adalah metode yang digunakan dalam widget stateful untuk memberitahu framework bahwa ada perubahan pada state internal yang memerlukan pembaruan UI. Saat `setState()` dipanggil, Flutter akan menjalankan ulang metode `build()` dari widget tersebut, sehingga perubahan state yang terjadi akan direfleksikan pada UI.
Fungsi setState() digunakan dalam stateful widget untuk memberitahu framework bahwa ada perubahan pada state internal yang memerlukan pembaruan UI. Ketika setState() dipanggil, Flutter akan menjalankan ulang metode build() dari widget tersebut, sehingga perubahan state tercermin pada UI. 

### Variabel yang Terdampak
Variabel yang dapat terpengaruh oleh `setState()` adalah **variabel yang didefinisikan dalam kelas `State` dari widget stateful** yang kemudian digunakan di dalam metode `build()`. Jika variabel tersebut diperbarui, maka panggilan `setState()` akan memicu pembaruan UI. Variabel ini biasanya mencakup data yang bersifat dinamis, seperti:
   - **Counter** atau angka yang diperbarui secara interaktif
   - **Status Boolean** seperti apakah suatu elemen ditampilkan atau disembunyikan
   - **Daftar item** yang mungkin diperbarui atau dimodifikasi berdasarkan interaksi pengguna
   - **Nilai teks input pengguna** yang dapat berubah berdasarkan input

Sebagai contoh, dalam widget yang menampilkan jumlah klik tombol, variabel yang menyimpan jumlah klik akan diperbarui melalui `setState()` untuk memicu pembaruan UI. Dengan demikian, **hanya variabel-variabel yang dipakai dalam `build()`** yang akan mempengaruhi tampilan UI ketika `setState()` dipanggil.

Source : https://api.flutter.dev/flutter/widgets/State/setState.html, https://docs.flutter.dev/get-started/fundamentals/state-management

## Jelaskan perbedaan antara `const` dengan `final`.
1. **`final`**
   - **Penggunaan**: `final` digunakan untuk mendeklarasikan variabel yang nilainya hanya dapat ditetapkan sekali dan tidak bisa diubah setelahnya.
   - **Waktu Penetapan Nilai**: Nilai variabel `final` dapat ditetapkan saat runtime (saat aplikasi berjalan).
   - **Contoh**:
     ```dart
     final DateTime now = DateTime.now(); // Nilai `now` ditetapkan pada runtime.
     ```
   - **Kegunaan**: Cocok untuk nilai yang ditetapkan satu kali tetapi mungkin tidak diketahui saat kompilasi.

2. **`const`**
   - **Penggunaan**: `const` digunakan untuk membuat nilai konstan yang bersifat immutable (tidak dapat diubah).
   - **Waktu Penetapan Nilai**: Nilai `const` harus sudah diketahui pada saat kompilasi, sehingga hanya dapat digunakan dengan nilai yang benar-benar konstan.
   - **Contoh**:
     ```dart
     const double pi = 3.14159; // Nilai `pi` ditetapkan pada waktu kompilasi.
     ```
   - **Kegunaan**: `const` sering digunakan untuk objek yang akan selalu sama selama runtime aplikasi dan membantu menghemat memori.

### Perbedaan Utama
   - **Penetapan Nilai**: `final` memungkinkan penetapan nilai pada runtime, sedangkan `const` membutuhkan nilai yang ditetapkan pada waktu kompilasi.
   - **Penggunaan Objek**: `const` dapat digunakan untuk membuat objek yang benar-benar immutable, sementara `final` hanya memastikan bahwa variabel tidak bisa diubah setelah diinisialisasi.

Source : https://dart.dev/language/variables#final-and-const

## Membuat sebuah program Flutter baru dengan tema E-Commerce yang sesuai dengan tugas-tugas sebelumnya.
1. **Instalasi Flutter di macOS**
   - **Download dan ekstrak Flutter SDK** dari situs resmi [flutter.dev](https://docs.flutter.dev/get-started/install/macos/mobile-android).
   - **Tambahkan Flutter ke PATH** dengan membuka Terminal dan mengetikkan:
     ```bash
     export PATH=$HOME/development/flutter/bin:$PATH
     ```
   - Verifikasi instalasi Flutter dengan menjalankan:
     ```bash
     flutter doctor
     ```

2. **Instalasi IDE untuk Pengembangan Flutter**
   - **Visual Studio Code**: Disarankan untuk pengembangan ringan dan fleksibel.
     - Install **Flutter** dan **Dart extensions** di VS Code.
   - **Android Studio**: Diperlukan untuk menjalankan emulator Android pada macOS. Pastikan **Flutter** dan **Dart plugins** telah diinstal di Android Studio.

3. **Membuat Proyek Flutter Baru**
   - Buka Terminal dan arahkan ke direktori tempat proyek akan disimpan.
   - Buat proyek Flutter baru dengan perintah:
     ```bash
     flutter create make_me_up_mobile
     cd make_me_up_mobile
     ```
   - Jalankan proyek pada emulator atau perangkat fisik yang sudah terhubung:
     ```bash
     flutter run
     ```

4. **Pengaturan Tampilan Utama (main.dart)**
   - **Konfigurasi Tema**: Ubah tampilan dan nuansa aplikasi agar sesuai dengan tema E-Commerce.
   - Tambahkan file `menu.dart` ke dalam direktori `lib`, dan pindahkan widget `MyHomePage` ke `menu.dart`.
 
## Membuat tiga tombol sederhana dengan ikon dan teks untuk :
- Melihat daftar produk (Lihat Daftar Produk)
- Menambah produk (Tambah Produk)
- Logout (Logout)

### 1. Konfigurasi item pada Home Page & Implementasi warna-warna yang berbeda untuk setiap tombol
Untuk membuat tiga tombol pada halaman utama, kita menggunakan widget `ItemHomepage` untuk mendefinisikan data tombol, seperti nama, ikon, dan warna. Kemudian, kita menampilkan setiap tombol menggunakan widget `ItemCard` dalam `GridView`.
``` dart
final List<ItemHomepage> items = [
  ItemHomepage("View Product", Icons.mood, color: Color(0xffffb3c6)),  // Tombol Lihat Daftar Produk
  ItemHomepage("Add Product", Icons.add, color: Color(0xffff8fab)),        // Tombol Tambah Produk
  ItemHomepage("Logout", Icons.logout, color: Color(0xfffb6f92)),            // Tombol Logout
];
```
### 2. Kemudian, tampilkan tombol-tombol ini dalam GridView di dalam widget build seperti berikut:**
```dart
GridView.count(
  primary: true,
  padding: const EdgeInsets.all(20),
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  crossAxisCount: 3,
  shrinkWrap: true,
  children: items.map((ItemHomepage item) {
    return ItemCard(item);
  }).toList(),
);
```
Pada `GridView.count`, kita mengatur:
- `crossAxisCount`: Jumlah kolom dalam grid.
- `children`: Menampilkan tombol-tombol berdasarkan daftar `items` dengan memanggil widget `ItemCard` untuk setiap item.

### 3. Memunculkan Snackbar dengan tulisan:
Setiap tombol akan menampilkan pesan menggunakan `Snackbar` saat ditekan. Di dalam widget `ItemCard`, kita memanggil `ScaffoldMessenger` untuk menampilkan `Snackbar` yang berbeda sesuai tombol yang ditekan:
- "You pressed View Products button!" ketika tombol Lihat Daftar Produk ditekan.
- "You pressed Add Product button!" ketika tombol Tambah Produk ditekan.
- "You pressed Logout button!" ketika tombol Logout ditekan.
```dart
class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("You pressed ${item.name} button!")),
            );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```