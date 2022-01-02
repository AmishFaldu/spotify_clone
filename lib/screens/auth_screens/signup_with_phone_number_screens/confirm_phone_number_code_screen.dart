import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/date_of_birth_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/utils/confirm_phone_number_code_args.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/utils/functions_for_confirm_code.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/widgets/focusable_text_form_field.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class ConfirmPhoneNumberCode extends StatefulWidget {
  static const route = '/confirm-phone-number-code';

  const ConfirmPhoneNumberCode({
    Key? key,
  }) : super(key: key);

  @override
  _ConfirmPhoneNumberCodeState createState() => _ConfirmPhoneNumberCodeState();
}

class _ConfirmPhoneNumberCodeState extends State<ConfirmPhoneNumberCode> {
  bool isCodeEnteringCompleted = false;
  FocusNode firstTextFormFieldFocusNode = FocusNode();
  FocusNode secondTextFormFieldFocusNode = FocusNode();
  FocusNode thirdTextFormFieldFocusNode = FocusNode();
  FocusNode fourthTextFormFieldFocusNode = FocusNode();
  FocusNode fifthTextFormFieldFocusNode = FocusNode();
  FocusNode sixthTextFormFieldFocusNode = FocusNode();

  String currentValue = "";
  bool showNextButton = false;
  int currentFocusNodeNumber = 1;

  final firstTextEditingController = TextEditingController();
  final secondTextEditingController = TextEditingController();
  final thirdTextEditingController = TextEditingController();
  final fourthTextEditingController = TextEditingController();
  final fifthTextEditingController = TextEditingController();
  final sixthTextEditingController = TextEditingController();

  @override
  void dispose() {
    firstTextFormFieldFocusNode.dispose();
    firstTextEditingController.dispose();

    secondTextFormFieldFocusNode.dispose();
    secondTextEditingController.dispose();

    thirdTextFormFieldFocusNode.dispose();
    thirdTextEditingController.dispose();

    fourthTextFormFieldFocusNode.dispose();
    fourthTextEditingController.dispose();

    fifthTextFormFieldFocusNode.dispose();
    fifthTextEditingController.dispose();

    sixthTextFormFieldFocusNode.dispose();
    sixthTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> textEditingControllers = [
      firstTextEditingController,
      secondTextEditingController,
      thirdTextEditingController,
      fourthTextEditingController,
      fifthTextEditingController,
      sixthTextEditingController,
    ];

    final List<FocusNode> textFormFieldFocusNodes = [
      firstTextFormFieldFocusNode,
      secondTextFormFieldFocusNode,
      thirdTextFormFieldFocusNode,
      fourthTextFormFieldFocusNode,
      fifthTextFormFieldFocusNode,
      sixthTextFormFieldFocusNode,
    ];

    final args = ModalRoute.of(context)?.settings.arguments
        as ConfirmPhoneNumberCodeArguments;
    final phoneNumber = args.phoneNumber;

    final deviceScreen = MediaQuery.of(context).size.width;
    final paddingSize = (deviceScreen - (6 * 35) - (15 * 2)) / 7;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your code",
              style: Theme.of(context).textTheme.headline5,
            ),
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) {
                final result = rawKeyPressedEventFunction(
                  event: event,
                  currentFocusNodeNumber: currentFocusNodeNumber,
                  textEditingControllers: textEditingControllers,
                  textFormFieldFocusNodes: textFormFieldFocusNodes,
                  context: context,
                );
                if (event.runtimeType == RawKeyDownEvent) {
                  currentValue = result[0];
                  currentFocusNodeNumber = result[1];
                  showNextButton = result[2];
                  setState(() {});
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List<Widget>.generate(
                    6,
                    (i) => FocusableTextFormField(
                      onPointerDownFunction: (event) {
                        currentFocusNodeNumber = (i + 1);
                        setState(() {});
                        firstTextFormFieldFocusNode.requestFocus();
                      },
                      textEditingController: textEditingControllers[i],
                      textFormFieldFocusNode: textFormFieldFocusNodes[i],
                      autofocus: i == 0,
                      textInputAction:
                          i == 5 ? TextInputAction.done : TextInputAction.next,
                      onFieldSubmitted: (value) {
                        currentFocusNodeNumber = navigateToAnotherFocusNode(
                          currentFocusNodeNumber: currentFocusNodeNumber,
                          textFormFieldFocusNodes: textFormFieldFocusNodes,
                          context: context,
                        );
                        setState(() {});
                      },
                      decoration: BoxDecoration(
                        color: currentFocusNodeNumber == (i + 1)
                            ? Colors.grey[400]
                            : Colors.grey[800],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          final result = setValueAndNavigateToNextFocusNode(
                            currentFocusNodeNumber: currentFocusNodeNumber,
                            textEditingControllers: textEditingControllers,
                            textFormFieldFocusNodes: textFormFieldFocusNodes,
                            currentValue: currentValue,
                            context: context,
                          );
                          currentFocusNodeNumber = result[0];
                          showNextButton = result[1];
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: paddingSize),
              alignment: Alignment.center,
              child: Text(
                'We sent an SMS with a 6-digit code to $phoneNumber',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 40),
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
                  onPressed: showNextButton
                      ? () {
                          Navigator.of(context).pushReplacementNamed(
                            SignupDateOfBirthScreen.route,
                          );
                        }
                      : null,
                  style: ButtonStyle(
                    backgroundColor: showNextButton
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
            Center(
              child: CustomBouncingButton(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.textsms_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    'Resend SMS',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomBouncingButton(
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.edit_outlined,
                    color: Theme.of(context).iconTheme.color,
                  ),
                  label: Text(
                    'Edit phone number',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 14),
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
