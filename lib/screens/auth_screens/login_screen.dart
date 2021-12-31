import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_link_screens/login_without_password_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const route = '/login-screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isUsernameOrEmailValid = false;
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email or username",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      letterSpacing: .2,
                    ),
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
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Password",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      letterSpacing: .2,
                    ),
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
                  obscureText: true,
                  onChanged: (emailValue) {
                    if (emailValue.isNotEmpty) {
                      isPasswordValid = true;
                      setState(() {});
                      return;
                    }
                    isPasswordValid = false;
                    setState(() {});
                  },
                  enableSuggestions: true,
                  initialValue: '',
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: CustomBouncingButton(
                  child: ElevatedButton(
                    child: Center(
                      child: Text(
                        "Log in",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(letterSpacing: .2, color: Colors.black),
                      ),
                    ),
                    onPressed: isPasswordValid && isUsernameOrEmailValid
                        ? () {}
                        : null,
                    style: ButtonStyle(
                      backgroundColor: isPasswordValid && isUsernameOrEmailValid
                          ? MaterialStateProperty.all(Theme.of(context)
                              .buttonTheme
                              .colorScheme
                              ?.primary)
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
              const SizedBox(
                height: 20,
              ),
              Center(
                child: CustomBouncingButton(
                  child: ElevatedButton(
                    child: Center(
                      child: Text(
                        "Log in without password",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              letterSpacing: .2,
                              fontSize: 12,
                            ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(LoginWithoutPassword.route);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      alignment: Alignment.centerLeft,
                      splashFactory: NoSplash.splashFactory,
                      fixedSize: MaterialStateProperty.all(
                        const Size(180, 5),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                          side: const BorderSide(
                            color: Colors.grey,
                            width: .5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
