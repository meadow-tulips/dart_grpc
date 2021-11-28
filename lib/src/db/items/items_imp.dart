import 'package:dart_grpc_project/dart_grpc_project.dart';

class ItemsServices implements IItemsServices {
  @override
  Item getItemByName(String name) {
    return Item();
  }

  @override
  Item getItemById(int id) {
    return Item();
  }

  @override
  Item createItem(Item item) {
    return Item();
  }

  @override
  Item editItem(Item item) {
    return Item();
  }

  @override
  Empty deleteItem(Item item) {
    return Empty();
  }

  @override
  List<Item> getAllItems() {
    return [];
  }

  @override
  List<Item> getAllItemsByCategory(int categoryId) {
    return [];
  }
}
