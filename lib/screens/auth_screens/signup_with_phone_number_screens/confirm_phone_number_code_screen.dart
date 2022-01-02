import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_email_screens/date_of_birth_screen.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/utils/confirm_phone_number_code_args.dart';
import 'package:spotify_clone/screens/auth_screens/signup_with_phone_number_screens/utils/functions_for_confirm_code.dart';
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
  FocusNode firstTextFormFieldFocusNode = new FocusNode();
  FocusNode secondTextFormFieldFocusNode = new FocusNode();
  FocusNode thirdTextFormFieldFocusNode = new FocusNode();
  FocusNode fourthTextFormFieldFocusNode = new FocusNode();
  FocusNode fifthTextFormFieldFocusNode = new FocusNode();
  FocusNode sixthTextFormFieldFocusNode = new FocusNode();

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
            Container(
              child: Text(
                "Enter your code",
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            RawKeyboardListener(
              focusNode: FocusNode(),
              onKey: (event) {
                print(event);
                if (isNumericKeyPressed(event: event) &&
                    event.runtimeType == RawKeyDownEvent) {
                  currentValue =
                      event.character != null ? event.character as String : '';
                  if (currentFocusNodeNumber == 6) {
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
                } else if (event.isKeyPressed(LogicalKeyboardKey.backspace) &&
                    event.runtimeType == RawKeyDownEvent) {
                  final isCurrentFocusNodeHasValue =
                      showNextButton = checkIfCurrentFocusNodeHasValue(
                    currentFocusNodeNumber: currentFocusNodeNumber,
                    textEditingControllers: textEditingControllers,
                  );
                  if (isCurrentFocusNodeHasValue) {
                    showNextButton = clearCurrentFocusNodeValue(
                      currentFocusNodeNumber: currentFocusNodeNumber,
                      textEditingControllers: textEditingControllers,
                    );
                  } else {
                    final result = navigateToPreviousFocusNode(
                      currentFocusNodeNumber: currentFocusNodeNumber,
                      textEditingControllers: textEditingControllers,
                      textFormFieldFocusNodes: textFormFieldFocusNodes,
                      context: context,
                    );
                    currentFocusNodeNumber = result[0];
                    showNextButton = result[1];
                  }
                  setState(() {});
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Listener(
                      onPointerDown: (event) {
                        currentFocusNodeNumber = 1;
                        setState(() {});
                        firstTextFormFieldFocusNode.requestFocus();
                      },
                      child: Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: currentFocusNodeNumber == 1
                                ? Colors.grey[400]
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: firstTextEditingController,
                          focusNode: firstTextFormFieldFocusNode,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 22),
                          maxLength: 1,
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          autofocus: true,
                          showCursor: false,
                          toolbarOptions: ToolbarOptions(),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final result = setValueAndNavigateToNextFocusNode(
                                currentFocusNodeNumber: currentFocusNodeNumber,
                                textEditingControllers: textEditingControllers,
                                textFormFieldFocusNodes:
                                    textFormFieldFocusNodes,
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
                    Listener(
                      onPointerDown: (event) {
                        currentFocusNodeNumber = 2;
                        setState(() {});
                        secondTextFormFieldFocusNode.requestFocus();
                      },
                      child: Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: currentFocusNodeNumber == 2
                                ? Colors.grey[400]
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: secondTextEditingController,
                          focusNode: secondTextFormFieldFocusNode,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 22),
                          maxLength: 1,
                          maxLengthEnforcement:
                              MaxLengthEnforcement.truncateAfterCompositionEnds,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          showCursor: false,
                          toolbarOptions: ToolbarOptions(),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final result = setValueAndNavigateToNextFocusNode(
                                currentFocusNodeNumber: currentFocusNodeNumber,
                                textEditingControllers: textEditingControllers,
                                textFormFieldFocusNodes:
                                    textFormFieldFocusNodes,
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
                    Listener(
                      onPointerDown: (event) {
                        currentFocusNodeNumber = 3;
                        setState(() {});
                        thirdTextFormFieldFocusNode.requestFocus();
                      },
                      child: Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: currentFocusNodeNumber == 3
                                ? Colors.grey[400]
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: thirdTextEditingController,
                          focusNode: thirdTextFormFieldFocusNode,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 22),
                          maxLength: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          showCursor: false,
                          toolbarOptions: ToolbarOptions(),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final result = setValueAndNavigateToNextFocusNode(
                                currentFocusNodeNumber: currentFocusNodeNumber,
                                textEditingControllers: textEditingControllers,
                                textFormFieldFocusNodes:
                                    textFormFieldFocusNodes,
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
                    Listener(
                      onPointerDown: (event) {
                        currentFocusNodeNumber = 4;
                        setState(() {});
                        fourthTextFormFieldFocusNode.requestFocus();
                      },
                      child: Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: currentFocusNodeNumber == 4
                                ? Colors.grey[400]
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: fourthTextEditingController,
                          focusNode: fourthTextFormFieldFocusNode,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 22),
                          maxLength: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          showCursor: false,
                          toolbarOptions: ToolbarOptions(),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final result = setValueAndNavigateToNextFocusNode(
                                currentFocusNodeNumber: currentFocusNodeNumber,
                                textEditingControllers: textEditingControllers,
                                textFormFieldFocusNodes:
                                    textFormFieldFocusNodes,
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
                    Listener(
                      onPointerDown: (event) {
                        currentFocusNodeNumber = 5;
                        setState(() {});
                        fifthTextFormFieldFocusNode.requestFocus();
                      },
                      child: Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: currentFocusNodeNumber == 5
                                ? Colors.grey[400]
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: fifthTextEditingController,
                          focusNode: fifthTextFormFieldFocusNode,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 22),
                          maxLength: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          showCursor: false,
                          toolbarOptions: ToolbarOptions(),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              final result = setValueAndNavigateToNextFocusNode(
                                currentFocusNodeNumber: currentFocusNodeNumber,
                                textEditingControllers: textEditingControllers,
                                textFormFieldFocusNodes:
                                    textFormFieldFocusNodes,
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
                    Listener(
                      onPointerDown: (event) {
                        currentFocusNodeNumber = 6;
                        sixthTextFormFieldFocusNode.requestFocus();
                        setState(() {});
                      },
                      child: Container(
                        width: 35,
                        decoration: BoxDecoration(
                            color: currentFocusNodeNumber == 6
                                ? Colors.grey[400]
                                : Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: TextFormField(
                          enableInteractiveSelection: false,
                          controller: sixthTextEditingController,
                          focusNode: sixthTextFormFieldFocusNode,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 22),
                          keyboardType: TextInputType.number,
                          // maxLength: 1,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          showCursor: false,
                          toolbarOptions: ToolbarOptions(),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            print("value is $value");
                            if (value.isNotEmpty) {
                              final result = setValueAndNavigateToNextFocusNode(
                                currentFocusNodeNumber: currentFocusNodeNumber,
                                textEditingControllers: textEditingControllers,
                                textFormFieldFocusNodes:
                                    textFormFieldFocusNodes,
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
                  ],
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
