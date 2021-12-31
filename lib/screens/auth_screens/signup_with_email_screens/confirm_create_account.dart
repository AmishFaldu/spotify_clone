import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class SignupConfirmCreateAccount extends StatefulWidget {
  static const route = 'signup-confirm-create-account';

  const SignupConfirmCreateAccount({Key? key}) : super(key: key);

  @override
  State<SignupConfirmCreateAccount> createState() =>
      _SignupConfirmCreateAccountState();
}

class _SignupConfirmCreateAccountState
    extends State<SignupConfirmCreateAccount> {
  bool marketingCheckBox = false;
  bool shareDataCheckBox = false;
  bool isValidProfileName = false;

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
      body: Container(
        height: containerHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                        onChanged: (profileNameValue) {
                          if (profileNameValue.isNotEmpty) {
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
                    SizedBox(
                      height: 10,
                    ),
                    Text("This appears on your Spotify Clone profile."),
                    Divider(
                      color: Colors.grey,
                      thickness: .6,
                      height: 40,
                    ),
                    Text(
                        "By tapping \"Create account\", you agree to the Spotify Clone Terms of Use."),
                    TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Text(
                        "Terms of Use",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {},
                    ),
                    Text(
                        "To learn more about how Spotify Clone collects, uses, shares and protects your personal data, please see the Spotify Privacy Policy."),
                    TextButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {},
                    ),
                    GestureDetector(
                      onTap: () {
                        marketingCheckBox = !marketingCheckBox;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                              "I would prefer not to receive marketing messages from Spotify Clone.",
                              softWrap: true,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              side: BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                              checkColor: Colors.black,
                              splashRadius: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              value: marketingCheckBox,
                              onChanged: (value) {
                                marketingCheckBox = !marketingCheckBox;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        shareDataCheckBox = !shareDataCheckBox;
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 300,
                            child: Text(
                              "Share my registration data with Spotify Clone's content providers for marketing purposes.",
                              softWrap: true,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: Checkbox(
                              side: BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                              checkColor: Colors.black,
                              splashRadius: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              value: shareDataCheckBox,
                              onChanged: (value) {
                                shareDataCheckBox = !shareDataCheckBox;
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     shareDataCheckBox = !shareDataCheckBox;
                    //     setState(() {});
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: 300,
                    //         child: Text(
                    //           "Share my registration data with Spotify Clone's content providers for marketing purposes.",
                    //           softWrap: true,
                    //           style: Theme.of(context).textTheme.bodyText2,
                    //         ),
                    //       ),
                    //       Transform.scale(
                    //         scale: 1.2,
                    //         child: Checkbox(
                    //           side: BorderSide(
                    //             color: Colors.grey,
                    //             width: 1.5,
                    //           ),
                    //           checkColor: Colors.black,
                    //           splashRadius: 0,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           value: shareDataCheckBox,
                    //           onChanged: (value) {
                    //             shareDataCheckBox = !shareDataCheckBox;
                    //             setState(() {});
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     shareDataCheckBox = !shareDataCheckBox;
                    //     setState(() {});
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: 300,
                    //         child: Text(
                    //           "Share my registration data with Spotify Clone's content providers for marketing purposes.",
                    //           softWrap: true,
                    //           style: Theme.of(context).textTheme.bodyText2,
                    //         ),
                    //       ),
                    //       Transform.scale(
                    //         scale: 1.2,
                    //         child: Checkbox(
                    //           side: BorderSide(
                    //             color: Colors.grey,
                    //             width: 1.5,
                    //           ),
                    //           checkColor: Colors.black,
                    //           splashRadius: 0,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           value: shareDataCheckBox,
                    //           onChanged: (value) {
                    //             shareDataCheckBox = !shareDataCheckBox;
                    //             setState(() {});
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // GestureDetector(
                    //   onTap: () {
                    //     shareDataCheckBox = !shareDataCheckBox;
                    //     setState(() {});
                    //   },
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: 300,
                    //         child: Text(
                    //           "Share my registration data with Spotify Clone's content providers for marketing purposes.",
                    //           softWrap: true,
                    //           style: Theme.of(context).textTheme.bodyText2,
                    //         ),
                    //       ),
                    //       Transform.scale(
                    //         scale: 1.2,
                    //         child: Checkbox(
                    //           side: BorderSide(
                    //             color: Colors.grey,
                    //             width: 1.5,
                    //           ),
                    //           checkColor: Colors.black,
                    //           splashRadius: 0,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(20),
                    //           ),
                    //           value: shareDataCheckBox,
                    //           onChanged: (value) {
                    //             shareDataCheckBox = !shareDataCheckBox;
                    //             setState(() {});
                    //           },
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.red, Colors.red],
                ).createShader(bounds);
              },
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Colors.black],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    width: double.infinity,
                    // height: containerHeight * .4,
                    margin: EdgeInsets.only(bottom: containerHeight * .08),
                    // margin: EdgeInsets.only(bottom: containerHeight * .08),
                    alignment: Alignment.center,
                    child: CustomBouncingButton(
                      child: ElevatedButton(
                        onPressed: () {},
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
                            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          ),
                          splashFactory: NoSplash.splashFactory,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
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
            ),
          ],
        ),
      ),
    );
  }
}
