import 'package:flutter/material.dart';
import 'package:make_me_up_mobile/widgets/left_drawer.dart';
import 'package:make_me_up_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String npm = '2306207543'; // NPM
  final String name = 'Evelyn Depthios'; // Nama
  final String className = 'PBP F'; // Kelas

  final List<ItemHomepage> items = [
    ItemHomepage("View Products", Icons.shopping_bag, color: const Color(0xffffb3c6)),  // Carnation pink untuk tombol View Product
    ItemHomepage("Add Product", Icons.add_shopping_cart, color: const Color(0xffff8fab)), // Pastel pink untuk tombol Add Product
    ItemHomepage("Logout", Icons.exit_to_app, color: const Color(0xfffb6f92)), // Very light pink untuk tombol Logout
  ];

  @override  
  Widget build(BuildContext context) {
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
      backgroundColor: const Color(0xFFFEF0F5), // Very light pink background
      
      // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
      drawer: const LeftDrawer(),

      // Body halaman dengan padding di sekelilingnya.
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        // Menyusun widget secara vertikal dalam sebuah kolom.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Row untuk menampilkan 3 InfoCard secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            // Memberikan jarak vertikal 16 unit.
            const SizedBox(height: 10.0),

            // Menempatkan widget berikutnya di tengah halaman.
            Center(
              child: Column(
                // Menyusun teks dan grid item secara vertikal.
                children: [
                  // Menampilkan teks sambutan dengan gaya tebal dan ukuran 18.
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Welcome to MAKE me UP!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  // Grid untuk menampilkan ItemCard dalam bentuk grid 3 kolom.
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    // Agar grid menyesuaikan tinggi kontennya.
                    shrinkWrap: true,
                    // Menampilkan ItemCard untuk setiap item dalam list items.
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } 
}

class InfoCard extends StatelessWidget {
  final String title;  // Judul kartu.
  final String content;  // Isi kartu.

  const InfoCard({super.key, required this.title, required this.content});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, // White background for InfoCard
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
                color: Colors.black, // Black text color for title
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black, // Black text color for content
              ),
            ),
          ],
        ),
      ),
    );
  }
}