import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/confirm_create_account.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_text_button.dart';

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
                CustomTextButton(
                    text: 'Female',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignupConfirmCreateAccount.route);
                    }),
                SizedBox(
                  width: 20,
                ),
                CustomTextButton(
                    text: 'Male',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignupConfirmCreateAccount.route);
                    }),
                SizedBox(
                  width: 20,
                ),
                CustomTextButton(
                    text: 'Non-binary',
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(SignupConfirmCreateAccount.route);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
