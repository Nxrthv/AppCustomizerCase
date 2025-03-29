import 'package:flutter/material.dart';
import 'package:app_custom/screens/case_selection_screen.dart';
import 'package:app_custom/widgets/select_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customizer App'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
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
              const SizedBox(height: 32),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    FeatureCard(
                      title: 'Fundas de Celular',
                      description: 'Personaliza tu funda con tus fotos',
                      imagePath: 'assets/images/fundas.webp',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CaseSelectionScreen(),
                          ),
                        );
                      },
                    ),
                    FeatureCard(
                      title: 'Cuadros Spotify',
                      description: 'Tu canción favorita en un cuadro',
                      imagePath: 'assets/images/cuadros_spotify.jpg',
                      onTap: () {
                        // Navigate to Spotify frame customization
                      },
                    ),
                    FeatureCard(
                      title: 'Camisetas',
                      description: 'Diseña tu propia camiseta',
                      imagePath: 'assets/images/camisetas.webp',
                      onTap: () {
                        // Navigate to t-shirt customization
                      },
                    ),
                    FeatureCard(
                      title: 'Tazas',
                      description: 'Tazas personalizadas con tus fotos',
                      imagePath: 'assets/images/tazas.webp',
                      onTap: () {
                        // Navigate to mug customization
                      },
                    ),
                    FeatureCard(
                      title: 'Llaveros',
                      description: 'Llaveros con diseños únicos',
                      imagePath: 'assets/images/llaveros.jpg',
                      onTap: () {
                      },
                    ),
                    FeatureCard(
                      title: 'Almohadas',
                      description: 'Almohadas con tus fotos favoritas',
                      imagePath: 'assets/images/almohadas.webp',
                      onTap: () {
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}