import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class UserListRel extends DbModel {
  final int? userId;
  final int? listId;

  UserListRel({
    super.id,
    this.userId,
    this.listId,
  }) : super(Globals.userListRelTable);

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'list_id': listId,
      'source': source,
    };
  }

  @override
  UserListRel fromMap(Map<String, dynamic> json) {
    var ret = UserListRel(
      id: json['id'],
      userId: json['user_id'],
      listId: json['list_id'],
    );

    ret.source = json['source'];
    return ret;
  }
}
