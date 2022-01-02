import 'package:flutter/material.dart';

class FocusableTextFormField extends StatelessWidget {
  final void Function(PointerDownEvent) onPointerDownFunction;
  final Decoration decoration;
  final TextEditingController textEditingController;
  final FocusNode textFormFieldFocusNode;
  final void Function(String) onChanged;
  final bool autofocus;
  final TextInputAction textInputAction;
  final void Function(String) onFieldSubmitted;

  const FocusableTextFormField({
    Key? key,
    required this.onPointerDownFunction,
    required this.decoration,
    required this.textEditingController,
    required this.textFormFieldFocusNode,
    required this.onChanged,
    required this.autofocus,
    required this.onFieldSubmitted,
    required this.textInputAction,
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
          autofocus: autofocus,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          showCursor: false,
          toolbarOptions: const ToolbarOptions(),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: "",
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
