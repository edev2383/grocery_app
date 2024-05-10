import 'package:our_groceries/src/mocks/mock_item.dart';
import 'package:our_groceries/src/models/grocery_list.dart';

class MockGroceryList extends GroceryList {
  MockGroceryList({String? name}) : super(name: name);

  factory MockGroceryList.random() {
    var ret = MockGroceryList(name: 'Test List ${DateTime.now().toString()}');

    /// random number of items
    var numItems = (1 + DateTime.now().millisecond % 10).round();
    for (var i = 0; i < numItems; i++) {
      ret.items.add(MockItem.random());
    }
    return ret;
  }
}
