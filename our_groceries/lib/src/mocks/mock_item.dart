import 'package:our_groceries_models/our_groceries_models.dart';

class MockItem extends Item {
  MockItem({String? name}) : super(name: name);

  factory MockItem.random() {
    var ret = MockItem(name: 'Test Item ${DateTime.now().toString()}');
    ret.description = 'Test Description';
    ret.type = EItemType.unknown;
    return ret;
  }
}
