import 'package:flutter/material.dart';

class Salutation extends StatelessWidget {
  const Salutation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    String greetingText = 'Good morning';
    if (currentDate.hour > 12 && currentDate.hour < 17) {
      greetingText = 'Good afternoon';
    } else if (currentDate.hour > 17) {
      greetingText = 'Good evening';
    }

    return Text(
      greetingText,
      style: Theme.of(context).textTheme.headline6,
    );
  }
}
