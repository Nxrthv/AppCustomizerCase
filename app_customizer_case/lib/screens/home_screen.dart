import 'package:flutter/material.dart';
import 'package:app_customizer_case/screens/case_selection_screen.dart';
import 'package:app_customizer_case/widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Case Customizer'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Design Your Perfect Case',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Create a unique phone case with your favorite images',
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
                      title: 'Select Case',
                      description: 'Choose from various case models',
                      icon: Icons.phone_android,
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
                      title: 'Recent Designs',
                      description: 'View your saved designs',
                      icon: Icons.history,
                      onTap: () {
                        // Navigate to recent designs
                      },
                    ),
                    FeatureCard(
                      title: 'Gallery',
                      description: 'Browse community designs',
                      icon: Icons.collections,
                      onTap: () {
                        // Navigate to gallery
                      },
                    ),
                    FeatureCard(
                      title: 'Settings',
                      description: 'Customize app preferences',
                      icon: Icons.settings,
                      onTap: () {
                        // Navigate to settings
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