import 'package:flutter_test/flutter_test.dart';
import 'package:our_groceries_data/our_groceries_data.dart';
import 'package:our_groceries_models/our_groceries_models.dart';
import 'package:our_groceries_test_suite/src/mocks/mock_lib.dart';

void main() {
  test('adds one to input values', () async {
    var randomName = randomWords(2);

    var context = await Context.create();

    var repo = UserRepo(context: context);
    var user = User(name: randomName, email: 'testemail@email.com');
    repo.insert(user);

    var users = await repo.query();
    var foundUser = users.firstWhere((u) => u.name == randomName);

    expect(foundUser, isNotNull);
  });
}
