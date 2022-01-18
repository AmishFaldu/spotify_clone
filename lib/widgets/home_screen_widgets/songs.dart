import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_horizontal_grid_item.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_vertical_grid_item.dart';

class SongsWidget extends StatelessWidget {
  const SongsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color gridItemBGColor = Colors.grey[800]!.withAlpha(140);
    double screenWidth = MediaQuery.of(context).size.width;
    // 30 for left and right margin from parent container, 10 for space between grid elements
    const double gridItemImageHeight = 180;
    const double gridTextContainerHeight = 50;
    const double gridItemHeight = gridItemImageHeight + gridTextContainerHeight;
    final double gridItemWidth = (screenWidth - 30 - 10) / 2.2;
    final double gridTextContainerWidth = gridItemWidth - 20;

    const double gridItemImageTextPadding = 10;

    return Container(
      height: gridItemHeight,
      width: screenWidth - 30,
      margin: const EdgeInsets.only(top: 10),
      child: GridView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: gridItemHeight,
          mainAxisExtent: gridItemWidth,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          for (var i = 0; i < 20; i++)
            CustomVerticalGridItem(
              imageUrl:
                  'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
              title: 'Song title',
              gridItemBGColor: gridItemBGColor,
              gridItemWidth: gridItemWidth,
              gridItemImageHeight: gridItemImageHeight,
              gridItemImageWidth: gridItemWidth,
              gridItemImageTextPadding: gridItemImageTextPadding,
              gridItemTextBoxSize: gridTextContainerWidth,
            ),
        ],
      ),
    );
  }
}
