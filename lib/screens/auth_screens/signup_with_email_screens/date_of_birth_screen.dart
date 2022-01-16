import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/gender_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_date_picker.dart';

class SignupDateOfBirthScreen extends StatefulWidget {
  static const route = '/signup-date-of-birth-screen';

  const SignupDateOfBirthScreen({Key? key}) : super(key: key);

  @override
  _SignupDateOfBirthScreenState createState() =>
      _SignupDateOfBirthScreenState();
}

class _SignupDateOfBirthScreenState extends State<SignupDateOfBirthScreen> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      iconTheme: Theme.of(context).primaryIconTheme,
      backgroundColor: Theme.of(context).backgroundColor,
      title: Text(
        'Create account',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );

    final appBarHeight = appBar.preferredSize.height;
    final topOverlayHeight = MediaQuery.of(context).padding.top;
    final bottomOverlayHeight = MediaQuery.of(context).padding.bottom;
    final keyboardOverlayHeight = MediaQuery.of(context).viewInsets.bottom;
    final containerHeight = MediaQuery.of(context).size.height -
        topOverlayHeight -
        bottomOverlayHeight -
        keyboardOverlayHeight -
        appBarHeight -
        20;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar,
      body: Container(
        width: double.infinity,
        height: containerHeight,
        margin: const EdgeInsets.only(
          top: 20,
          left: 14,
          right: 14,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What's your date of birth?",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      letterSpacing: .2,
                    ),
              ),
              const SizedBox(
                height: 40,
              ),
              const CustomDatePickerWidget(),
              const SizedBox(
                height: 40,
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
                    onPressed: () async {
                      Navigator.of(context).pushNamed(SignupGenderScreen.route);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).buttonTheme.colorScheme?.primary),
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
      ),
    );
  }
}
