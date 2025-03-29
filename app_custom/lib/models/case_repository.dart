import 'package:app_custom/models/case_model.dart';

class CaseRepository {
  static final List<CaseModel> _cases = [];

  static List<CaseModel> get cases => _cases;

  static void addCase(CaseModel model) {
    _cases.add(model);
  }

  static void clear() {
    _cases.clear();
  }
}