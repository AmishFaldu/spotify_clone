import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/salutation.dart';
import 'package:spotify_clone/widgets/home_screen_widgets/top_right_icons.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width - 30;

    return Container(
      height: 50,
      width: deviceWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Salutation(),
          TopRightIcons(),
        ],
      ),
    );
  }
}
