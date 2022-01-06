import 'package:flutter/material.dart';

class CustomAlertDialogBox extends StatelessWidget {
  final Widget title;
  final Widget description;
  final List<Widget> actions;
  const CustomAlertDialogBox({
    Key? key,
    required this.title,
    required this.description,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final containerHeight = deviceHeight * .6;

    return SizedBox(
      height: containerHeight,
      child: AlertDialog(
        scrollable: true,
        title: title,
        content: description,
        actions: actions,
      ),
    );
  }
}
