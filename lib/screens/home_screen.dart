import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_bar.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_played.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const route = '/home-screen';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    double topUIOverlaySize = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: const Alignment(-.2, -.3),
              colors: [
                Colors.indigo[800] as Color,
                Theme.of(context).backgroundColor
              ],
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(
                top: topUIOverlaySize + 15, left: 15, right: 15),
            child: Column(
              children: const [
                TopBar(),
                TopPlayed(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
