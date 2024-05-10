import 'package:our_groceries/src/models/item.dart';

class GroceryList {
  final int? id;
  final String? name;
  final List<Item> items = [];
  DateTime? scheduledDate;
  DateTime? createdDate;

  GroceryList({
    this.id,
    this.name,
    this.scheduledDate,
  });
}
