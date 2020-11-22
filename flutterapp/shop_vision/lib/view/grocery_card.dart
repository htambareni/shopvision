import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shop_vision/config/size_config.dart';

class GroceryCard extends StatelessWidget {
  double _width;
  double _height;
  int score;
  String name;
  int occupancy;
  String address;
  GroceryCard({this.score, this.name, this.occupancy, this.address});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    this._height = SizeConfig.screenHeight;
    this._width = SizeConfig.screenWidth;
    return GestureDetector(
      child: Padding(
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
          child: Container(
            child: Stack(
              children: [
                ClipRect(
                  child: Container(
                    color: Color(0xFF3D82AE),
                    height: 80,
                  ),
                ),
                _createProgressCircle(_height, _width, context, score),
                _showGroceryStoreName(name),
                _showOccupancyAndAddress(occupancy, address)
              ],
            ),
          ),
        ),
      ),
      onTap: () => Navigator.of(context)
          .pushNamed('/details', arguments: {'name': name}),
    );
  }

  static Widget _createProgressCircle(double screenHeight, double screenWidth,
      BuildContext context, int total) {
    // var userId = userModel.userId;
    // var userTransactionsSnapShot = _userViewModel.fetchUserTransaction(userId);
    // userModel.totalRecycled =
    //     getUserTotalItemCount(userTransactionsSnapShot).toInt();

    Color color;

    if (total <= 40) {
      color = Colors.red;
    } else if (total > 40 && total < 80) {
      color = Colors.yellow;
    } else {
      color = Colors.lightGreenAccent;
    }

    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        padding:
            EdgeInsets.only(left: .05 * screenWidth, top: .02 * screenHeight),
        child: CircularPercentIndicator(
          radius: .15 * screenWidth,
          lineWidth: screenWidth * .02,
          percent: (total / 100),
          //(userModel.totalRecycled / userModel.recycleGoal),
          circularStrokeCap: CircularStrokeCap.round,
          animation: true,
          animationDuration: 2500,
          progressColor: color,
          center: CustomPaint(
            child: Text(total.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
      ),
    );
  }

  Widget _showGroceryStoreName(String name) {
    return Padding(
      padding: EdgeInsets.only(top: .04 * _height),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          name,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: _width * .08),
        ),
      ),
    );
  }

  Widget _showOccupancyAndAddress(int occupancy, String address) {
    return Padding(
      padding: EdgeInsets.only(top: .14 * _height, left: .02 * _width),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          children: [
            FittedBox(
              child: Text(
                "Address: " + "2080 One White  Lane",
                maxLines: 1,
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w300,
                    fontSize: _width * .06),
              ),
            ),
            Text(
              "Current Occupancy: " + occupancy.toString(),
              maxLines: 1,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w300,
                  fontSize: _width * .06),
            ),
          ],
        ),
      ),
    );
  }
}
