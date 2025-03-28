import 'package:flutter/material.dart';
import 'package:app_customizer_case/screens/product_selection_screen.dart';

class AlternativeHomeScreen extends StatelessWidget {
  const AlternativeHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample product categories with images
    final List<Map<String, dynamic>> categories = [
      {
        'title': 'Fundas de Celular',
        'image': 'assets/images/phone_cases.jpg',
        'products': [
          {
            'name': 'iPhone 13 Pro',
            'description': 'Funda resistente con bordes reforzados',
            'image': 'assets/images/iphone_case.jpg',
            'price': 19.99,
          },
          {
            'name': 'Samsung S22',
            'description': 'Funda transparente personalizable',
            'image': 'assets/images/samsung_case.jpg',
            'price': 18.99,
          },
          // Add more products
        ],
      },
      {
        'title': 'Cuadros Spotify',
        'image': 'assets/images/spotify_frames.jpg',
        'products': [
          {
            'name': 'Cuadro Clásico',
            'description': 'Cuadro con código QR de tu canción favorita',
            'image': 'assets/images/spotify_classic.jpg',
            'price': 24.99,
          },
          // Add more products
        ],
      },
      {
        'title': 'Camisetas',
        'image': 'assets/images/tshirts.jpg',
        'products': [
          {
            'name': 'Camiseta Básica',
            'description': 'Algodón 100%, varios colores disponibles',
            'image': 'assets/images/basic_tshirt.jpg',
            'price': 29.99,
          },
          // Add more products
        ],
      },
      {
        'title': 'Tazas',
        'image': 'assets/images/mugs.jpg',
        'products': [
          {
            'name': 'Taza Mágica',
            'description': 'Cambia de color con bebidas calientes',
            'image': 'assets/images/magic_mug.jpg',
            'price': 15.99,
          },
          // Add more products
        ],
      },
      {
        'title': 'Llaveros',
        'image': 'assets/images/keychains.jpg',
        'products': [
          // Add products
        ],
      },
      {
        'title': 'Almohadas',
        'image': 'assets/images/pillows.jpg',
        'products': [
          // Add products
        ],
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customizer App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  'Personaliza tus productos',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Crea diseños únicos con tus imágenes favoritas',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                
                // Featured products carousel
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductSelectionScreen(
                                category: categories[index]['title'],
                                products: categories[index]['products'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: 300,
                          margin: const EdgeInsets.only(right: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: AssetImage(categories[index]['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                                stops: const [0.6, 1.0],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    categories[index]['title'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Ver productos',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                
                const SizedBox(height: 32),
                Text(
                  'Todas las categorías',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                
                // Grid of all categories
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductSelectionScreen(
                              category: categories[index]['title'],
                              products: categories[index]['products'],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(categories[index]['image']),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                              stops: const [0.6, 1.0],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  categories[index]['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}