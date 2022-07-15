import 'package:flutter/cupertino.dart';

import '../category_withoutProvider/category_model.dart';
import 'http_category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Getcategory>? categoryList = [];
  bool isLoading = false;
  getCategoryProvider() async {
    isLoading = true;
    final data = await ApiDataService().getCategoriesService();
    categoryList = data.getcategory!;
    print(categoryList!.length);
    isLoading = false;
    notifyListeners();
  }
}
