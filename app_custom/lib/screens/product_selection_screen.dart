import 'package:flutter/material.dart';
import 'package:app_custom/widgets/product_card.dart';

class ProductSelectionScreen extends StatelessWidget {
  final String category;
  final List<Map<String, dynamic>> products;

  const ProductSelectionScreen({
    super.key,
    required this.category,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selecciona un modelo',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Elige el producto que deseas personalizar',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      title: product['name'],
                      description: product['description'],
                      imagePath: product['image'],
                      price: product['price'],
                      onTap: () {
                        // Navigate to customization screen with product details
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}