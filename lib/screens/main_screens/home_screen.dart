import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_elliptical_gradient.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_bar.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_played.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/songs.dart';

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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double topUIOverlaySize = MediaQuery.of(context).padding.top;
    double bottomUIOverlaySize = MediaQuery.of(context).padding.bottom;
    double leftUIOverlaySize = MediaQuery.of(context).padding.left;
    double rightUIOverlaySize = MediaQuery.of(context).padding.right;

    double containerHeight =
        deviceHeight - topUIOverlaySize - bottomUIOverlaySize;
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
                  margin: EdgeInsets.only(
                    top: topUIOverlaySize,
                    left: 15,
                    right: 15,
                    bottom: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      TopBar(),
                      TopPlayed(),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Suggested Artists',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Center(
                    child: SongsWidget(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recently played',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Center(
                    child: SongsWidget(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your playlists',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Center(
                    child: SongsWidget(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Charts',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Center(
                    child: SongsWidget(),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New releases',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Center(
                    child: SongsWidget(),
                  ),
                ],
              ),
            ),
            // Make upto
            Container(
              margin: const EdgeInsets.all(
                15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'More Like Artist/Chart name',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const Center(
                    child: SongsWidget(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
