import 'item.dart';

class GroceryList {
  final int? id;
  final String? name;
  DateTime? scheduledDate;
  DateTime? createdDate;
  final List<Item> items = [];

  GroceryList({
    this.id,
    this.name,
    this.scheduledDate,
    this.createdDate,
  });

  factory GroceryList.fromJson(Map<String, dynamic> json) {
    return GroceryList(
      id: json['id'],
      name: json['name'],
      scheduledDate: json['scheduledDate'],
      createdDate: json['createdDate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'scheduledDate': scheduledDate,
      'createdDate': createdDate,
    };
  }
}
