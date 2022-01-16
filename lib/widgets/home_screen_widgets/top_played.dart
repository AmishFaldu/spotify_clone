import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/common_widgets/grid_item.dart';

class TopPlayed extends StatelessWidget {
  const TopPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color gridItemBGColor = Colors.grey[800]!.withAlpha(140);
    double screenWidth = MediaQuery.of(context).size.width;
    // 30 for left and right margin from parent container, 10 for space between grid elements
    final double gridItemWidth = (screenWidth - 30 - 10) / 2;

    const double gridItemImageWidth = 50;
    const double gridItemImageHeight = 60;
    const double gridItemImageTextPadding = 10;
    final double gridItemTextBoxSize =
        (gridItemWidth - gridItemImageWidth - 2 * gridItemImageTextPadding);

    return Container(
      height: 180,
      width: screenWidth - 30,
      margin: const EdgeInsets.only(top: 10),
      child: GridView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: gridItemWidth,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (var i = 0; i < 6; i++)
            GridItem(
              imageUrl:
                  'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
              title: 'Liked Songs',
              gridItemBGColor: gridItemBGColor,
              gridItemWidth: gridItemWidth,
              gridItemImageHeight: gridItemImageHeight,
              gridItemImageWidth: gridItemImageWidth,
              gridItemImageTextPadding: gridItemImageTextPadding,
              gridItemTextBoxSize: gridItemTextBoxSize,
            ),
        ],
      ),
    );
  }
}
