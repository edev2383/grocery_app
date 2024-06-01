import 'package:our_groceries_models/src/data_models/db_model.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

class ListSequence extends DbModel {
  final int? listId;
  final int? sequence;

  ListSequence({
    this.listId,
    this.sequence,
  }) : super(Globals.listSequenceTable);

  @override
  ListSequence fromMap(Map<String, dynamic> json) {
    var ret = ListSequence(
      listId: json['list_id'],
      sequence: json['sequence'],
    );

    ret.source = json['source'];
    return ret;
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'list_id': listId,
      'sequence': sequence,
      'source': source,
    };
  }
}
