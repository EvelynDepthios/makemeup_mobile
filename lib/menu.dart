import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MAKE me UP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFFC1E3),       // Light pink for the app bar
          secondary: const Color(0xFFFFA3C2),     // Carnation pink for secondary elements
          surface: const Color(0xFFFFD7E3),       // Pastel pink for surfaces
          error: Colors.red,                      // Red for error elements
          onPrimary: Colors.black,                // Dark text on primary elements
          onSecondary: Colors.white,              // White text on secondary elements
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final String npm = '2306207543';
  final String name = 'Evelyn Depthios';
  final String className = 'PBP F';

  // Define different colors for each item
  final List<ItemHomepage> items = [
    ItemHomepage("View Products", Icons.shopping_bag, color: const Color(0xffffb3c6)),  // Carnation pink untuk tombol View Product
    ItemHomepage("Add Product", Icons.add_shopping_cart, color: const Color(0xffff8fab)), // Pastel pink untuk tombol Add Product
    ItemHomepage("Logout", Icons.exit_to_app, color: const Color(0xfffb6f92)), // Very light pink untuk tombol Logout
  ];

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MAKE me UP',
          style: TextStyle(
            color: Color(0xFFAE2D5D),     // Dark pink color for the title
            fontWeight: FontWeight.w900,      // Extra bold text
            fontSize: 28.0,  // Bold text
          ),
        ),
        backgroundColor: const Color(0xFFFFC1E3), // Light pink background for the AppBar
      ),
      backgroundColor: const Color(0xFFFEF0F5), // Very light pink background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Name', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
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
  final String title;
  final String content;

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

class ItemHomepage {
  final String name;
  final IconData icon;
  final Color color; // Add a color property to customize background color

  ItemHomepage(this.name, this.icon, {required this.color});
}

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Use the color defined for each item
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