import 'package:flutter/material.dart';
import 'package:make_me_up_mobile/models/product_entry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:make_me_up_mobile/widgets/left_drawer.dart';
import 'package:make_me_up_mobile/screens/product_detail.dart';


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
              'MAKE me UP\'s Products',
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
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Belum ada data produk pada MAKE me UP.',
                  style: TextStyle(fontSize: 20, 
                    fontWeight :FontWeight.bold, 
                    color : Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              );
            } else {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                fields.brand,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFF1F3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  fields.category,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            fields.productName,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            shortDescription,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Rp ${fields.price}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFD81B60),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: List.generate(
                              fields.ratings,
                              (index) => const Icon(
                                Icons.star,
                                color: Color(0xFFF06292), // text-pink-500
                                size: 20,
                              ),
                            ),
                          ),
                          // const SizedBox(height: 10),
                          // Row(
                          //   children: [
                          //     ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //         backgroundColor: const Color(0xFFEC407A), 
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(8),
                          //         ),
                          //       ),
                          //       onPressed: () {},
                          //       child: const Text('Edit'),
                          //     ),
                          //     const SizedBox(width: 8),
                          //     ElevatedButton(
                          //       style: ElevatedButton.styleFrom(
                          //         backgroundColor: const Color(0xFFE53935), 
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(8),
                          //         ),
                          //       ),
                          //       onPressed: () {},
                          //       child: const Text('Delete'),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  );
                }
              );
            }
          }
        },
      ),
    );
  }
}
