import 'package:flutter_test/flutter_test.dart';
import 'package:our_groceries_data/our_groceries_data.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

void main() {
  test('Testing the output from the QueryBuilder', () {
    var q = Query(null, User()).where('name', '=', value: 'John');
    var qb = QueryBuilder(q);
    expect(qb.buildWhere(), 'name = ?');
    expect(qb.buildArgs(), ['John']);
  });

  test('Testing the output from the QueryBuilder with an OR', () {
    var q = Query(null, User())
        .where('name', '=', value: 'John')
        .orWhere('name', '=', value: 'Jane');
    var qb = QueryBuilder(q);
    expect(qb.buildWhere(), 'name = ? OR name = ?');
    expect(qb.buildArgs(), ['John', 'Jane']);
  });

  test(
      'Testing the output from the QueryBuilder, using the implicit `=` operator',
      () {
    var q = Query(null, User());
    q.where('name', 'John');
    var qb = QueryBuilder(q);
    expect(qb.buildWhere(), 'name = ?');
    expect(qb.buildArgs(), ['John']);
  });

  test('Testing the output from the QueryBuilder with a limit', () {
    var q = Query(null, User());
    q.where('name', '=', value: 'John').limit(1);
    var qb = QueryBuilder(q);
    expect(qb.limit(), 1);
  });

  test('Testing the output from the QueryBuilder with a limit and offset', () {
    var q = Query(null, User());
    q.where('name', '=', value: 'John').limit(1).offset(1);
    var qb = QueryBuilder(q);
    expect(qb.limit(), 1);
    expect(qb.offset(), 1);
  });

  test('Testing the output from the QueryBuilder with a groupBy', () {
    var q =
        Query(null, User()).where('name', '=', value: 'John').groupBy('name');
    var qb = QueryBuilder(q);
    expect(qb.groupBy(), 'name');
  });
}
