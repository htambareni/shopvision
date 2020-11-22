import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_vision/config/size_config.dart';
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
  double _height;
  double _width;

  List<int> array = [10, 20, 30, 40, 50, 60, 70, 80, 90, 100];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    this._height = SizeConfig.screenHeight;
    this._width = SizeConfig.screenWidth;

    return Scaffold(
        body: FutureBuilder<Object>(
            future: null,
            builder: (context, snapshot) {
              return CustomScrollView(
                slivers: [
                  ListHeader(),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => GroceryCard(
                              score: array[index],
                              address: "Some address",
                              occupancy: 20,
                              name: "Publix",
                            ),
                        childCount: 10),
                  )
                ],
                semanticChildCount: 10,
              );
            }));
  }
}
