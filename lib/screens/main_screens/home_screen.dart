import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_elliptical_gradient.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_bar.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_played.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = '/home-screen';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.black26,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );
    Orientation deviceOrientation = MediaQuery.of(context).orientation;
    double topUIOverlaySize = MediaQuery.of(context).padding.top;
    double deviceWidth = MediaQuery.of(context).size.width;

    double leftUIOverlaySize = MediaQuery.of(context).padding.left;
    double rightUIOverlaySize = MediaQuery.of(context).padding.right;
    double containerWidth = deviceOrientation == Orientation.portrait
        ? deviceWidth
        : deviceWidth - leftUIOverlaySize - rightUIOverlaySize;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const CustomEllipticalGradientWidget(),
                Container(
                  width: containerWidth,
                  padding: EdgeInsets.only(
                    top: topUIOverlaySize,
                    left: 15,
                    right: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   height: 300,
                      //   width: deviceWidth - 30,
                      //   // color: Colors.green,
                      // ),
                      TopBar(),
                      TopPlayed(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
