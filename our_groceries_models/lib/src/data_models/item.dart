import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class Item extends DbModel {
  final String? name;
  String? plu;
  String? description;
  EItemType? type;
  EItemCategory? category;

  Item({
    super.id,
    this.name,
    this.plu,
    this.description,
    this.type,
    this.category,
  }) : super(Globals.itemsTable);

  @override
  Item fromMap(Map<String, dynamic> json) {
    var ret = Item(
      id: json['id'],
      name: json['name'],
      plu: json['plu'],
      description: json['description'],
      type: EItemType.values[json['type']],
      category: EItemCategory.values[json['category']],
    );
    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'plu': plu,
      'description': description,
      'type': type?.index,
      'category': category?.index,
      'source': source,
    };
  }
}
