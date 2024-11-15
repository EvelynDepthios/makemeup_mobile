import 'package:flutter/material.dart';
import 'package:make_me_up_mobile/screens/menu.dart';
import 'package:make_me_up_mobile/screens/productentry_form.dart';
import 'package:make_me_up_mobile/screens/list_productentry.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:make_me_up_mobile/screens/login.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              children: [
                // Logo Image
                Image.asset(
                  'assets/images/logo.png',  // Pastikan path gambar sesuai
                  height: 30.0, // Atur ukuran logo sesuai kebutuhan
                ),
                const SizedBox(width: 10), // Space antara logo dan title
                Text(
                  'MAKE me UP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                const Text(
                  "Your One-Stop Beauty Destination!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home Page'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Add Product'),
            // Bagian redirection ke MoodEntryFormPage
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryFormPage(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('View Products'),
            onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProductEntryPage()),
                );
            },
        ),
        ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
                final response = await request.logout(
                  "http://127.0.0.1:8000/auth/logout/");
                String message = response["message"];
                if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message Sampai jumpa, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
            },
        ),
        ],
      ),
    );
  }
}