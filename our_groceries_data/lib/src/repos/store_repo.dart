import 'package:our_groceries_data/src/repos/repo.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

class StoreRepo extends Repo<Store> {
  StoreRepo({required super.context}) : super(Store());
}
