import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class ListItemRel extends DbModel {
  final int? listId;
  final int? itemId;
  final int? sequence;

  ListItemRel({
    this.listId,
    this.itemId,
    this.sequence,
  }) : super(Globals.listItemRelTable);

  @override
  ListItemRel fromMap(Map<String, dynamic> json) {
    var ret = ListItemRel(
      listId: json['list_id'],
      itemId: json['item_id'],
      sequence: json['sequence'],
    );

    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'list_id': listId,
      'item_id': itemId,
      'sequence': sequence,
      'source': source,
    };
  }
}
