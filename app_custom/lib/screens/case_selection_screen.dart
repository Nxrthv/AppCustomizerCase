import 'package:flutter/material.dart';
import 'package:app_custom/models/case_model.dart';
import 'package:app_custom/screens/customization_phone_screen.dart';
import 'package:app_custom/widgets/case_card.dart';

class CaseSelectionScreen extends StatelessWidget {
  const CaseSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Cards de modelos
    final List<CaseModel> caseModels = [
      CaseModel(
        name: 'iPhone 14 Pro Max',
        imagePath: 'assets/models/iphone-14-pro.png',
        imageCase: 'assets/cases/Iphone-14-pro-max.png',
        description: 'Funda de goma para el iPhone 14 Pro Max',
        price: 25.00,
      ),
      CaseModel(
        name: 'Samsung S23 Ultra',
        imagePath: 'assets/models/samsung-s23-ultra.jpg',
        imageCase: 'assets/cases/samsung-s23-ultra.png',
        description: 'Funda de plastico rigido para el Samsung S23 Ultra',
        price: 25.00,
      ),
      CaseModel(
        name: 'Google Pixel 7A',
        imagePath: 'assets/models/google-pixel-7.jpg',
        imageCase: 'assets/cases/Google-pixel-7A.png',
        description: 'Funda de goma el Google Pixel 7A',
        price: 20.00,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Escoge tu modelo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecciona tu modelo de funda',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Elige entre todos estos modelos',
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