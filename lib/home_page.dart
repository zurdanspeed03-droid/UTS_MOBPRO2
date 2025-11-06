import 'package:flutter/material.dart';
import 'product_card.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _products = [
    {"name": "Tomat", "image": "assets/images/tomat.jpg", "favorite": false},
    {"name": "Cabai", "image": "assets/images/cabai.jpg", "favorite": false},
    {"name": "Jagung", "image": "assets/images/jagung.jpg", "favorite": false},
    {"name": "Beras", "image": "assets/images/beras.jpg", "favorite": false},
    {"name": "Kentang", "image": "assets/images/kentang.jpg", "favorite": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Katalog Hasil Pertanian",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = constraints.maxWidth > 600
                ? 4
                : constraints.maxWidth > 400
                    ? 3
                    : 2;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.78,
              ),
              itemCount: _products.length,
              itemBuilder: (context, index) {
                final product = _products[index];
                return ProductCard(
                  name: product['name'],
                  imagePath: product['image'],
                  isFavorite: product['favorite'],
                  onTapFavorite: () {
                    setState(() {
                      _products[index]['favorite'] =
                          !_products[index]['favorite'];
                    });
                  },
                  onTapDetail: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          name: product['name'],
                          imagePath: product['image'],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
