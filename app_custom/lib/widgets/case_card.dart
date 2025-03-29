import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app_custom/models/case_model.dart';

class CaseCard extends StatelessWidget {
  final CaseModel caseModel;
  final VoidCallback onTap;

  const CaseCard({
    super.key,
    required this.caseModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: caseModel.imagePath.startsWith('/data/')
                  ? Image.file(
                      File(caseModel.imagePath),
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
                    )
                  : Image.asset(
                      caseModel.imagePath,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
                    ),
              ),
              ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caseModel.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    caseModel.description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    caseModel.price.toStringAsFixed(2),
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _errorPlaceholder() {
  return Container(
    color: Colors.grey[200],
    child: const Center(
      child: Icon(
        Icons.broken_image,
        size: 100,
        color: Colors.grey,
      ),
    ),
  );
}
