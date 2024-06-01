import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class StoreItemRel extends DbModel {
  final int? storeId;
  final int? itemId;
  final int? sequence;

  StoreItemRel({
    this.storeId,
    this.itemId,
    this.sequence,
  }) : super(Globals.storeItemRelTable);

  @override
  StoreItemRel fromMap(Map<String, dynamic> json) {
    var ret = StoreItemRel(
      storeId: json['store_id'],
      itemId: json['item_id'],
      sequence: json['sequence'],
    );

    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'store_id': storeId,
      'item_id': itemId,
      'sequence': sequence,
      'source': source,
    };
  }
}
