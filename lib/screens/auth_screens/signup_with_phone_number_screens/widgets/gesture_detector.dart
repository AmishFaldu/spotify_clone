import 'package:flutter/material.dart';

class GestureDetectorPhoneNumberWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget child;
  final double? width;
  final double? height;
  final Decoration? decoration;
  const GestureDetectorPhoneNumberWidget({Key? key, required this.child, required this.onTap, this.height, this.width, this.decoration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: width,
        height: height,
        decoration: decoration,
        child: child,
      ),
    );
  }
}
