import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/util_screens/country_codes_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class PhoneNumberAuth extends StatefulWidget {
  static const route = '/signup-with-phone-number-auth-screen';

  const PhoneNumberAuth({Key? key}) : super(key: key);

  @override
  _PhoneNumberAuthState createState() => _PhoneNumberAuthState();
}

class _PhoneNumberAuthState extends State<PhoneNumberAuth> {
  bool isPhoneNumberEntered = false;
  String countryName = 'India';
  String countryCode = '+91';

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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(CountryCode.route)
                          .then((value) {
                        if (value != null) {
                          countryName = (value as List<String>)[0];
                          countryCode = value[1];
                          setState(() {});
                        }
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Center(
                              child: Text(
                                countryCode,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(CountryCode.route)
                                .then((value) {
                              if (value != null) {
                                countryName = (value as List<String>)[0];
                                countryCode = (value)[1];
                                setState(() {});
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextFormField(
                            onChanged: (phoneValue) {
                              if (phoneValue.isNotEmpty &&
                                  !RegExp(r'[^0-9]$').hasMatch(phoneValue)) {
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
                            keyboardType: TextInputType.phone,
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
                  onPressed: isPhoneNumberEntered ? () {} : null,
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
