import 'package:our_groceries_data/src/repos/repo.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

/// UserRepo is a Repo for the [User] model.
///
/// See [Repo] class comments for full usage details and examples.
class UserRepo extends Repo<User> {
  UserRepo() : super(User());
}
