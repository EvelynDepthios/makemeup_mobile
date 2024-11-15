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