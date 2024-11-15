**Nama        : Evelyn Depthios <br />**
**NPM         : 2306207543 <br />**
**Kelas       : PBP F <br />**

[Tugas 7](#tugas-7)

[Tugas 8](#tugas-8)

[Tugas 9](#tugas-9)

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
     `const` double pi = 3.14159; // Nilai `pi` ditetapkan pada waktu kompilasi.
     ```
   - **Kegunaan**: `const` sering digunakan untuk objek yang akan selalu sama selama runtime aplikasi dan membantu menghemat memori.

### Perbedaan Utama
   - **Penetapan Nilai**: `final` memungkinkan penetapan nilai pada runtime, sedangkan `const` membutuhkan nilai yang ditetapkan pada waktu kompilasi.
   - **Penggunaan Objek**: `const` dapat digunakan untuk membuat objek yang benar-benar immutable, sementara `final` hanya memastikan bahwa variabel tidak bisa diubah setelah diinisialisasi.

Source : https://dart.dev/language/variables#final-and-`const`

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
  padding: `const` EdgeInsets.all(20),
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

  `const` ItemCard(this.item, {super.key});

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
          padding: `const` EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                `const` Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: `const` TextStyle(color: Colors.white),
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

# Tugas 8
## Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const` pada kode Flutter. Kapan sebaiknya kita menggunakan `const`, dan kapan sebaiknya tidak digunakan?
Dalam Flutter, `const` digunakan untuk membuat konstanta pada waktu kompilasi. Saat sebuah widget atau variabel diberi kata kunci `const`, Flutter hanya membuat objek tersebut satu kali dan menggunakan kembali objek itu setiap kali dibutuhkan. Hal ini membantu meningkatkan performa dan mengurangi penggunaan memori.

### Keuntungan menggunakan `const`:
- **Performa**: Flutter tidak perlu membangun ulang atau membuat ulang widget tree untuk widget yang bersifat `const`, sehingga bisa membuat aplikasi berjalan lebih cepat.
- **Efisiensi Memori**: Karena widget yang menggunakan `const` bersifat statis dan digunakan kembali, ini membantu mengurangi penggunaan memori.
- **Keterbacaan Kode**: Menggunakan `const` memperjelas bagian mana dari kode yang bersifat statis dan tidak akan berubah, sehingga memudahkan pemeliharaan kode.

### Kapan menggunakan `const`:
- Gunakan `const` untuk widget atau variabel yang **tidak berubah selama siklus hidup aplikasi**, seperti label teks statis atau layout yang tidak berubah.
- Pada daftar atau struktur yang berulang di mana widget tetap sama, gunakan `const` untuk meningkatkan performa.

#### Kapan tidak menggunakan `const`:
- Hindari `const` untuk widget yang **bergantung pada data dinamis atau context** (seperti `Theme.of(context).colorScheme`). Nilai-nilai ini hanya diketahui pada waktu runtime, sehingga tidak bisa dijadikan `const`.

Source : https://dart.dev/guides/language/language-tour#final-and-const

 
## Jelaskan dan bandingkan penggunaan `Column` dan `Row` pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` dan `Row` adalah widget dasar pada Flutter yang digunakan untuk menyusun widget lainnya dalam satu baris atau kolom.

- **Column**: Menyusun widget secara **vertikal** (dari atas ke bawah).
- **Row**: Menyusun widget secara **horizontal** (dari kiri ke kanan).

#### Contoh Penggunaan `Column`:
```dart
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text('MAKE me UP'),
    Text('Your One-Stop Beauty Destination!'),
  ],
)
```

#### Contoh Penggunaan `Row`:
```dart
// Row untuk menampilkan 3 InfoCard secara horizontal.
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    InfoCard(title: 'NPM', content: npm),
    InfoCard(title: 'Name', content: name),
    InfoCard(title: 'Class', content: className),
  ],
),
```
Source : https://docs.flutter.dev/development/ui/layout/tutorial

 
## Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

### Elemen Input yang Digunakan
Pada halaman form `ProductEntryFormPage` ini, elemen input yang digunakan meliputi:
1. **TextFormField**: Digunakan untuk memasukkan teks, termasuk `brand`, `name`, `price`, `description`, `category`, dan `rating`. Setiap `TextFormField` memiliki validator untuk memastikan bahwa input sesuai dengan aturan (misalnya, tidak boleh kosong, harus berupa angka, dan batas karakter).

2. **ElevatedButton**: Digunakan sebagai tombol untuk menyimpan data yang dimasukkan. Ketika tombol ini ditekan, form akan divalidasi, dan jika valid, data akan ditampilkan di dialog konfirmasi.

### Elemen Input Lain di Flutter yang Tidak Digunakan
1. **Checkbox**: Untuk memilih nilai boolean (true/false) seperti "setuju" atau "aktif".
2. **Switch**: Untuk memilih antara dua nilai (misalnya on/off).
3. **Slider**: Untuk memilih nilai dalam rentang tertentu, misalnya nilai rating.
4. **Radio**: Untuk memilih satu opsi dari beberapa pilihan.

Source : https://docs.flutter.dev/development/ui/widgets/forms


## Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam aplikasi Flutter agar konsisten, saya menggunakan `ThemeData` di bagian `MaterialApp`. Tema ini mengatur warna, teks, dan style untuk seluruh aplikasi, sehingga setiap widget dapat mengikuti tema yang sama tanpa harus ditetapkan satu per satu.

Contoh implementasi tema:
```dart
...
return MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color(0xFFFFC1E3),      // Light pink for primary elements
      secondary: const Color(0xFFFFA3C2),    // Bold pink for secondary elements
      surface: const Color(0xFFFFD7E3),      // Softer pink for surfaces
      error: Colors.red,                     // Red for error elements
      onPrimary: const Color(0xFFAE2D5D),    // Dark Pink text on primary elements
      onSecondary: Colors.white,             // White text on secondary elements
      onSurface: Colors.black,               // Black text on surfaces
      ),
  ),
);
...
```
 
## Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menangani navigasi dalam aplikasi dengan banyak halaman di Flutter, saya menggunakan fungsi `push`, `pop`, dan `pushReplacement` dari `Navigator`. Berikut penjelasan dari masing-masing metode beserta contohnya:
### 1. **Navigator.push**
`Navigator.push` digunakan untuk menambahkan halaman baru ke atas stack halaman. Ini akan membawa pengguna ke halaman baru, dan pengguna bisa kembali ke halaman sebelumnya menggunakan tombol back.

Contoh di kode saya, ketika pengguna memilih "Add Product" pada halaman utama, aplikasi akan mendorong (push) halaman `ProductEntryFormPage` ke atas stack:
```dart
if (item.name == "Add Product") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductEntryFormPage(),
    ),
  );
}
```

### 2. **Navigator.pop**
`Navigator.pop` digunakan untuk kembali ke halaman sebelumnya yang ada di bawah stack. Ini berguna ketika pengguna selesai dengan halaman tertentu dan ingin kembali ke halaman yang sebelumnya.

Pada halaman `ProductEntryFormPage`, setelah pengguna menekan tombol "OK" di dialog konfirmasi, aplikasi akan menutup dialog tersebut, lalu memanggil `Navigator.pop` untuk kembali ke halaman sebelumnya.
```dart
onPressed: () {
  Navigator.pop(context); // Menutup dialog
  Navigator.pop(context); // Kembali ke halaman sebelumnya
  _formKey.currentState!.reset();
},
```

### 3. **Navigator.pushReplacement**
`Navigator.pushReplacement` digunakan untuk mengganti halaman di bagian atas stack dengan halaman baru, sehingga pengguna tidak bisa kembali ke halaman sebelumnya. Ini berguna ketika ingin menggantikan halaman saat ini dengan halaman baru tanpa opsi untuk kembali.
Tentu! Berikut adalah penjelasan mengenai navigasi `pushReplacement` dalam konteks kode `LeftDrawer` yang kamu berikan, serta cara menggantinya dengan penjelasan yang lebih spesifik.

Pada `LeftDrawer`, saat pengguna memilih **"Home Page"**, aplikasi akan menggantikan halaman saat ini dengan halaman `MyHomePage`.
```dart
onTap: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ),
  );
},
```
Pada kode di atas, ketika pengguna memilih "Home Page," aplikasi akan melakukan navigasi ke halaman `MyHomePage`, menggantikan halaman saat ini. Hal ini berarti pengguna tidak dapat menggunakan tombol "Back" untuk kembali ke halaman yang sebelumnya ditampilkan.

Source : https://docs.flutter.dev/development/ui/navigation

## Implementasi Checklist
### Membuat halaman formulir tambah item baru
Untuk membuat halaman form tambah item, buat sebuah halaman baru dengan widget ProductEntryFormPage, yang menampilkan formulir untuk menambah data item baru. Di dalam form ini, kita menggunakan beberapa elemen input seperti TextFormField untuk menerima masukan seperti nama produk, harga, deskripsi, kategori, dan rating.

### Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Add Product pada halaman utama.
Pada halaman utama (`MyHomePage`), ketika tombol "Add Product" ditekan, kita menggunakan `Navigator.push` untuk membuka halaman `ProductEntryFormPage`.
```dart
if (item.name == "Add Product") {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => ProductEntryFormPage(),
    ),
  );
}
```

### Memunculkan data sesuai isi dari form
Setelah pengguna mengisi formulir dan menyimpan data, kita bisa menampilkan data yang diisi melalui dialog konfirmasi atau di halaman utama dengan cara mengembalikan data dari halaman `ProductEntryFormPage` dan menampilkannya di halaman utama.
```dart
onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Data Saved!'),
        content: Text('Name: $_name, Price: $_price'), // dst...
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
```

### Membuat sebuah drawer
Buat drawer dengan widget `LeftDrawer` yang memuat berbagai menu navigasi, seperti halaman utama dan halaman tambah produk. Dengan drawer ini, pengguna dapat berpindah antarhalaman dengan mudah.
```dart
class LeftDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'MAKE me UP',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductEntryFormPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

# Tugas 9
## Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model sangat penting untuk menangani pengambilan dan pengiriman data JSON karena:

- **Struktur Data yang Terstandarisasi**: Dengan model, kita dapat memastikan bahwa data yang dikirim atau diterima sesuai dengan struktur yang diharapkan, sehingga menghindari error yang mungkin terjadi karena perbedaan format.
- **Validasi Data**: Model dapat membantu memvalidasi data sebelum dikirim atau disimpan di backend, memastikan bahwa semua field yang dibutuhkan terisi dengan benar.
- **Mapping Data**: Model memudahkan untuk memetakan data JSON ke dalam objek di Flutter, sehingga kita dapat dengan mudah mengakses dan mengelola data tersebut.
  
Tanpa model, error bisa terjadi saat mengambil atau mengirim data, terutama jika data yang diterima tidak memiliki format yang konsisten. Hal ini bisa menyebabkan kesalahan parsing atau null reference di aplikasi Flutter.

Source : https://docs.flutter.dev/cookbook/networking/background-parsing, https://docs.flutter.dev/data-and-backend/serialization/json

## Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` pada Flutter digunakan untuk melakukan **request HTTP** seperti `GET`, `POST`, `PUT`, dan `DELETE` ke server. Berikut adalah beberapa fungsi utama dari library `http`:

- **Mengirim Request**: Mengirimkan request HTTP ke API server, seperti untuk mengambil data (`GET`) atau mengirim data (`POST`).
- **Menerima Response**: Menerima response dari server dan memproses data yang diterima, termasuk data JSON.
- **Autentikasi**: Dapat digunakan bersama dengan token untuk melakukan autentikasi pengguna.

**Contoh Implementasi :** 
```dart
```
Source : https://pub.dev/packages/http

## Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance `CookieRequest` perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah sebuah class yang bertugas untuk **menyimpan cookie** yang diperoleh setelah login dan menggunakannya untuk **request selanjutnya**. Ini sangat berguna terutama jika kita membutuhkan **session persistence**, di mana pengguna tetap login meskipun aplikasi ditutup dan dibuka kembali.

- **Penyimpanan Status Autentikasi**: Setelah pengguna login, `CookieRequest` akan menyimpan session cookie. Cookie ini digunakan untuk **autentikasi request** berikutnya tanpa perlu login ulang.
- **Berbagi di Seluruh Aplikasi**: Dengan membagikan instance `CookieRequest` ke seluruh komponen, kita dapat memastikan bahwa semua request yang membutuhkan autentikasi memiliki akses ke cookie yang sama.

Tanpa berbagi instance ini, **autentikasi pengguna mungkin gagal** karena komponen lain tidak memiliki akses ke cookie yang valid.

Source : https://docs.djangoproject.com/en/5.1/topics/auth/

## Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

## Implementasi Checklist
### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.

### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.

## Membuat halaman login pada proyek tugas Flutter.

## Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.

## Membuat model kustom sesuai dengan proyek aplikasi Django.

## Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
1. ### Tampilkan name, price, dan description dari masing-masing item pada halaman ini.
2. ### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
3. ### Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
4. ### Tampilkan seluruh atribut pada model item kamu pada halaman ini.
5. ### Tambahkan tombol untuk kembali ke halaman daftar item.
6. ### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.



### 4. **Mekanisme Pengiriman Data dari Input hingga Ditampilkan pada Flutter**
Mekanisme pengiriman data pada aplikasi Flutter yang terhubung dengan backend (Django) dapat dijelaskan sebagai berikut:



1. **Input Data**: Pengguna mengisi data di form pada aplikasi Flutter.
2. **Pengiriman Data**: Flutter mengirim data ke server Django menggunakan `http.post()` atau metode yang sesuai.
   ```dart
   final response = await http.post(
     Uri.parse('https://example.com/api/submit'),
     headers: {'Content-Type': 'application/json'},
     body: jsonEncode({'key': value}),
   );
   ```
3. **Pemrosesan di Backend**: Server Django menerima request, memproses data, dan memberikan response (misalnya, status 200 jika berhasil).
4. **Penerimaan Response**: Flutter menerima response dari server dan memperbarui UI dengan data yang diterima.

**Referensi**:
- [Django REST Framework](https://www.django-rest-framework.org/)
- [Flutter Form Handling](https://docs.flutter.dev/cookbook/forms)

---

### 5. **Mekanisme Autentikasi dari Login, Register, hingga Logout**
Berikut adalah alur autentikasi dari login, registrasi, dan logout:

**A. Register:**
1. **Input Data**: Pengguna mengisi form registrasi di Flutter.
2. **Pengiriman Data**: Data dikirim ke server Django menggunakan `http.post()`.
3. **Validasi di Django**: Django memvalidasi data (misalnya, memastikan username unik).
4. **Response**: Jika berhasil, Django mengirim response sukses, dan Flutter menampilkan notifikasi kepada pengguna.

**B. Login:**
1. **Input Data**: Pengguna mengisi form login.
2. **Pengiriman Data**: Flutter mengirim data ke endpoint login Django.
3. **Autentikasi di Django**: Django memeriksa kredensial dan, jika valid, mengirimkan session cookie.
4. **Menyimpan Session di Flutter**: Cookie disimpan di `CookieRequest` dan digunakan untuk request selanjutnya.
5. **Navigasi**: Jika berhasil login, pengguna diarahkan ke halaman beranda.

**C. Logout:**
1. **Mengirim Request Logout**: Flutter mengirim request logout ke Django.
2. **Hapus Session**: Django menghapus session cookie.
3. **Hapus Cookie di Flutter**: Flutter menghapus cookie dari `CookieRequest` dan mengarahkan pengguna kembali ke halaman login.

**Referensi**:
- [Django Authentication System](https://docs.djangoproject.com/en/2.2/topics/auth/)
- [Flutter State Management](https://docs.flutter.dev/development/data-and-backend/state-mgmt)