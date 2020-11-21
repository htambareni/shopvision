import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_vision/view/list_header.dart';

import 'grocery_card.dart';

class GroceryStoreList extends StatefulWidget {
  GroceryStoreList({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GroceryStoreListState();
}

/// This class keeps track of the nearby grocery stores.
/// The Azure Maps Api is used to get the list of nearby grocery stores based on entered
/// location.
///
/// @author Aditya Varun Pratap
/// @version 1.0
class _GroceryStoreListState extends State<GroceryStoreList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        ListHeader(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => GroceryCard(),
              childCount: 10),
        )
      ],
      semanticChildCount: 10,
    ));
  }
}
