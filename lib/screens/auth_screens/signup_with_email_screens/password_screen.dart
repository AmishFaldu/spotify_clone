import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/date_of_birth_screen.dart';
import 'package:spotify_clone/utils/secure_flutter_storage.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class SignupPasswordScreen extends StatefulWidget {
  static const route = '/signup-login-screen';

  const SignupPasswordScreen({Key? key}) : super(key: key);

  @override
  _SignupPasswordScreenState createState() => _SignupPasswordScreenState();
}

class _SignupPasswordScreenState extends State<SignupPasswordScreen> {
  bool isValidPassword = false;
  GlobalKey<FormState> globalKeyForFormState = GlobalKey();
  String password = '';

  Future<void> savePasswordToSecureStorage() async {
    SecureFlutterStorage storage = SecureFlutterStorage();
    try {
      final isDataValid = globalKeyForFormState.currentState?.validate();
      if (password.isNotEmpty && isDataValid != true) {
        throw "Invalid password";
      }
      await storage.write(key: 'user.password', value: password);
    } catch (error) {
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
              "Create a password",
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
              child: TextFormField(
                key: globalKeyForFormState,
                validator: (passwordValue) {
                  if (password.trim().isEmpty ||
                      passwordValue == null ||
                      passwordValue.trim().isEmpty == true) {
                    return "Password should not be empty";
                  }

                  if (passwordValue.trim().length > 8) {
                    return "Password should be greater than 8 characters";
                  }
                },
                onChanged: (passwordValue) {
                  password = passwordValue;
                  if (passwordValue.trim().isNotEmpty &&
                      passwordValue.trim().length > 8) {
                    isValidPassword = true;
                    setState(() {});
                    return;
                  }
                  isValidPassword = false;
                  setState(() {});
                },
                initialValue: '',
                autofocus: true,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                obscureText: true,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Use at least 8 characters.",
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
                  onPressed: isValidPassword
                      ? () async {
                          await savePasswordToSecureStorage();
                          Navigator.of(context)
                              .pushNamed(SignupDateOfBirthScreen.route);
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: isValidPassword
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
