import 'package:flutter/material.dart';
import 'package:app_customizer_case/models/case_model.dart';
import 'package:app_customizer_case/screens/customization_phone_screen.dart';
import 'package:app_customizer_case/widgets/case_card.dart';

class CaseSelectionScreen extends StatelessWidget {
  const CaseSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample case models
    final List<CaseModel> caseModels = [
      CaseModel(
        name: 'iPhone 14 Pro',
        imagePath: 'assets/models/iphone-14-pro.png',
        description: 'Slim case for iPhone 14 Pro',
      ),
      CaseModel(
        name: 'iPhone 13',
        imagePath: 'assets/models/iphone-13.webp',
        description: 'Durable case for iPhone 13',
      ),
      CaseModel(
        name: 'Samsung Galaxy S23 Ultra',
        imagePath: 'assets/models/samsung-s23-ultra.webp',
        description: 'Premium case for Samsung Galaxy S23',
      ),
      CaseModel(
        name: 'Google Pixel 7',
        imagePath: 'assets/models/google-pixel-7.webp',
        description: 'Protective case for Google Pixel 7',
      ),
      CaseModel(
        name: 'Samsung Galaxy S22 Ultra',
        imagePath: 'assets/models/samsung-s22-ultra.webp',
        description: 'Ultra-protective case for S22 Ultra',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Case Model'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Your Case',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Select a phone model to customize',
              style: Theme.of(context).textTheme.bodyLarge,
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
                itemCount: caseModels.length,
                itemBuilder: (context, index) {
                  return CaseCard(
                    caseModel: caseModels[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomizationScreen(
                            caseModel: caseModels[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

