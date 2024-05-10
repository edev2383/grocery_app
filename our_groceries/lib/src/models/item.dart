import 'package:our_groceries/src/models/helpers/e_item_type.dart';

class Item {
  final int? id;
  final String? name;
  String? plu;
  String? description;
  String? imageUrl;
  double? price;
  int? quantity;
  EItemType? type;

  Item({
    this.id,
    this.name,
  });
}
