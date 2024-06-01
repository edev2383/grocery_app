import 'package:flutter_test/flutter_test.dart';
import 'package:our_groceries_data/our_groceries_data.dart';
import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'mocks/mock_lib.dart';

void main() {
  test('test randomWords method from mock_lib.dart', () {
    var randomName = randomWordPair();
    expect(randomName, isNotNull);

    var randomName2 = randomWordPair();
    expect(randomName2, isNotNull);
    expect(randomName != randomName2, true);
  });

  test('Testing insert user and retrieve user', () async {
// Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var randomName = randomWordPair();

    var repo = UserRepo();
    var user = User(name: randomName, email: 'testemail@email.com');
    await repo.insert(user);

    var users = await repo.get();
    var foundUser = users.firstWhere((u) => u.name == randomName);

    expect(foundUser, isNotNull);
  });

  test('Testing repo query syntax', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var query = await UserRepo().where('email', "testemail@email.com").then((q) => q.where('id', 2).get());
    expect(query, isNotNull);
  });

  test('Testing UserRepo query `latest` orderby method', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var results = await UserRepo().latest().then((q) => q.get()); //.get();
    expect(results, isNotNull);

    var first = results.first;
    var last = results.last;

    expect(first.id! > last.id!, true);
  });

  test('Testing UserRepo query `oldest` orderby method', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var results = await UserRepo().oldest().then((q) => q.get());
    expect(results, isNotNull);

    var first = results.first;
    var last = results.last;

    expect(first.id! < last.id!, true);
  });

  test('Testing UserRepo query subset of columns in `get` method', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var results = await UserRepo().get(columns: ['name']);
    expect(results, isNotNull);

    var first = results.first;
    expect(first.id, isNull);
    expect(first.name, isNotNull);
    expect(first.email, isNull);
  });

  test('Testing UserRepo query `first` method', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var result = await UserRepo().first();
    expect(result, isNotNull);
  });

  test('Testing UserRepo with where clause and first method', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var result = await UserRepo().where('email', "testemail@email.com").then((q) => q.first());
    expect(result, isNotNull);
  });

  test('Testing UserRepo with `first` method and subset of columns', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var result = await UserRepo().first(columns: ['name']);
    expect(result, isNotNull);
    expect(result!.id, isNull);
    expect(result.name, isNotNull);
    expect(result.email, isNull);
  });

  test('Testing UserRepo using LIKE operator', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var results = await UserRepo().where('id', 'LIKE', value: '%2%').then((q) => q.get());

    expect(results, isNotNull);
  });

  test('Testing UserRepo using IN operator', () async {
    // Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var results = await UserRepo().where('id', 'IN', value: [1, 2]).then((q) => q.get());

    expect(results, isNotNull);
    expect(results.length, 2);
  });
}
