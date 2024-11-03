import 'package:flutter/material.dart';
import 'package:make_me_up_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFFC1E3),      // Light pink for primary elements
          secondary: const Color(0xFFFFA3C2),    // Bold pink for secondary elements
          surface: const Color(0xFFFFD7E3),      // Softer pink for surfaces
          error: Colors.red,                     // Red for error elements
          onPrimary: Colors.white,               // White text on primary elements
          onSecondary: Colors.white,             // White text on secondary elements
          onSurface: Colors.black,               // Black text on surfaces
          ),
      ),
      home: MyHomePage(),
    );
  }
}
