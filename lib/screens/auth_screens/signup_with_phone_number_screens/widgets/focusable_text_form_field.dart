import 'package:flutter/material.dart';

class FocusableTextFormField extends StatelessWidget {
  final void Function(PointerDownEvent) onPointerDownFunction;
  final Decoration? decoration;
  final TextEditingController textEditingController;
  final FocusNode textFormFieldFocusNode;
  final void Function() setValueAndNavigateToNextFocusNode;

  const FocusableTextFormField({
    Key? key,
    required this.onPointerDownFunction,
    this.decoration,
    required this.textEditingController,
    required this.setValueAndNavigateToNextFocusNode,
    required this.textFormFieldFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: onPointerDownFunction,
      child: Container(
        width: 35,
        decoration: decoration,
        child: TextFormField(
          enableInteractiveSelection: false,
          controller: textEditingController,
          focusNode: textFormFieldFocusNode,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 22),
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
              setValueAndNavigateToNextFocusNode();
            }
          },
        ),
      ),
    );
  }
}
