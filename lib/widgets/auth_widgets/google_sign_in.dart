import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:spotify_clone/models/user.dart';
import 'package:spotify_clone/screens/auth_screens/login_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/date_of_birth_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/password_screen.dart';
import 'package:spotify_clone/utils/password_screen_args.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_alert_dialog_box.dart';
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

    final date = data['birthdays'][0]['date'];
    Provider.of<SpotifyUserProvider>(
      context,
      listen: false,
    ).tempData['dateOfBirth'] =
        DateTime(date['year'], date['month'], date['day']).toString();

    Provider.of<SpotifyUserProvider>(
      context,
      listen: false,
    ).tempData['gender'] = data['genders'][0]['value'];
  }

  Future<void> googleSignIn() async {
    try {
      _currentUser = await _googleSignIn.signIn();
      print(_currentUser);

      if (_currentUser == null) {
        throw "No user details found";
      }

      final emailAlreadyExists =
          await Provider.of<SpotifyUserProvider>(context, listen: false)
              .checkIfEmailExists((_currentUser as GoogleSignInAccount).email);

      if (emailAlreadyExists) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomAlertDialogBox(
              title: "This email is already connected to an account.",
              description: "Do you want to login instead?",
              actions: const [
                "GO TO LOGIN",
                "CLOSE",
              ],
              actionFunctions: [
                () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      LoginScreen.route, (route) => route.isFirst);
                },
                () {
                  Navigator.of(context).pop();
                }
              ],
            ),
          ),
        );
        await _googleSignIn.signOut();
        return;
      }

      Provider.of<SpotifyUserProvider>(context, listen: false)
          .tempData['isEmailAuth'] = true;
      Provider.of<SpotifyUserProvider>(context, listen: false)
          .tempData['email'] = _currentUser?.email;
      Provider.of<SpotifyUserProvider>(context, listen: false)
          .tempData['userName'] = _currentUser?.displayName;

      await getGenderAndDOBFromGoogleAccount(
          _currentUser as GoogleSignInAccount);

      await _googleSignIn.signOut();

      Navigator.of(context).pushReplacementNamed(
        SignupPasswordScreen.route,
        arguments: PasswordScreenArgs(
          navigateToConfirmCreateAccountNext: true,
        ),
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
