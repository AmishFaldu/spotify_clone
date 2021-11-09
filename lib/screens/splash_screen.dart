import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const route = '/splash-screen';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'media/Spotify_Icon_RGB_Green.png',
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
