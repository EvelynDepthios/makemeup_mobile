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
**Mekanisme Pengiriman Input**
1. Di Flutter, pengguna dapat memasukkan data melalui widget input seperti `TextField`, `TextFormField`, `DropdownButton`, atau Checkbox. Pada kode ini, say amengimplementasikan kelas baru untuk modifikasi.
```dart
 Widget _buildTextField(String label, String hint, Function(String) onChanged,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text, required String? Function(String?) validator}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.pink[50],
      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
    );
  }
```
2. Setelah pengguna memasukkan data, Flutter dapat mengolah data tersebut sebelum dikirimkan ke server.
3. Setelah data siap, Flutter dapat mengirimkannya ke server menggunakan HTTP Request. 
```dart
...
onPressed: () async {
  if (_formKey.currentState!.validate()) {
    final response = await request.postJson(
      "http://127.0.0.1:8000/create-flutter/",
      jsonEncode(<String, String>{
        'brand': _brand,
        'product_name': _productName,
        'description': _description,
        'category': _category,
        'price': _price.toString(),
        'ratings': _ratings.toString(),
      }),
    );
    if (context.mounted) {
      if (response['status'] == 'success') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product successfully saved!")),
        );
        setState(() {
          _brand = "";
          _productName = "";
          _description = "";
          _category = "";
          _price = 0;
          _ratings = 0;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("An error occurred, try again.")),
        );
      }
    }
  }
},
...
```
4. Di sisi server, data yang diterima dari Flutter akan diolah. Pada projek ini menggunakan Django, dengan melakukan integrasi dan menambahkan barisan kode ini pada `views.py`. Jangan lupa untuk menambahkan path pada `urls.py`.
```python
@csrf_exempt
def create_product_flutter(request):
    if request.method == 'POST':

        data = json.loads(request.body)
        new_product = Product(
            user=request.user,
            brand=data['brand'],
            product_name=data['product_name'],
            price=int(data['price']),
            description=data['description'],
            category=data['category'],
            ratings=int(data['ratings'])
        )
        new_product.save()
        return JsonResponse({"status": "success"}, status=200)
    else:
        return JsonResponse({"status": "error"}, status=401)
```
5. Server dapat melakukan berbagai operasi, seperti validasi, penyimpanan data ke database, atau memproses data lebih lanjut.

**Menampilkan Data pada Flutter**
1. Setelah data diproses oleh backend, server akan mengirimkan response kembali ke Flutter. Response tersebut dapat ditampilkan kepada pengguna, contohnya saat `View Products`
2. Flutter akan melakukan permintaan HTTP ke endpoint yang menyediakan data dalam format JSON. Hal ini dapat dilakukan dengan menggunakan file baru di `/lib/models/product_entry.dart` dan isi sesuai dengan format json yang akan diterima melalui konversi di [Quicktype](https://app.quicktype.io).
Contoh Kode : 
```dart
// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String model;
    String pk;
    Fields fields;

    ProductEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String brand;
    String productName;
    int price;
    String description;
    String category;
    int ratings;

    Fields({
        required this.user,
        required this.brand,
        required this.productName,
        required this.price,
        required this.description,
        required this.category,
        required this.ratings,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        brand: json["brand"],
        productName: json["product_name"],
        price: json["price"],
        description: json["description"],
        category: json["category"],
        ratings: json["ratings"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "brand": brand,
        "product_name": productName,
        "price": price,
        "description": description,
        "category": category,
        "ratings": ratings,
    };
}
```
3. Mengambil dan menampilkan data tersebut di dalam screens, seperti berikut :
```dart
class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }
```
```dart
return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (_, index) {
    final product = snapshot.data![index];
    final fields = product.fields;

    // Batasi deskripsi hanya sampai 50 karakter
    String shortDescription = fields.description.length > 50
        ? '${fields.description.substring(0, 50)}...'
        : fields.description;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
      child : Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color : Colors.white,
          // color: const Color(0xFFFFF1F3), 
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xFFF8BBD0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
// Dan seterusnya
...
```

## Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
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

## Implementasi Checklist
### Memastikan deployment proyek tugas Django kamu telah berjalan dengan baik.
Melakukan pengecekkan dengan mengakses web Django melalui PWS.

### Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter.
1. Tambahkan metode `view` berikut pada `authentication/views.py` yang sudah dibuat di Django.
```python
from django.contrib.auth.models import User
import json

...

@csrf_exempt
def register(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        username = data['username']
        password1 = data['password1']
        password2 = data['password2']

        # Check if the passwords match
        if password1 != password2:
            return JsonResponse({
                "status": False,
                "message": "Passwords do not match."
            }, status=400)
        
        # Check if the username is already taken
        if User.objects.filter(username=username).exists():
            return JsonResponse({
                "status": False,
                "message": "Username already exists."
            }, status=400)
        
        # Create the new user
        user = User.objects.create_user(username=username, password=password1)
        user.save()
        
        return JsonResponse({
            "username": user.username,
            "status": 'success',
            "message": "User created successfully!"
        }, status=200)
    
    else:
        return JsonResponse({
            "status": False,
            "message": "Invalid request method."
        }, status=400)

```
2. Tambahkan path baru pada `authentication/urls.py` dengan kode berikut
`path('register/', register, name='register'),`
3. Pada proyek Flutter, tambahkan file baru pada folder `screens` dengan nama `register.dart`
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:make_me_up_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo di sebelah kiri
            Image.asset(
              'assets/images/logo.png', // Ganti dengan path logo Anda
              height: 40, // Sesuaikan ukuran logo
            ),
            const SizedBox(width: 10), // Memberikan jarak antara logo dan teks
            // Judul di sebelah kanan logo
            Text(
              'MAKE me UP',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,  // Dark pink color for the title
                fontWeight: FontWeight.w900,
                fontSize: 28.0,
              ),
            ),
          ],
        ),
        surfaceTintColor: Theme.of(context).colorScheme.primary, // Pastikan warna tetap sama
        scrolledUnderElevation: 0, // Mencegah perubahan warna saat di-scroll
        backgroundColor: Theme.of(context).colorScheme.primary, // Light pink background for the AppBar
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      hintText: 'Confirm your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password1 = _passwordController.text;
                      String password2 = _confirmPasswordController.text;

                      // Cek kredensial
                      final response = await request.postJson(
                          "http://127.0.0.1:8000/auth/register/",
                          jsonEncode({
                            "username": username,
                            "password1": password1,
                            "password2": password2,
                          }));
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Successfully registered!'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to register!'),
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Membuat halaman login pada proyek tugas Flutter.
1. Tambahkan sebuah metode *view* untuk login pada `authentication/views.py`.
```python
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```
2. Buat file `urls.py` pada folder authentication dan tambahkan URL routing pada fungsi yang baru dibuat.
```python
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```

### Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
**Jangan lupa untuk menyalakan virtual environment terlebih dahulu**
1. Lakukan startapp baru dengan nama `authentication` pada proyek Django sebelumnya.
2. Tambahkan authentication ke `INSTALLED_APPS` pada main project `settings.py` Django.
3. Tambahkan `django-cors-headers` ke `requirements.txt`.
4. Jalankan perintah `pip install django-cors-headers` di terminal untuk menginstal library yang dibutuhkan.
5. Tambahkan `corsheaders` ke `INSTALLED_APPS` pada main project `settings.py` Django.
6. Tambahkan `corsheaders.middleware.CorsMiddleware` pada main project `settings.py` Django.
7. Tambahkan beberapa baris berikut ini pada main project `settings.py` aplikasi Django.
```python
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
8. Tambahkan `path('auth/', include('authentication.urls')),` pada file `main/urls.py`.
9. Instal package yang telah disediakan oleh tim asdos dengan menjalankan perintah berikut di terminal.
```
flutter pub add provider
flutter pub add pbp_django_auth
```
10. Untuk menggunakan package tersebut, modifikasi root widget untuk menyediakan `CookieRequest` library ke semua child widgets dengan menggunakan `Provider`.
```dart
...
import 'package:pbp_django_auth/pbp_django_auth.dart'; 
import 'package:provider/provider.dart';
...
@override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
      ...
