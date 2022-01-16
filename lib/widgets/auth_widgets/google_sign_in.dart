import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:spotify_clone/screens/auth_screens/common_screens/confirm_create_account.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    "profile",
    "https://www.googleapis.com/auth/user.birthday.read",
    "https://www.googleapis.com/auth/user.gender.read",
  ],
  signInOption: SignInOption.standard,
);

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

  Future<void> getGenderAndDOBFromGoogleAccount(
      GoogleSignInAccount googleUser) async {
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/'
          '?personFields=genders,birthdays'),
      headers: await googleUser.authHeaders,
    );
    if (response.statusCode != 200) {
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
    final Map<String, dynamic> data = json.decode(response.body);
    print(data);
  }

  Future<void> googleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      print(_currentUser);

      if (_currentUser == null) {
        throw "No user details found";
      }
      await getGenderAndDOBFromGoogleAccount(
        _currentUser as GoogleSignInAccount,
      );
      await _googleSignIn.signOut();

      Navigator.of(context).pushNamed(
        SignupConfirmCreateAccount.route,
      );
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
