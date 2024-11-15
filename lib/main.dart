import 'package:flutter/material.dart';
// import 'package:make_me_up_mobile/screens/menu.dart';
import 'package:make_me_up_mobile/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'MAKE me UP',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFFFC1E3),      // Light pink for primary elements
            secondary: const Color(0xFFFFA3C2),    // Bold pink for secondary elements
            surface: const Color(0xFFFFD7E3),      // Softer pink for surfaces
            error: Colors.red,                     // Red for error elements
            onPrimary: const Color(0xFFAE2D5D),    // Dark Pink text on primary elements
            onSecondary: Colors.white,             // White text on secondary elements
            onSurface: Colors.black,),
        ),
        home: const LoginPage(),
      ),
    );
  }
}