import 'dart:io';
import 'case_model.dart';

class CartItem {
  final CaseModel caseModel;
  final File? localImage;
  final String? networkImageUrl;

  CartItem({
    required this.caseModel,
    this.localImage,
    this.networkImageUrl,
  });
}
