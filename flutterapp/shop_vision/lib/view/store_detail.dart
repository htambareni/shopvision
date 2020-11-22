import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_vision/config/size_config.dart';
import 'package:video_player/video_player.dart';

class StoreDetails extends StatefulWidget {
  String name;
  StoreDetails({Key key, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  double _width;
  double _height;
  bool loadedFlag = false;

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_controller.value.isPlaying) _controller.pause();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    int kDefaultPaddin = 50;
    _height = SizeConfig.screenHeight;
    _width = SizeConfig.screenWidth;

    // TODO: implement build
    return Scaffold(
      // each product have a color
      backgroundColor: Color(0xFF3D82AE),
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _height,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: _width,
                    margin: EdgeInsets.only(top: _height * 0.1),
                    padding: EdgeInsets.only(
                      top: _height * 0.08,
                      left: 20,
                      right: 20,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Description(
                          description: "See how things are in the store",
                        ),
                        SizedBox(height: kDefaultPaddin / 2),
                        SizedBox(height: kDefaultPaddin / 2),
                        _playerWidget()
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      widget.name,
                      style: TextStyle(
                          fontSize: this._width * .10,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _playerWidget() {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the VideoPlayerController has finished initialization, use
          // the data it provides to limit the aspect ratio of the VideoPlayer.
          return AspectRatio(
            aspectRatio: 1,
            // Use the VideoPlayer widget to display the video.
            child: VideoPlayer(_controller),
          );
        } else {
          // If the VideoPlayerController is still initializing, show a
          // loading spinner.
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF3D82AE),
      elevation: 0,
      title: Text("Store Details"),
    );
  }
}

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.description,
  }) : super(key: key);

  final String description;
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(fontSize: 20),
    );
  }
}
