import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/phone_number_auth_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class PhoneNumberAuthWidget extends StatelessWidget {
  final double buttonWidth;
  final double buttonHeight;
  final double radius;

  const PhoneNumberAuthWidget({
    Key? key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBouncingButton(
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.of(context).pushNamed(PhoneNumberAuth.route);
        },
        icon: const Padding(
          padding: EdgeInsets.only(
            left: 8.0,
          ),
          child: Icon(
            Icons.phone_android_outlined,
            color: Colors.white,
          ),
        ),
        label: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Center(
            child: Text(
              'Continue with phone number',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(letterSpacing: .2),
              softWrap: true,
            ),
          ),
        ),
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          fixedSize: MaterialStateProperty.all(
            Size(buttonWidth, buttonHeight),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[800] as Color,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
      ),
    );
  }
}
