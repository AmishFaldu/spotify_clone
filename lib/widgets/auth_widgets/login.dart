import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/login_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class LoginAuthWidget extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double radius;

  const LoginAuthWidget({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBouncingButton(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(LoginScreen.route);
        },
        child: Text(
          'Log in',
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(letterSpacing: .2),
        ),
        style: ButtonStyle(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          fixedSize: MaterialStateProperty.all(
            Size(buttonWidth, buttonHeight),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
