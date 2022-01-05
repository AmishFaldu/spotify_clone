import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

GoogleSignIn _googleSignIn = GoogleSignIn();

class GoogleSignInWidget extends StatefulWidget {
  final double buttonHeight;
  final double buttonWidth;
  final double radius;

  const GoogleSignInWidget({
    Key? key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.radius,
  }) : super(key: key);

  @override
  _GoogleSignInWidgetState createState() => _GoogleSignInWidgetState();
}

class _GoogleSignInWidgetState extends State<GoogleSignInWidget> {
  GoogleSignInAccount? _currentUser;

  Future<void> googleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      print(_currentUser);
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomBouncingButton(
      child: ElevatedButton(
        onPressed: () async {
          await googleSignIn();
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Image.asset(
                'media/Google_logo.png',
                height: widget.buttonHeight - 25,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Center(
                  child: Text(
                    'Continue with Google',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(letterSpacing: .2),
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ],
        ),
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          fixedSize: MaterialStateProperty.all(
            Size(widget.buttonWidth, widget.buttonHeight),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.grey[800] as Color,
              ),
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
        ),
      ),
    );
  }
}
