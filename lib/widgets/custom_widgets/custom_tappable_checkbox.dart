import 'package:flutter/material.dart';

class CustomTappableCheckBox extends StatelessWidget {
  final void Function() onTap;
  final void Function(bool? value) onChanged;
  final String checkboxText;
  final bool checkBoxValue;
  const CustomTappableCheckBox({Key? key, required this.checkboxText, required this.checkBoxValue, required this.onTap, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 300,
            child: Text(
              checkboxText,
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
              value: checkBoxValue,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
