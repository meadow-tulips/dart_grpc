import 'dart:io';
import 'dart:math';
import 'package:grpc/grpc.dart';
import 'package:dart_grpc_project/dart_grpc_project.dart';

class Client {

  late ClientChannel channel;
  late GroceriesServiceClient stub;
  var response;
  bool executionInProcess = true;

  Future<void> main() async {
    channel = ClientChannel('localhost', port: 50000, options: const ChannelOptions( credentials: ChannelCredentials.insecure()));
    stub = GroceriesServiceClient(channel, options: CallOptions(timeout: Duration(seconds: 30)));
    while(executionInProcess) {
      try {
        print("___ Welcome to the dart store API _____");
        print("___Choose your operation ? ___");
        print("1: View all products");
        print("2: Add new product");
        print("3: Edit product");
        print("4: Get Product");
        print("5: Delete product \n");
        print("6: View all Categories");
        print("7: Add new category");
        print("8: Edit category");
        print("9: Get category");
        print("10: Delete category \n");
        print("11: Get all products of given category");

        var option = int.parse(stdin.readLineSync() ?? '');

        switch(option) {
          case 1:
            break;
          case 2: 
            break;
          case 6:
            response = await stub.getAllCategories(Empty());
            print("--- STORE PRODUCT CATEGORIES ARE:");
            response.categories.forEach((category) {
              print("${category.name} - ${category.id}");
            });
            break;
          case 7:
            print("Enter Category name");
            var name = stdin.readLineSync();
            var category = await _findCategoryByName(name ?? '');
            if(category.id != 0) {
              print("category already exists: category ${category.id} ${category.name}");
            } else {
              category = Category()..id = Random(999).nextInt(9999)
              ..name = name ?? '';
              response = await stub.createCategory(category);
              print("category created: category ${category.id} ${category.name}");
            }
            break;
          case 9:
            print('Enter category name');
            var categoryName = stdin.readLineSync();
            var category = await _findCategoryByName(categoryName ?? '');
            if(category.id != 0) {
              print('Category found : ${category.name} - ${category.id}');
            } else {
              print('Category not found');
            }
          break;
          default: 
            print("Invalid option");
        }

      } catch(e) {
        print(e);
      }


      print('Do you wish to exit the store ? (Y/n)');
      var result = stdin.readLineSync() ?? 'y';
      executionInProcess = result.toLowerCase() != 'y'; 
    }


    await channel.shutdown();
  }

  Future<Category> _findCategoryByName(String name) async {
    var category = Category()..name = name;
    category = await stub.getCategory(category);
    return category;
  }

  Future<Item> _findItemByName(String name) async {
    var item = Item()..name = name;
    item = await stub.getItem(item);
    return item;
  }
  

  int _randomId() => Random(1000).nextInt(9999);


}

void main() {

  var client = Client();
  client.main();

}
