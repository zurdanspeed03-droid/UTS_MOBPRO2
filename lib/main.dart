import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const KatalogPertanianApp());
}

class KatalogPertanianApp extends StatelessWidget {
  const KatalogPertanianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Katalog Hasil Pertanian",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF9FDF7),
      ),
      home: const SplashScreen(),
    );
  }
}
