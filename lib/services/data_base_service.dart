import 'package:hive/hive.dart';
import 'package:preguntas_incomodas/models/preguntas_model.dart';

class DataBase {

  static final DataBase db = DataBase._();
  DataBase._();

  Future<void> createItem(Box<dynamic> box, Pregunta newItem) async {
    await box.add(newItem);
  }

  Pregunta? readItem(Box<dynamic> box, int key) {
    final item = box.get(key);
    return item;
  }

  bool containItem(Box<dynamic> box, int key){
    return box.containsKey(key);
  }

  Future<void> updateItem(Box<dynamic> box, int itemKey, Pregunta item) async {
    await box.put(itemKey, item);
    //_refreshItems(); // Update the UI
  }

  Future<void> deleteItem(Box<dynamic> box, int itemKey) async {
    await box.delete(itemKey);
    //_refreshItems(); // update the UI

    // Display a snackbar
    // ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('An item has been deleted')));
  }

  // void _refreshItems() {
  //   final data = _shoppingBox.keys.map((key) {
  //     final value = _shoppingBox.get(key);
  //     return {"key": key, "name": value["name"], "quantity": value['quantity']};
  //   }).toList();

  //   setState(() {
  //     _items = data.reversed.toList();
  //     // we use "reversed" to sort items in order from the latest to the oldest
  //   });
  // }

}