import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/salutation.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_right_icons.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Salutation(),
        TopRightIcons(),
      ],
    );
  }
}