```
11. Tambahkan file baru pada folder `screens` dengan nama `login.dart`.
```dart
import 'package:make_me_up_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:make_me_up_mobile/screens/register.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(secondary: Colors.deepPurple[400]),
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo di sebelah kiri
            Image.asset(
              'assets/images/logo.png', // Ganti dengan path logo Anda
              height: 40, // Sesuaikan ukuran logo
            ),
            const SizedBox(width: 10), // Memberikan jarak antara logo dan teks
            // Judul di sebelah kanan logo
            Text(
              'MAKE me UP',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,  // Dark pink color for the title
                fontWeight: FontWeight.w900,
                fontSize: 28.0,
              ),
            ),
          ],
        ),
        surfaceTintColor: Theme.of(context).colorScheme.primary, // Pastikan warna tetap sama
        scrolledUnderElevation: 0, // Mencegah perubahan warna saat di-scroll
        backgroundColor: Theme.of(context).colorScheme.primary, // Light pink background for the AppBar
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () async {
                      String username = _usernameController.text;
                      String password = _passwordController.text;

                      // Cek kredensial
                      // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                      final response = await request
                          .login("http://127.0.0.1:8000/auth/login/", {
                        'username': username,
                        'password': password,
                      });

                      if (request.loggedIn) {
                        String message = response['message'];
                        String uname = response['username'];
                        if (context.mounted) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                  content:
                                      Text("$message Welcome, $uname.")),
                            );
                        }
                      } else {
                        if (context.mounted) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Login Failed'),
                              content: Text(response['message']),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 36.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: Text(
                      'Don\'t have an account? Register',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
```
12. Pada file `main.dart`, pada `Widget MaterialApp(...)`, ubah `home: MyHomePage()` menjadi `home: const LoginPage()`

### Membuat model kustom sesuai dengan proyek aplikasi Django.
1. Bukalah endpoint JSON yang sudah dibuat sebelumnya pada projek Django.
2. Salinlah data JSON dan buka situs web Quicktype.
3. Pada situs web Quicktype, ubahlah setup name menjadi ProductEntry, source type menjadi JSON, dan language menjadi Dart.
4. Paste data JSON yang telah disalin sebelumnya ke dalam textbox yang tersedia pada Quicktype.
5. Copy code yang dihasilkan.
6. Setelah mendapatkan kode model melalui Quicktype, buka kembali proyek Flutter dan buatlah folder baru models/ pada subdirektori lib/. Buatlah file baru pada folder tersebut dengan nama `product_entry.dart`, dan paste kode yang sudah disalin dari Quicktype.

### Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
#### Tampilkan name, price, dan description dari masing-masing item pada halaman ini.

1. Buatlah sebuah file baru dalam `lib/screens/` dengan nama `list_productentry.dart`.
2. Fetch data menggunakan HTTP 
```dart
class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductEntryPageState();
}

class _ProductEntryPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://127.0.0.1:8000/json/');
    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }
```
3. Implementasikan tampilan yang diinginkan untuk menampilkan seluruh produk.

#### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
### Tampilkan seluruh atribut pada model item kamu pada halaman ini.
1. Buatlah sebuah file baru dalam `lib/screens/` dengan nama `product_detail.dart`.
```dart
import 'package:flutter/material.dart';
import 'package:make_me_up_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(product.fields.productName,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w900,
            fontSize: 24.0,
          ),
        ),
        surfaceTintColor: Theme.of(context).colorScheme.primary, // Pastikan warna tetap sama
        scrolledUnderElevation: 0, // Mencegah perubahan warna saat di-scroll
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.fields.productName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Brand : ${product.fields.brand}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Category : ${product.fields.category}",
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Description : ${product.fields.description}",
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 103, 103, 103),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Price : Rp ${product.fields.price}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFFD81B60),
              ),
            ),
            const SizedBox(height: 20),
            
            Row(
              children: [
                // Menampilkan ikon bintang
                Row(
                  children: List.generate(
                    product.fields.ratings,
                    (index) => const Icon(
                      Icons.star,
                      color: Color(0xFFF06292),
                      size: 24,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                
                // Menampilkan angka rating di samping bintang
                Text(
                  product.fields.ratings.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
```
#### Halaman ini dapat diakses dengan menekan salah satu item pada halaman daftar Item.
1. Ubah implementasi kode berikut pada `list_productentry.dart` agar dapat mengakses halaman detail setiap item.
```dart
...
return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (_, index) {
    final product = snapshot.data![index];
    final fields = product.fields;

    // Batasi deskripsi hanya sampai 50 karakter
    String shortDescription = fields.description.length > 50
        ? '${fields.description.substring(0, 50)}...'
        : fields.description;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      },
...
```
*Mengubah dengan menambahkan `GestureDetector` dan data index*

#### Tambahkan tombol untuk kembali ke halaman daftar item.
Di Flutter, jika kita membuka halaman baru menggunakan `Navigator.push` atau `Navigator.pushNamed`, maka Scaffold dengan AppBar secara otomatis akan menyertakan tombol kembali di sebelah kiri AppBar (dengan ikon panah).

#### Melakukan filter pada halaman daftar item dengan hanya menampilkan item yang terasosiasi dengan pengguna yang login.
Pada file `list_productentry.dart` terdapat `CookieRequest`, yang digunakan untuk mengirimkan permintaan HTTP dengan menyertakan informasi cookie sesi yang diperoleh setelah pengguna berhasil login. Hal ini memungkinkan Django untuk mengidentifikasi pengguna yang sedang login dan memfilter item yang terkait dengan pengguna tersebut. Pada fungsi *view* di Django juga menyertakan `request.user`
```python
@login_required(login_url='/login')
def show_main(request):
    context = {
        'name': request.user.username, // Bagian ini
        'class': 'PBP F',
        'npm': '2306207543',
        'last_login': request.COOKIES['last_login'],
    }

    return render(request, "main.html", context)
```

# Terima Kasih