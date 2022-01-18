import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class TopRightIcons extends StatelessWidget {
  const TopRightIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomBouncingButton(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            iconSize: 26,
          ),
        ),
        CustomBouncingButton(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_backup_restore_outlined),
            highlightColor: Colors.transparent,
            padding: EdgeInsets.zero,
            iconSize: 26,
          ),
        ),
        CustomBouncingButton(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
            highlightColor: Colors.transparent,
            iconSize: 26,
          ),
        ),
      ],
    );
  }
}
