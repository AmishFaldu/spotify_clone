import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/utils/confirm_phone_number_code_args.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/confirm_phone_number_code_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/widgets/gesture_detector.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/country_codes_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class PhoneNumberAuth extends StatefulWidget {
  static const route = '/signup-with-phone-number-auth-screen';
  const PhoneNumberAuth({
    Key? key,
  }) : super(key: key);

  @override
  _PhoneNumberAuthState createState() => _PhoneNumberAuthState();
}

class _PhoneNumberAuthState extends State<PhoneNumberAuth> {
  bool isPhoneNumberEntered = false;
  String countryName = 'India';
  String countryCode = '+91';
  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter phone number",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.grey,
              ),
              child: Column(
                children: [
                  GestureDetectorPhoneNumberWidget(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          countryName,
                          textAlign: TextAlign.center,
                        ),
                        Expanded(
                          child: Text(''),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(CountryCodeScreen.route)
                          .then((value) {
                        if (value != null) {
                          countryName = (value as List<String>)[0];
                          countryCode = value[1];
                          setState(() {});
                        }
                      });
                    },
                  ),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: Row(
                      children: [
                        GestureDetectorPhoneNumberWidget(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                countryCode,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(CountryCodeScreen.route)
                                  .then((value) {
                                if (value != null) {
                                  countryName = (value as List<String>)[0];
                                  countryCode = (value)[1];
                                  setState(() {});
                                }
                              });
                            }),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (phoneValue) {
                              if (phoneValue.isNotEmpty &&
                                  !RegExp(r'[^0-9]').hasMatch(phoneValue)) {
                                phoneNumber = phoneValue;
                                isPhoneNumberEntered = true;
                                setState(() {});
                                return;
                              }
                              isPhoneNumberEntered = false;
                              setState(() {});
                            },
                            enableSuggestions: true,
                            initialValue: '',
                            autofocus: true,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.white,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Phone number",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "We'll send you a code by SMS to confirm your phone number.",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    letterSpacing: .2,
                    fontSize: 12,
                  ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "We may occasionally send you service-based messages.",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    letterSpacing: .2,
                    fontSize: 12,
                  ),
            ),
            SizedBox(
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
                  onPressed: isPhoneNumberEntered
                      ? () {
                          Navigator.of(context).pushNamed(
                            ConfirmPhoneNumberCode.route,
                            arguments: ConfirmPhoneNumberCodeArguments(
                              phoneNumber: "$countryCode$phoneNumber",
                            ),
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: isPhoneNumberEntered
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
