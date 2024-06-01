import 'package:our_groceries_data/src/sql/query.dart';
import 'package:our_groceries_data/src/sql/context.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

/// The Repo class is a generic class that provides a set of methods for
/// interacting with the database. The class is designed to be extended by
/// other classes that represent a specific model in the database. The class
/// provides methods for inserting, updating, and deleting records, as well
/// as methods for querying the database.
///
/// SELECT QUERY INITIATION:
/// ------------------------------------------------------------------------
/// | Initiation of SELECT queries with the Repo class MUST BE followed by a
/// | .then() or await to resolve the future, but after that, the Query
/// | object can be chained with other query methods, until a .get() or
/// | .first() is called. Examples below.
/// ------------------------------------------------------------------------
/// ```dart
///   // Example 1: Get all users with email 'testemail@email.com'
///   var query = await UserRepo().where('email', '=', 'testemail@email.com')
///                     .then((q) => q.get());
///
///   // Example 2: Get the lastest users by id
///   var query = await UserRepo().latest().then((q) => q.get());
///
///   // Example 3: Get the oldest users by id
///   var query = await UserRepo().oldest().then((q) => q.get());
///
///   // Example 4: Get all records with using WHERE and OR. Note
///   // these where examples use the implicit '=' operator.
///   var query = await UserRepo().where('name', 'John').then((q) => q.orWhere('name', 'Jane').get());
///
///   // Example 5: Repo.get() and Repo.first() can be called without
///   // any chaining, as they do not require any additional query.
///   var allUsers = await UserRepo().get();
///   var firstUser = await UserRepo().first();
///
///   // Examplee 6: Non-standard operators can be used with the where
///   // method by providing the operator as the second parameter.
///   var query = await UserRepo().where('name', 'LIKE', value: '%John%').get();
///
/// ```
class Repo<T extends DbModel> {
  final T model;
  Repo(this.model);

  /// Insert a new record into the database
  Future<int> insert(T model) async {
    return await (await _newContext()).insert(model);
  }

  /// Update an existing record in the database
  Future<int> updateItem(T model) async {
    return await (await _newContext()).updateItem(model);
  }

  /// Delete an existing record from the database
  Future<int> deleteItem(T model) async {
    return await (await _newContext()).deleteItem(model);
  }

  /// Initiate a SELECT query with a WHERE clause. See [Repo] comments
  /// for details and examples of how to use the SELECT-initiation methods.
  ///
  /// The `column` parameter is the name of the column to filter on.
  /// The `operatorOrValue` parameter is either the operator to use in the
  /// WHERE clause, or the value to compare against. If the `operatorOrValue`
  /// parameter is an approved operator (see [QWhere.operators]), the `value`
  /// parameter must be provided. If the `operatorOrValue` parameter is a
  /// value, the `value` parameter is unnecessary and the operator defaults
  /// to '='.
  Future<Query<T>> where(dynamic column, dynamic operatorOrValue, {dynamic value, bool and = true}) async {
    return Query<T>(await _newContext(), model).where(column, operatorOrValue, value: value);
  }

  /// Initiate a SELECT query by most recent order by [column]. This defaults
  /// to the model's identifier column if no column is provided.
  ///
  ///
  Future<Query<T>> latest({String? column}) async {
    return Query<T>(await _newContext(), model).latest(column: column);
  }

  /// Initiate a SELECT query by oldest order by by [column]. This defaults
  /// to the model's identifier column if no column is provided.
  Future<Query<T>> oldest({String? column}) async {
    return Query<T>(await _newContext(), model).oldest(column: column);
  }

  /// Get all records from the database. The `columns` parameter is optional
  /// and defaults to all columns, but can be used to specify a subset of
  /// columns to return.
  Future<List<T>> get({dynamic columns = '*'}) async {
    return Query<T>(await _newContext(), model).get(columns: columns);
  }

  /// Get the first record from the database. The `columns` parameter is
  /// optiona and defaults to all columns, but can be used to specify a subset
  /// of columns to return.
  Future<T?> first({dynamic columns = '*'}) async {
    return Query<T>(await _newContext(), model).first(columns: columns);
  }

  static Future<Context> _newContext() async {
    return await Context.create();
  }
}
