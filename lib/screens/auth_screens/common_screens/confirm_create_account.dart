import 'package:flutter/material.dart';
import 'package:spotify_clone/screens/main_screens/home_screen.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_tappable_checkbox.dart';
import 'package:url_launcher/url_launcher.dart';

class SignupConfirmCreateAccount extends StatefulWidget {
  static const route = 'signup-confirm-create-account';

  const SignupConfirmCreateAccount({Key? key}) : super(key: key);

  @override
  State<SignupConfirmCreateAccount> createState() =>
      _SignupConfirmCreateAccountState();
}

class _SignupConfirmCreateAccountState
    extends State<SignupConfirmCreateAccount> {
  bool receivingMarketingMessagesCheckBox = false;
  bool sharingPersonalDataForMarketingPurposesCheckBox = false;
  bool isValidProfileName = false;
  bool isCreateButtonPressed = false;

  void launchUrl() async {
    try {
      final isUrlLaunched = await launch("https://www.google.com");
      if (!isUrlLaunched) {
        throw "Could not launch url";
      }
    } catch (error) {
      print(error);
    }
  }

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

    double containerHeight = MediaQuery.of(context).size.height -
        topOverlayHeight -
        bottomOverlayHeight -
        keyboardOverlayHeight -
        appBarHeight;

    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 10,
            ),
            height: containerHeight,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  keyboardOverlayHeight > 0 ? Colors.black : Colors.transparent
                ],
                begin: Alignment.center,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's your name?",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.grey,
                    ),
                    child: TextFormField(
                      validator: (profileName) {
                        if (profileName == null || profileName.trim().isEmpty) {
                          return "Profile name should not be empty";
                        }
                      },
                      onChanged: (profileNameValue) {
                        if (profileNameValue.trim().isNotEmpty) {
                          isValidProfileName = true;
                          setState(() {});
                          return;
                        }
                        isValidProfileName = false;
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Text("This appears on your Spotify Clone profile."),
                  const Divider(
                    color: Colors.grey,
                    thickness: .6,
                    height: 40,
                  ),
                  const Text(
                    "By tapping \"Create account\", you agree to the Spotify Clone Terms of Use.",
                  ),
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      "Terms of Use",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      launchUrl();
                    },
                  ),
                  const Text(
                    "To learn more about how Spotify Clone collects, uses, shares and protects your personal data, please see the Spotify Privacy Policy.",
                  ),
                  TextButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      launchUrl();
                    },
                  ),
                  CustomTappableCheckBox(
                      checkboxText:
                          "I would prefer not to receive marketing messages from Spotify Clone.",
                      checkBoxValue: receivingMarketingMessagesCheckBox,
                      onTap: () {
                        receivingMarketingMessagesCheckBox =
                            !receivingMarketingMessagesCheckBox;
                        setState(() {});
                      },
                      onChanged: (value) {
                        receivingMarketingMessagesCheckBox =
                            !receivingMarketingMessagesCheckBox;
                        setState(() {});
                      }),
                  CustomTappableCheckBox(
                      checkboxText:
                          "Share my registration data with Spotify Clone's content providers for marketing purposes.",
                      checkBoxValue:
                          sharingPersonalDataForMarketingPurposesCheckBox,
                      onTap: () {
                        sharingPersonalDataForMarketingPurposesCheckBox =
                            !sharingPersonalDataForMarketingPurposesCheckBox;
                        setState(() {});
                      },
                      onChanged: (value) {
                        sharingPersonalDataForMarketingPurposesCheckBox =
                            !sharingPersonalDataForMarketingPurposesCheckBox;
                        setState(() {});
                      }),
                  if (keyboardOverlayHeight > 0)
                    SizedBox(
                      height: 100 + containerHeight * .1,
                    ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Container(
                height: 100,
                margin: EdgeInsets.only(bottom: containerHeight * .1),
                alignment: Alignment.center,
                child: isCreateButtonPressed
                    ? CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      )
                    : CustomBouncingButton(
                        child: ElevatedButton(
                          onPressed: isValidProfileName
                              ? () {
                                  setState(() {
                                    isCreateButtonPressed = true;
                                  });
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    HomeScreen.route,
                                    (route) => false,
                                  );
                                }
                              : null,
                          child: Text(
                            'Create account',
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                            ),
                            splashFactory: NoSplash.splashFactory,
                            backgroundColor: isValidProfileName
                                ? MaterialStateProperty.all(Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.primary)
                                : MaterialStateProperty.all(Theme.of(context)
                                    .buttonTheme
                                    .colorScheme
                                    ?.secondary),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
