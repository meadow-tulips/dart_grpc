import 'package:dart_grpc_project/dart_grpc_project.dart';
import 'package:grpc/grpc.dart';

class GroceriesServices extends GroceriesServiceBase {
  @override
  Future<Category> createCategory(call, Category request) async => categoryServices.createCategory(request);

  @override
  Future<Item> createItem(call, Item request) {
    // TODO: implement createItem
    throw UnimplementedError();
  }

  @override
  Future<Empty> deleteCategory(call, Category request) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<Empty> deleteItem(call, Item request) {
    // TODO: implement deleteItem
    throw UnimplementedError();
  }

  @override
  Future<Category> editCategory(call, Category request) {
    // TODO: implement editCategory
    throw UnimplementedError();
  }

  @override
  Future<Item> editItem(call, Item request) {
    // TODO: implement editItem
    throw UnimplementedError();
  }

  @override
  Future<Categories> getAllCategories(call, Empty request) async {
    return Categories()..categories.addAll(categoryServices.getCategories());

  }

  @override
  Future<Items> getAllItems(call, Empty request) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<Category> getCategory(call, Category request) async => categoryServices.getCategoryByName(request.name);

  @override
  Future<Item> getItem(call, Item request) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<AllItemsOfCategory> getItemsByCategory(call, Category request) {
    // TODO: implement getItemsByCategory
    throw UnimplementedError();
  }

}


Future<void> main() async {
  final server = Server([GroceriesServices()], const <Interceptor>[], 
  CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]));

  await server.serve(port: 50000);
  print('Server listening on port ${server.port}');
}