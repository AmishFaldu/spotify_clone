import 'package:flutter/material.dart';

class GestureDetectorPhoneNumberWidget extends StatelessWidget {
  final void Function() onTap;
  final Widget child;
  const GestureDetectorPhoneNumberWidget({Key? key, required this.child, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
        child: child,
      ),
    );
  }
}
