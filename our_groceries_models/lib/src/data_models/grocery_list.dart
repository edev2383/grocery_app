import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class GroceryList extends DbModel {
  final String? name;
  DateTime? scheduledDate;
  DateTime? createdDate;
  final List<Item> items = [];

  GroceryList({
    super.id,
    this.name,
    this.scheduledDate,
    this.createdDate,
  }) : super(Globals.listsTable);

  @override
  GroceryList fromMap(Map<String, dynamic> json) {
    var ret = GroceryList(
      id: json['id'],
      name: json['name'],
      scheduledDate: json['scheduledDate'],
      createdDate: json['createdDate'],
    );
    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'scheduledDate': scheduledDate,
      'createdDate': createdDate,
      'source': source,
    };
  }
}
