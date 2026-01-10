import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import 'product_detail_screen.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 243, 50, 240),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scroll) {
          if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
            provider.loadMoreProducts();
          }
          return false;
        },
        child: ListView.separated(
          itemCount: provider.products.length + 1,
          separatorBuilder: (context, index) {
            return const Divider(height: 1, thickness: 1);
          },
          itemBuilder: (context, index) {
            if (index == provider.products.length) {
              return provider.isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : const SizedBox();
            }

            final product = provider.products[index];

            return ListTile(
              leading: Image.network(product.image, width: 50),
              title: Text(product.title),
              subtitle: Text('\$${product.price}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailScreen(product: product),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
