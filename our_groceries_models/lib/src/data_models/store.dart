import 'package:our_groceries_models/src/data_models/db_model.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class Store extends DbModel {
  final String? name;

  Store({
    super.id,
    this.name,
  }) : super(Globals.storesTable);

  @override
  fromMap(Map<String, dynamic> json) {
    var ret = Store(id: json['id'], name: json['name']);
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
