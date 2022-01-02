import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

bool isNumericKeyPressed({required RawKeyEvent event}) {
  print(event);
  if (event.isKeyPressed(LogicalKeyboardKey.digit0)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit1)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit2)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit3)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit4)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit5)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit6)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit7)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit8)) {
    return true;
  }
  if (event.isKeyPressed(LogicalKeyboardKey.digit9)) {
    return true;
  }
  return false;
}

bool checkIfCurrentFocusNodeHasValue({
  required int currentFocusNodeNumber,
  required List<TextEditingController> textEditingControllers,
}) {
  switch (currentFocusNodeNumber) {
    case 1:
      return textEditingControllers[0].text.isNotEmpty;
    case 2:
      return textEditingControllers[1].text.isNotEmpty;
    case 3:
      return textEditingControllers[2].text.isNotEmpty;
    case 4:
      return textEditingControllers[3].text.isNotEmpty;
    case 5:
      return textEditingControllers[4].text.isNotEmpty;
    case 6:
      return textEditingControllers[5].text.isNotEmpty;
    default:
      break;
  }
  return false;
}

bool checkForShowingNextButton({
  required List<TextEditingController> textEditingControllers,
}) {
  bool showNextButton = false;
  bool isFirstValueSet = textEditingControllers[0].text.isNotEmpty;
  bool isSecondValueSet =
      textEditingControllers[1].text.isNotEmpty && isFirstValueSet;
  bool isThirdValueSet =
      textEditingControllers[2].text.isNotEmpty && isSecondValueSet;
  bool isFourthValueSet =
      textEditingControllers[3].text.isNotEmpty && isThirdValueSet;
  bool isFifthValueSet =
      textEditingControllers[4].text.isNotEmpty && isFourthValueSet;
  bool isSixthValueSet =
      textEditingControllers[5].text.isNotEmpty && isFifthValueSet;
  if (isSixthValueSet) {
    showNextButton = true;
  }
  return showNextButton;
}

List setValueAndNavigateToNextFocusNode({
  required int currentFocusNodeNumber,
  required List<TextEditingController> textEditingControllers,
  required List<FocusNode> textFormFieldFocusNodes,
  required String currentValue,
  required BuildContext context,
}) {
  switch (currentFocusNodeNumber) {
    case 1:
      textEditingControllers[0].text = currentValue;
      currentFocusNodeNumber = 2;
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[1]);
      break;
    case 2:
      textEditingControllers[1].text = currentValue;
      currentFocusNodeNumber = 3;
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[2]);
      break;
    case 3:
      textEditingControllers[2].text = currentValue;
      currentFocusNodeNumber = 4;
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[3]);
      break;
    case 4:
      textEditingControllers[3].text = currentValue;
      currentFocusNodeNumber = 5;
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[4]);
      break;
    case 5:
      textEditingControllers[4].text = currentValue;
      currentFocusNodeNumber = 6;
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[5]);
      break;
    case 6:
      textEditingControllers[5].text = currentValue;
      break;
    default:
      break;
  }
  return [
    currentFocusNodeNumber,
    checkForShowingNextButton(textEditingControllers: textEditingControllers),
  ];
}

bool clearCurrentFocusNodeValue({
  required int currentFocusNodeNumber,
  required List<TextEditingController> textEditingControllers,
}) {
  switch (currentFocusNodeNumber) {
    case 1:
      textEditingControllers[0].clear();
      break;
    case 2:
      textEditingControllers[1].clear();
      break;
    case 3:
      textEditingControllers[2].clear();
      break;
    case 4:
      textEditingControllers[3].clear();
      break;
    case 5:
      textEditingControllers[4].clear();
      break;
    case 6:
      textEditingControllers[5].clear();
      break;
    default:
      break;
  }
  return checkForShowingNextButton(
      textEditingControllers: textEditingControllers);
}

List navigateToPreviousFocusNode({
  required int currentFocusNodeNumber,
  required List<TextEditingController> textEditingControllers,
  required List<FocusNode> textFormFieldFocusNodes,
  required BuildContext context,
}) {
  switch (currentFocusNodeNumber) {
    case 2:
      currentFocusNodeNumber = 1;
      textEditingControllers[0].clear();
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[0]);
      break;
    case 3:
      currentFocusNodeNumber = 2;
      textEditingControllers[1].clear();
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[1]);
      break;
    case 4:
      currentFocusNodeNumber = 3;
      textEditingControllers[2].clear();
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[2]);
      break;
    case 5:
      currentFocusNodeNumber = 4;
      textEditingControllers[3].clear();
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[3]);
      break;
    case 6:
      currentFocusNodeNumber = 5;
      textEditingControllers[4].clear();
      FocusScope.of(context).requestFocus(textFormFieldFocusNodes[4]);
      break;
    default:
      break;
  }
  return [
    currentFocusNodeNumber,
    checkForShowingNextButton(textEditingControllers: textEditingControllers),
  ];
}
