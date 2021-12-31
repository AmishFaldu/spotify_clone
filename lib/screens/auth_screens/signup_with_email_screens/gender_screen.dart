import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/confirm_create_account.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class SignupGenderScreen extends StatelessWidget {
  static const route = '/signup-gender-screen';

  const SignupGenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Create account',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your gender?",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomBouncingButton(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignupConfirmCreateAccount.route);
                    },
                    child: Text(
                      'Female',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 15),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 2.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CustomBouncingButton(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignupConfirmCreateAccount.route);
                    },
                    child: Text(
                      'Male',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 15),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CustomBouncingButton(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignupConfirmCreateAccount.route);
                    },
                    child: Text(
                      'Non-binary',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 15),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      splashFactory: NoSplash.splashFactory,
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 2.5),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
