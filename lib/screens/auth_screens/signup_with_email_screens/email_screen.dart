import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/login_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/password_screen.dart';
import 'package:spotify_clone/utils/secure_flutter_storage.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_alert_dialog_box.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class SignUpEmailScreen extends StatefulWidget {
  const SignUpEmailScreen({Key? key}) : super(key: key);
  static const route = '/signup-email-screen';

  @override
  State<SignUpEmailScreen> createState() => _SignUpEmailScreenState();
}

class _SignUpEmailScreenState extends State<SignUpEmailScreen> {
  bool isValidEmail = false;
  String email = '';
  String messageBelowEmailField = "You'll need to confirm this email later.";
  final GlobalKey<FormState> globalKeyForEmailFormField = GlobalKey();
  final regex = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+$",
    caseSensitive: false,
    multiLine: true,
  );

  Future<void> saveEmailToSecureStorageAndNavigateToNextScreen() async {
    SecureFlutterStorage storage = SecureFlutterStorage();
    try {
      final isDataValid = globalKeyForEmailFormField.currentState?.validate();
      if (isDataValid != true) {
        messageBelowEmailField = 'Invalid email address entered';
        setState(() {});
        return;
      }

      final methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.isNotEmpty) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CustomAlertDialogBox(
              title: Text(
                "This email is already connected to an account.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.black),
              ),
              description: Text(
                "Do you want to login instead?",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.black),
              ),
              actions: [
                Center(
                  child: CustomBouncingButton(
                    child: ElevatedButton(
                      child: Center(
                        child: Text(
                          "GO TO LOGIN",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(letterSpacing: .2, color: Colors.black),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            LoginScreen.route, (route) => route.isFirst);
                      },
                      style: ButtonStyle(
                        // alignment: Alignment.centerLeft,
                        splashFactory: NoSplash.splashFactory,
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: CustomBouncingButton(
                    child: ElevatedButton(
                      child: Center(
                        child: Text(
                          "CLOSE",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(letterSpacing: .2, color: Colors.black),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        splashFactory: NoSplash.splashFactory,
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        return;
      }

      await storage.write(key: 'user.email', value: email);
      Navigator.of(context).pushNamed(SignupPasswordScreen.route);
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        messageBelowEmailField = 'Invalid email address entered';
        setState(() {});
      } else {
        // TODO = need to add a dialog to show error occured and need to try again
        print(error);
      }
    } catch (error) {
      // TODO = need to add a dialog to show error occured and need to try again
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        iconTheme: Theme.of(context).primaryIconTheme,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(
          'Create account',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(
          top: 20,
          left: 14,
          right: 14,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's your email?",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    letterSpacing: .2,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey,
              ),
              child: Form(
                key: globalKeyForEmailFormField,
                child: TextFormField(
                  validator: (emailValue) {
                    if (email.isEmpty ||
                        emailValue == null ||
                        emailValue.trim().isEmpty) {
                      return "Email cannot be empty";
                    }

                    if (!regex.hasMatch(emailValue)) {
                      return "Invalid email address";
                    }
                  },
                  onChanged: (emailValue) {
                    email = emailValue;
                    if (emailValue.isNotEmpty && regex.hasMatch(emailValue)) {
                      isValidEmail = true;
                      setState(() {});
                      return;
                    }
                    isValidEmail = false;
                    setState(() {});
                  },
                  enableSuggestions: true,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              messageBelowEmailField,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    letterSpacing: .2,
                    fontSize: 12,
                  ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CustomBouncingButton(
                child: ElevatedButton(
                  child: Center(
                    child: Text(
                      "Next",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(letterSpacing: .2, color: Colors.black),
                    ),
                  ),
                  onPressed: isValidEmail
                      ? () async {
                          await saveEmailToSecureStorageAndNavigateToNextScreen();
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: isValidEmail
                        ? MaterialStateProperty.all(
                            Theme.of(context).buttonTheme.colorScheme?.primary)
                        : MaterialStateProperty.all(Theme.of(context)
                            .buttonTheme
                            .colorScheme
                            ?.secondary),
                    alignment: Alignment.centerLeft,
                    splashFactory: NoSplash.splashFactory,
                    fixedSize: MaterialStateProperty.all(
                      const Size(100, 50),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
