import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<String> cartItems;

  const CartPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Belanja"),
        backgroundColor: Colors.green,
      ),
      body: cartItems.isEmpty
          ? const Center(
              child: Text(
                "Keranjang kosong 😅",
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return ListTile(
                  title: Text(item),
                  trailing: const Icon(Icons.shopping_cart),
                );
              },
            ),
    );
  }
}
