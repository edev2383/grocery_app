import 'package:flutter/material.dart';
import 'package:our_groceries_models/our_groceries_models.dart';

class ItemDetails extends StatefulWidget {
  final Item item;
  const ItemDetails({super.key, required this.item});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    return const Text('ItemDetails');
  }
}
