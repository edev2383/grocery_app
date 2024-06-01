import 'package:our_groceries_data/src/sql/query.dart';

class QueryBuilder {
  final Query query;

  String get table => query.model.table;

  QueryBuilder(this.query);

  /// Build the where SQL statement for sqlite, replacing values w/ `?`
  String? buildWhere() {
    if (query.wheres.isEmpty) {
      return null;
    }
    var where = <String>[];
    for (var i = 0; i < query.wheres.length; i++) {
      var w = query.wheres[i];
      if (i > 0) {
        where.add(w.and ? 'AND' : 'OR');
      }

      var placeHolder = '?';

      switch (w.op.toLowerCase()) {
        case '=':
        case '!=':
        case '>':
        case '>=':
        case '<':
        case '<=':
        case 'like':
          break;
        case 'in':
          if (w.getValue() is! List) {
            throw Exception('IN operator requires a List');
          }
          placeHolder = '(${List.filled(w.getValue().length, '?').join(',')})';
          break;
        default:
          break;
      }

      where.add('${w.column} ${w.op} $placeHolder');
    }
    return where.join(' ');
  }

  List<dynamic>? buildArgs() {
    if (query.wheres.isEmpty) return null;
    var args = <dynamic>[];
    for (var where in query.wheres) {
      if (where.getValue() is List) {
        for (var v in where.getValue() as List) {
          args.add(v.toString());
        }
      } else {
        args.add(where.getValue().toString());
      }
    }
    return args;
  }

  int? limit() {
    return query.qLimit;
  }

  int? offset() {
    return query.qOffset;
  }

  bool? distinct() {
    return query.distinct;
  }

  String? orderBy() {
    if (query.orderBy.isEmpty) return null;
    return query.orderBy.map((e) => '${e.first} ${e.second}').join(',');
  }

  String? groupBy() {
    return query.grouping.isNotEmpty ? query.grouping.join(',') : null;
  }

  List<String>? columns(dynamic columns) {
    if (columns is List) {
      return columns.map((e) => e.toString()).toList();
    } else {
      if (columns == '*') {
        return null;
      } else {
        // Assume it's a single column
        return [columns.toString()];
      }
    }
  }
}
