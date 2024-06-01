import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class ItemType extends DbModel {
  final String? name;
  final int? itemCateogryId;

  ItemType({
    super.id,
    this.name,
    this.itemCateogryId,
  }) : super(Globals.itemTypeTable);

  @override
  ItemType fromMap(Map<String, dynamic> json) {
    var ret = ItemType(
      id: json['id'],
      name: json['name'],
      itemCateogryId: json['itemCateogryId'],
    );

    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'itemCateogryId': itemCateogryId,
      'source': source,
    };
  }
}
