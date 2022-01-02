import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_link_screens/link_send_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class LoginWithoutPassword extends StatefulWidget {
  const LoginWithoutPassword({Key? key}) : super(key: key);
  static const route = '/login-without-password-screen';

  @override
  _LoginWithoutPasswordState createState() => _LoginWithoutPasswordState();
}

class _LoginWithoutPasswordState extends State<LoginWithoutPassword> {
  bool isUsernameOrEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login without password',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email or username",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
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
                autofocus: true,
                onChanged: (emailValue) {
                  if (emailValue.isNotEmpty) {
                    isUsernameOrEmailValid = true;
                    setState(() {});
                    return;
                  }
                  isUsernameOrEmailValid = false;
                  setState(() {});
                },
                enableSuggestions: true,
                initialValue: '',
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We'll send you an email with a link that will log you in.",
              softWrap: true,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CustomBouncingButton(
                child: ElevatedButton(
                  child: Center(
                    child: Text(
                      "Get link",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(letterSpacing: .2, color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    if (isUsernameOrEmailValid) {
                      Navigator.of(context)
                          .pushReplacementNamed(LinkSendScreen.route);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: isUsernameOrEmailValid
                        ? MaterialStateProperty.all(
                            Theme.of(context).buttonTheme.colorScheme?.primary)
                        : MaterialStateProperty.all(Theme.of(context)
                            .buttonTheme
                            .colorScheme
                            ?.secondary),
                    alignment: Alignment.centerLeft,
                    splashFactory: NoSplash.splashFactory,
                    fixedSize: MaterialStateProperty.all(
                      const Size(120, 50),
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
