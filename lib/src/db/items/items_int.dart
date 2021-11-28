import 'package:dart_grpc_project/dart_grpc_project.dart';

abstract class IItemsServices {
  factory IItemsServices() => ItemsServices();
  Item getItemByName(String name);
  Item getItemById(int id);
  

  Item createItem(Item item);
  Item editItem(Item item);
  Empty deleteItem(Item item);
  List<Item> getAllItems();
  List<Item> getAllItemsByCategory(int categoryId);
}

final itemsServices = IItemsServices();