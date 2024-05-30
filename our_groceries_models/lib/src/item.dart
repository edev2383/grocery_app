import 'package:our_groceries_models/src/enums.dart';

class Item {
  final int? id;
  final String? name;
  String? plu;
  String? description;
  EItemType? type;
  EItemCategory? category;

  Item({
    this.id,
    this.name,
    this.plu,
    this.description,
    this.type,
    this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      plu: json['plu'],
      description: json['description'],
      type: EItemType.values[json['type']],
      category: EItemCategory.values[json['category']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'plu': plu,
      'description': description,
      'type': type?.index,
      'category': category?.index,
    };
  }
}
