import 'package:flutter/material.dart';
import 'package:make_me_up_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:make_me_up_mobile/screens/menu.dart';
import 'dart:convert';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _brand = "";
  String _productName = "";
  String _description = "";
  String _category = "";
  int _price = 0;
  int _ratings = 0;

  final List<String> _categories = [
    'Lip Product',
    'Eye Product',
    'Face Product',
    'Body Care',
    'Hair Care',
    'Fragrance',
  ];

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
              'Create Product',
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
      backgroundColor: const Color(0xFFFCE4EC),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                      "Brand",
                      "Enter brand",
                      (value) => setState(() => _brand = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Brand cannot be empty!";
                        }
                        if (value.length > 100) {
                          return "Brand cannot exceed 100 characters!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      "Product Name",
                      "Enter product name",
                      (value) => setState(() => _productName = value),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Product Name cannot be empty!";
                        }
                        if (value.length > 100) {
                          return "Product Name cannot exceed 100 characters!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      "Price",
                      "Enter price",
                      (value) => setState(() => _price = int.tryParse(value) ?? 0),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Price cannot be empty!";
                        }
                        if (int.tryParse(value) == null || int.parse(value) <= 0) {
                          return "Price must be a positive number!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildTextField(
                      "Description",
                      "Enter description",
                      (value) => setState(() => _description = value),
                      maxLines: 4,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Description cannot be empty!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildDropdown(),
                    const SizedBox(height: 16),
                    _buildTextField(
                      "Ratings",
                      "Enter ratings (1-5)",
                      (value) => setState(() => _ratings = int.tryParse(value) ?? 0),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ratings cannot be empty!";
                        }
                        int? rating = int.tryParse(value);
                        if (rating == null || rating < 1 || rating > 5) {
                          return "Ratings must be between 1 and 5!";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
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
                        child: const Text("Save", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

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

  Widget _buildDropdown() {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: "Category",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.pink[50],
      ),
      value: _category.isEmpty ? null : _category,
      items: _categories.map((String category) {
        return DropdownMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() => _category = newValue!);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please select a category!";
        }
        return null;
      },
    );
  }
}
