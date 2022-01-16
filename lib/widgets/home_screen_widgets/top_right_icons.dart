import 'package:flutter/material.dart';

class TopRightIcons extends StatelessWidget {
  const TopRightIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined),
          highlightColor: Colors.transparent,
          padding: EdgeInsets.zero,
          iconSize: 26,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_backup_restore_outlined),
          highlightColor: Colors.transparent,
          padding: EdgeInsets.zero,
          iconSize: 26,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_outlined),
          highlightColor: Colors.transparent,
          iconSize: 26,
        ),
      ],
    );
  }
}
