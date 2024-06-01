import 'package:our_groceries_data/src/repos/repo.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

/// GroceryListRepo is a Repo for the [GroceryList] model.
///
/// See [Repo] class comments for full usage details and examples.
class GroceryListRepo extends Repo<GroceryList> {
  GroceryListRepo() : super(GroceryList());
}
