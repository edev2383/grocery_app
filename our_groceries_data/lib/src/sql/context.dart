import 'package:our_groceries_data/src/sql/query.dart';
import 'package:our_groceries_data/src/sql/query_builder.dart';
import 'package:our_groceries_data/src/sql/sql_service.dart';
import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:sqflite/sqflite.dart';

class Context {
  late Database _db;

  Context._create();

  Future<void> init() async {
    _db = await SqlService().initialize();
  }

  static Future<Context> create() async {
    var context = Context._create();
    await context.init();
    return context;
  }

  Future<int> insert(DbModel model) async {
    return await _db.insert(model.table, model.toMap());
  }

  Future<int> updateItem(DbModel model) async {
    return await _db.update(model.table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);
  }

  Future<int> deleteItem(DbModel model) async {
    return await _db.delete(model.table, where: 'id = ?', whereArgs: [model.id]);
  }

  Future<List<Map<String, dynamic>>> query(DbModel model) async {
    return await _db.query(model.table);
  }

  Future<List<Map<String, dynamic>>> queryWhere(DbModel model, Query query, dynamic columns) async {
    var qb = QueryBuilder(query);
    return await _db.query(
      qb.table,
      where: qb.buildWhere(),
      whereArgs: qb.buildArgs(),
      orderBy: qb.orderBy(),
      columns: qb.columns(columns),
      limit: qb.limit(),
      offset: qb.offset(),
      groupBy: qb.groupBy(),
    );
  }
}
