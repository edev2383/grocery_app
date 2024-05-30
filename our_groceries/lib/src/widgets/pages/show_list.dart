import 'package:flutter/material.dart';
import 'package:our_groceries/src/resources/globals.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

class ShowList extends StatefulWidget {
  final GroceryList list;
  const ShowList({super.key, required this.list});

  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.list.name ?? 'No name'),
      ),
      body: ListView(children: [
        for (var item in widget.list.items)
          ListTile(
            title: Text(item.name ?? 'No name'),
            onTap: () {
              Navigator.pushNamed(
                context,
                Globals.routeItemDetails,
                arguments: item,
              );
            },
          ),
        ListTile(
          title: const Text('Add new item'),
          onTap: () {
            Navigator.pushNamed(context, Globals.routeAddItemToDatabase);
          },
        ),
      ]),
    );
  }
}
