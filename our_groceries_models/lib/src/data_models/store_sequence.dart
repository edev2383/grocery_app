import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class StoreSequence extends DbModel {
  final int? storeId;
  final int? sequence;

  StoreSequence({
    this.storeId,
    this.sequence,
  }) : super(Globals.storeSequenceTable);

  @override
  StoreSequence fromMap(Map<String, dynamic> json) {
    var ret = StoreSequence(
      storeId: json['store_id'],
      sequence: json['sequence'],
    );

    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'store_id': storeId,
      'sequence': sequence,
      'source': source,
    };
  }
}
