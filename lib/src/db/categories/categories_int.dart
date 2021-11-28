import 'package:dart_grpc_project/dart_grpc_project.dart';

abstract class ICategoriesServices {
  factory ICategoriesServices() => CategoriesServices();

  Category? getCategoryByName(String name);
  Category? getCategoryById (int id);
  Category? createCategory(Category category);
  Category? editCategory(Category category);
  Empty? deleteCategory(Category category);
  List<Category> getAllCategories();

}


final categoryServices = ICategoriesServices();