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

  test('adds one to input values', () async {
// Initialize FFI
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    var randomName = randomWordPair();

    var context = await Context.create();

    var repo = UserRepo(context: context);
    var user = User(name: randomName, email: 'testemail@email.com');
    repo.insert(user);

    var users = await repo.query();
    var foundUser = users.firstWhere((u) => u.name == randomName);

    expect(foundUser, isNotNull);
  });
}
