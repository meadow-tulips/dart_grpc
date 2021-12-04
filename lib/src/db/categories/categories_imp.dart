import 'package:dart_grpc_project/dart_grpc_project.dart';

class CategoriesServices implements ICategoriesServices {
  @override
  Category getCategoryByName(String name) {
    var result = categories.where((element) => element['name'] == name).toList();
    if(result.isEmpty) {
      return Category();
    } else {
      return utilities.getCategoryFromMap(result.first);
    }

  }
  @override
  Category getCategoryById (int id) {
    var result = categories.where((element) => element['name'] == id).toList();
    if(result.isEmpty) {
      return Category();
    } else {
      return utilities.getCategoryFromMap(result.first);
    }
  }
  @override
  Category createCategory(Category category) {
    categories.add({ 'id': category.id, 'name': category.name });
    return category;
  }
  @override
  Category editCategory(Category category) {
    return Category();
  }
  @override
  Empty deleteCategory(Category category) {
    return Empty();
  }
  @override
  List<Category> getCategories() {
    return categories.map((category) {
      return utilities.getCategoryFromMap(category);
    }).toList();
  }

}