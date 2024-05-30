import 'package:our_groceries_models/src/db_model.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class User extends DbModel {
  final String? name;
  final String? email;

  User({
    super.id,
    this.name,
    this.email,
  }) : super(Globals.usersTable);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }

  @override
  User fromMap(Map<String, dynamic> json) {
    return User.fromJson(json);
  }
}
