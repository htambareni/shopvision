import 'package:flutter/material.dart';
import 'package:shop_vision/view/grocery_list.dart';
import 'package:shop_vision/view/store_detail.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final _args = settings.arguments as Map;

    // settings.name contains the name(path) of the route.
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => GroceryStoreList());

      case '/details':
        return MaterialPageRoute(
            builder: (_) => StoreDetails(
                  name: _args['name'],
                ));

      default:
        return null;
    }
  }
}
