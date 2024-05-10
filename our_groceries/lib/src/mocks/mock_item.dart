import 'package:our_groceries/src/models/helpers/e_item_type.dart';
import 'package:our_groceries/src/models/item.dart';

class MockItem extends Item {
  MockItem({String? name}) : super(name: name);

  factory MockItem.random() {
    var ret = MockItem(name: 'Test Item ${DateTime.now().toString()}');
    ret.description = 'Test Description';
    // ret.imageUrl = 'https://picsum.photos/200/300';
    ret.price = 10.0;
    ret.quantity = 1;
    ret.type = EItemType.unknown;
    return ret;
  }
}
