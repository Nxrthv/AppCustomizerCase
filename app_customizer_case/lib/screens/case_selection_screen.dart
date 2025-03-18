import 'package:flutter/material.dart';
import 'package:app_customizer_case/models/case_model.dart';
import 'package:app_customizer_case/screens/customization_screen.dart';
import 'package:app_customizer_case/widgets/case_card.dart';

class CaseSelectionScreen extends StatelessWidget {
  const CaseSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample case models
    final List<CaseModel> caseModels = [
      CaseModel(
        id: '1',
        name: 'iPhone 14 Pro',
        imageUrl: 'assets/cases/iphone_14_pro.png',
        description: 'Slim case for iPhone 14 Pro',
      ),
      CaseModel(
        id: '2',
        name: 'iPhone 13',
        imageUrl: 'assets/cases/iphone_13.png',
        description: 'Durable case for iPhone 13',
      ),
      CaseModel(
        id: '3',
        name: 'Samsung Galaxy S23 Ultra',
        imageUrl: 'assets/cases/samsung-s23-ultra.png',
        description: 'Premium case for Samsung Galaxy S23',
      ),
      CaseModel(
        id: '4',
        name: 'Google Pixel 7',
        imageUrl: 'assets/cases/pixel_7.png',
        description: 'Protective case for Google Pixel 7',
      ),
      CaseModel(
        id: '5',
        name: 'Samsung Galaxy S22 Ultra',
        imageUrl: 'assets/cases/samsung_s22_ultra.png',
        description: 'Ultra-protective case for S22 Ultra',
      ),
      CaseModel(
        id: '6',
        name: 'iPhone 14',
        imageUrl: 'assets/cases/iphone_14.png',
        description: 'Stylish case for iPhone 14',
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

