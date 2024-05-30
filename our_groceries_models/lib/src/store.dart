import 'package:our_groceries_models/src/db_model.dart';

class Store extends DbModel {
  final String? name;

  Store({
    super.id,
    this.name,
  }) : super('stores');

  @override
  fromMap(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
