import 'package:ainbondhu/data/models/category_model.dart';
import 'package:ainbondhu/data/services/category_service.dart';
import 'package:ainbondhu/providers/base_provider.dart';

class CategoryProvider extends BaseProvider {
  final CategoryService _service = CategoryService();
  List<Category> _categories = [];

  List<Category> get categories => _categories;

  Future<void> loadCategories() async {
    setState(ViewState.busy);
    try {
      _categories = await _service.getCategories();
      setState(ViewState.idle);
    } catch (e) {
      setError(e.toString());
    }
  }
}
