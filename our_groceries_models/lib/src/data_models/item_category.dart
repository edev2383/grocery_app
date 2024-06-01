import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class ItemCategory extends DbModel {
  final String? name;

  ItemCategory({
    super.id,
    this.name,
  }) : super(Globals.itemCategoryTable);

  @override
  ItemCategory fromMap(Map<String, dynamic> json) {
    var ret = ItemCategory(
      id: json['id'],
      name: json['name'],
    );

    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'source': source,
    };
  }
}
