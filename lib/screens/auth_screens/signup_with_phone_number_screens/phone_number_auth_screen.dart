import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_clone/models/user.dart';
import 'package:spotify_clone/screens/auth_screens/login_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/confirm_phone_number_code_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/country_codes_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/utils/confirm_phone_number_code_args.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/widgets/gesture_detector.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_alert_dialog_box.dart';
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
  GlobalKey<FormState> globalKeyForPhoneNumberTextFormField = GlobalKey();

  Future<void> sendVerificationCodeAndNavigateToNextScreen(
      BuildContext context) async {
    final phoneNumberWithCountryCode = '$countryCode$phoneNumber';
    try {
      final isDataValid =
          globalKeyForPhoneNumberTextFormField.currentState?.validate();
      if (isDataValid == true && phoneNumber.trim().isNotEmpty) {
        final isUserWithPhoneNumberAlreadyExists =
            await Provider.of<SpotifyUserProvider>(context, listen: false)
                .checkIfPhoneNumberExists(phoneNumberWithCountryCode);

        /// Temp data which will be used at the end of auth flow
        Provider.of<SpotifyUserProvider>(context, listen: false)
            .tempData['isEmailAuth'] = false;

        if (isUserWithPhoneNumberAlreadyExists) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomAlertDialogBox(
                title: "This phone number is already connected to an account.",
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
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                ],
              ),
            ),
          );
          return;
        }

        await Provider.of<SpotifyUserProvider>(context, listen: false)
            .verifyPhoneNumber(
          phoneNumber: phoneNumberWithCountryCode,
          codeSentFunction: (verificationId, forceRetries) {
            Provider.of<SpotifyUserProvider>(context, listen: false)
                .tempData['phoneNumberAuthVerificationId'] = verificationId;

            final ConfirmPhoneNumberCodeArguments args =
                ConfirmPhoneNumberCodeArguments(
                    phoneNumber: '$countryCode$phoneNumber');
            Navigator.of(context).pushNamed(
              ConfirmPhoneNumberCode.route,
              arguments: args,
            );
          },
        );
      }
    } catch (error) {
      // TODO = need to add a dialog to show error occured and need to try again
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(
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
            const SizedBox(
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
                    decoration: const BoxDecoration(
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
                        const Icon(
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
                          decoration: const BoxDecoration(
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
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Form(
                            key: globalKeyForPhoneNumberTextFormField,
                            child: TextFormField(
                              validator: (phoneNumberValue) {
                                if (phoneNumberValue == null ||
                                    phoneNumberValue.trim().isEmpty) {
                                  return "Phone Number should not be null.";
                                }

                                if (phoneNumberValue.trim().length > 10 ||
                                    phoneNumber.trim().length > 10) {
                                  return "Phone number should be 10 digits only.";
                                }
                              },
                              onChanged: (phoneValue) {
                                phoneNumber = phoneValue;
                                if (phoneValue.isNotEmpty &&
                                    !RegExp(r'[^0-9]').hasMatch(phoneValue)) {
                                  isPhoneNumberEntered = true;
                                  setState(() {});
                                  return;
                                }
                                isPhoneNumberEntered = false;
                                setState(() {});
                              },
                              // maxLength: 10,
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
            const SizedBox(
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
                  onPressed: isPhoneNumberEntered
                      ? () async {
                          await sendVerificationCodeAndNavigateToNextScreen(
                              context);
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
