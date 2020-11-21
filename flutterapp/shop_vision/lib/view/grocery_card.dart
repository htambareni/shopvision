import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_vision/config/size_config.dart';

class GroceryCard extends StatelessWidget {
  double _width;
  double _height;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    this._height = SizeConfig.screenHeight;
    this._width = SizeConfig.screenWidth;
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.fromLTRB(
          _width * .03, _height * .02, _width * .03, _width * .005),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0), // shadow direction: bottom right
            )
          ],
        ),
        height: _height * .25,
        width: _width * .70,
        child: Center(child: Text("Hello")),
      ),
    );
  }
}
