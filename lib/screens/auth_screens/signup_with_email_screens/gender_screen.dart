import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/models/user.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/confirm_create_account.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_text_button.dart';

class SignupGenderScreen extends StatelessWidget {
  static const route = '/signup-gender-screen';

  const SignupGenderScreen({Key? key}) : super(key: key);

  Future<void> saveGenderToSecureStorageAndNavigateToNextScreen(
      String gender, BuildContext context) async {
    try {
      Provider.of<SpotifyUserProvider>(context, listen: false)
          .tempData['gender'] = gender;
      Navigator.of(context).pushNamed(SignupConfirmCreateAccount.route);
    } catch (error) {
      // TODO = need to add a dialog to show error occured and need to try again
      print(error);
    }
  }

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
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your gender?",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextButton(
                    text: 'Female',
                    onPressed: () async {
                      await saveGenderToSecureStorageAndNavigateToNextScreen(
                          'female', context);
                    }),
                const SizedBox(
                  width: 20,
                ),
                CustomTextButton(
                    text: 'Male',
                    onPressed: () async {
                      await saveGenderToSecureStorageAndNavigateToNextScreen(
                          'male', context);
                    }),
                const SizedBox(
                  width: 20,
                ),
                CustomTextButton(
                    text: 'Non-binary',
                    onPressed: () async {
                      await saveGenderToSecureStorageAndNavigateToNextScreen(
                          'non-binary', context);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
