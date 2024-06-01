import 'package:our_groceries_models/src/data_models/db_model.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class User extends DbModel {
  final String? name;
  final String? email;

  User({
    super.id,
    this.name,
    this.email,
  }) : super(Globals.usersTable);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'source': source,
    };
  }

  @override
  User fromMap(Map<String, dynamic> json) {
    var ret = User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
    ret.source = json['source'];
    return ret;
  }
}
