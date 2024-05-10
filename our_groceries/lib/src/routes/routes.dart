import 'package:flutter/material.dart';
import 'package:our_groceries/src/models/grocery_list.dart';
import 'package:our_groceries/src/resources/globals.dart';
import 'package:our_groceries/src/widgets/pages/add_grocery_list.dart';
import 'package:our_groceries/src/widgets/pages/add_item_to_database.dart';
import 'package:our_groceries/src/widgets/pages/index.dart';
import 'package:our_groceries/src/widgets/pages/item_details.dart';
import 'package:our_groceries/src/widgets/pages/show_list.dart';

class Routes {
  /// provide the route to Main.dart
  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    Uri uri = Uri.parse(settings.name!);
    switch (uri.path) {
      case Globals.routeIndex:
        return MaterialPageRoute(builder: (_) => const Index());
      case Globals.routeAddItemToDatabase:
        return MaterialPageRoute(builder: (_) => const AddItemToDatabase());
      case Globals.routeGroceryList:
        return MaterialPageRoute(
            builder: (_) => ShowList(list: settings.arguments as GroceryList));
      case Globals.routeItemDetails:
        return MaterialPageRoute(builder: (_) => const ItemDetails());
      case Globals.routeAddGroceryList:
        return MaterialPageRoute(builder: (_) => const AddGroceryList());
      default:
        return MaterialPageRoute(builder: (_) => const Index());
    }
  }
}
