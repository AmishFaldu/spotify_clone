import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/signup_email_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class SignupAuthWidget extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double radius;

  const SignupAuthWidget({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBouncingButton(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(SignUpEmailScreen.route);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Center(
            child: Text(
              'Sign up free',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(letterSpacing: .2, color: Colors.black),
              softWrap: true,
            ),
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          splashFactory: NoSplash.splashFactory,
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
