import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          "Shop Vision",
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        background: Image(
          image: NetworkImage(
              "https://www.freevector.com/uploads/vector/preview/29714/Grocery-Store.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
