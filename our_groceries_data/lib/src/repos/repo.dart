import 'package:our_groceries_data/src/sql/context.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

class Repo<T extends DbModel> {
  final T model;
  final Context context;
  Repo(this.model, {required this.context});

  Future<int> insert(T model) async {
    return await context.insert(model);
  }

  Future<int> updateItem(T model) async {
    return await context.updateItem(model);
  }

  Future<int> deleteItem(T model) async {
    return await context.deleteItem(model);
  }

  Future<List<T>> query() async {
    var results = await context.query(model);
    var ret = <T>[];
    for (var e in results) {
      ret.add(model.fromMap(e));
    }
    return ret;
  }
}
