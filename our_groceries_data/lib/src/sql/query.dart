import 'package:our_groceries_data/our_groceries_data.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

/// Query class for modeling SQL queries. This class will be
/// sent to the [Context] class for execution, and the [QueryBuilder]
/// will perform the necessary SQL building.
class Query<T extends DbModel> {
  final Context? context;
  final List<QWhere> wheres = [];
  final T model;

  int? qLimit;
  int? qOffset;

  List<Couple<String, String>> orderBy = [];

  List<String?> grouping = [];

  bool? distinct;

  Query(this.context, this.model);

  factory Query.create({required context, required model}) {
    return Query(context, model);
  }

  Query<T> where(dynamic column, dynamic operatorOrValue, {dynamic value}) {
    wheres.add(QWhere(column, operatorOrValue, value: value, and: true));
    return this;
  }

  Query<T> orWhere(dynamic column, dynamic operatorOrValue, {dynamic value}) {
    wheres.add(QWhere(column, operatorOrValue, value: value, and: false));
    return this;
  }

  Query<T> limit(int limit) {
    qLimit = limit;
    return this;
  }

  Query<T> offset(int offset) {
    qOffset = offset;
    return this;
  }

  Query<T> latest({String? column}) {
    orderBy.add(Couple(column ?? model.identifier, 'DESC'));
    return this;
  }

  Query<T> oldest({String? column}) {
    orderBy.add(Couple(column ?? model.identifier, 'ASC'));
    return this;
  }

  Query<T> groupBy(String column) {
    grouping.add(column);
    return this;
  }

  Future<List<T>> get({dynamic columns = '*'}) async {
    var results = await context!.queryWhere(model, this, columns);
    return _mapResults(results);
  }

  Future<T?> first({dynamic columns = '*'}) async {
    var results = await context!.queryWhere(model, this, columns);
    if (results.isEmpty) {
      return null;
    }
    return model.fromMap(results.first);
  }

  Future<List<T>> _mapResults(List<Map<String, dynamic>> results) async {
    var ret = <T>[];
    for (var e in results) {
      ret.add(model.fromMap(e));
    }
    return ret;
  }
}

class QWhere {
  final dynamic column;
  final dynamic operatorOrValue;
  final dynamic value;
  final bool and;

  late String op;
  late dynamic _value;

  final List<String> operators = ['=', '!=', '>', '>=', '<', '<=', 'LIKE', 'IN', 'BETWEEN', 'IS', 'IS NOT'];
  QWhere(this.column, this.operatorOrValue, {this.value, this.and = true}) {
    if (!validateOperatorOrValue(operatorOrValue)) {
      op = '=';
      _value = operatorOrValue;
    } else {
      if (value == null) {
        throw Exception('Value cannot be null when operator is provided.');
      }
      op = operatorOrValue;
      _value = value;
    }
  }

  bool validateOperatorOrValue(dynamic operatorOrValue) {
    if (operatorOrValue is String) {
      if (operators.contains(operatorOrValue)) {
        return true;
      }
    }
    return false;
  }

  dynamic getValue() => _value;
}
