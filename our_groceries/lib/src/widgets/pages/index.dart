import 'package:flutter/material.dart';
import 'package:our_groceries/src/mocks/mock_grocery_list.dart';
import 'package:our_groceries/src/models/grocery_list.dart';
import 'package:our_groceries/src/resources/globals.dart';
import 'package:our_groceries/src/services/navigation_service.dart';
import 'package:our_groceries/src/start_up/locator.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    var testList = <GroceryList>[];
    testList.add(MockGroceryList.random());
    testList.add(MockGroceryList.random());
    testList.add(MockGroceryList.random());
    testList.add(MockGroceryList.random());
    return Scaffold(
      body: ListView(children: [
        for (var list in testList)
          ListTile(
            title: Text(list.name ?? 'No name'),
            onTap: () {
              locator<NavigationService>()
                  .navigateTo(Globals.routeGroceryList, arguments: list);
            },
          ),
        ListTile(
          title: const Text('Add new list'),
          onTap: () {
            Navigator.pushNamed(context, Globals.routeAddGroceryList);
          },
        ),
      ]),
    );
  }
}
