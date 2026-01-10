import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 243, 50, 240),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product.image, height: 200)),
            const SizedBox(height: 16),
            Text(product.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              '\$${product.price}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
