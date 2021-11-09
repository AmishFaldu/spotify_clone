import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/widgets/auth_widgets/google_sign_in.dart';
import 'package:spotify_clone/widgets/auth_widgets/login.dart';
import 'package:spotify_clone/widgets/auth_widgets/phone_number_auth.dart';
import 'package:spotify_clone/widgets/auth_widgets/signup.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final radius = 50.0;
  final sizedBoxHeight = 10.0;
  double buttonHeight = 50.0;
  double buttonWidth = 295.0;
  double heightDecreasedOnTap = 8;
  double widthDecreasedOnTap = 8;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final topPadding = MediaQuery.of(context).padding.top;

    final containerHeight =
        MediaQuery.of(context).size.height - topPadding - bottomPadding;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: containerHeight,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Stack(
                children: [
                  ShaderMask(
                    shaderCallback: (rect) {
                      return const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.transparent, Colors.grey],
                      ).createShader(rect);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'media/spotify_login_collage.jpg',
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 200,
                        ),
                        Image.asset(
                          'media/Spotify_Icon_RGB_White.png',
                          width: 45,
                          height: 45,
                          filterQuality: FilterQuality.medium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Millions of songs.",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text(
                          "Free on Spotify.",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SignupAuthWidget(
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    radius: radius,
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  PhoneNumberAuthWidget(
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    radius: radius,
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  GoogleSignInWidget(
                    buttonHeight: buttonHeight,
                    buttonWidth: buttonWidth,
                    radius: radius,
                  ),
                  LoginAuthWidget(
                    buttonWidth: buttonWidth,
                    buttonHeight: buttonHeight,
                    radius: radius,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
