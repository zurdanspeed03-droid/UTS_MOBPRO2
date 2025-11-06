import 'package:flutter/material.dart';

// List global sementara untuk keranjang
List<String> cart = [];

class DetailPage extends StatelessWidget {
  final String name;
  final String imagePath;

  const DetailPage({
    super.key,
    required this.name,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: name,
              child: Image.asset(
                imagePath,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Produk $name segar hasil pertanian lokal Indonesia 🌾.\n"
                "Ditanam dengan metode ramah lingkungan dan tanpa bahan kimia berbahaya.\n"
                "Cocok untuk kebutuhan dapur dan gaya hidup sehat.",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
            const SizedBox(height: 10),

            // Tombol Beli Sekarang
            ElevatedButton.icon(
              onPressed: () {
                cart.add(name); // tambahkan ke keranjang
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$name berhasil ditambahkan ke keranjang 🛒"),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart),
              label: const Text("Beli Sekarang"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Tombol Lihat Keranjang
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CartPage(cartItems: cart),
                  ),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text("Lihat Keranjang"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade700,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

// Halaman Keranjang Sederhana
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
