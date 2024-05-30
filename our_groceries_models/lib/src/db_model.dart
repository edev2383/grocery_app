import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_resources/our_groceries_resources.dart';

abstract class DbModel extends Mappable {
  int? id;
  final String table;

  /// [source] allows our records to be tagged with their origin
  /// so that test data can be easily distinguished from production
  /// data.
  int? source = Globals.sourceUnitTests;
  DbModel(this.table, {this.id});
}
