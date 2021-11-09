import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/common_widgets/grid_item.dart';

class TopPlayed extends StatelessWidget {
  const TopPlayed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color gridItemBGColor = Colors.grey[800]!.withAlpha(140);
    double screenWidth = MediaQuery.of(context).size.width;
    final double gridItemWidth = (screenWidth - 30 - 10) / 2;
    const double gridItemImageWidth = 50;
    const double gridItemImageHeight = 60;
    const double gridItemImageTextPadding = 5;
    final double gridItemTextBoxSize =
        (gridItemWidth - gridItemImageWidth) * .75;

    return Container(
      height: 180,
      margin: const EdgeInsets.only(top: 10),
      child: GridView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisExtent: gridItemWidth,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        children: [
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
          GridItem(
            imageUrl:
                'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
            title: 'Top 50 - Global',
            gridItemBGColor: gridItemBGColor,
            gridItemWidth: gridItemWidth,
            gridItemImageHeight: gridItemImageHeight,
            gridItemImageWidth: gridItemImageWidth,
            gridItemImageTextPadding: gridItemImageTextPadding,
            gridItemTextBoxSize: gridItemTextBoxSize,
          ),
          GridItem(
            imageUrl:
                'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
            title: 'Repeat Rewind',
            gridItemBGColor: gridItemBGColor,
            gridItemWidth: gridItemWidth,
            gridItemImageHeight: gridItemImageHeight,
            gridItemImageWidth: gridItemImageWidth,
            gridItemImageTextPadding: gridItemImageTextPadding,
            gridItemTextBoxSize: gridItemTextBoxSize,
          ),
          GridItem(
            imageUrl:
                'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
            title: 'Relaxing Music',
            gridItemBGColor: gridItemBGColor,
            gridItemWidth: gridItemWidth,
            gridItemImageHeight: gridItemImageHeight,
            gridItemImageWidth: gridItemImageWidth,
            gridItemImageTextPadding: gridItemImageTextPadding,
            gridItemTextBoxSize: gridItemTextBoxSize,
          ),
          GridItem(
            imageUrl:
                'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
            title: 'On Repeat',
            gridItemBGColor: gridItemBGColor,
            gridItemWidth: gridItemWidth,
            gridItemImageHeight: gridItemImageHeight,
            gridItemImageWidth: gridItemImageWidth,
            gridItemImageTextPadding: gridItemImageTextPadding,
            gridItemTextBoxSize: gridItemTextBoxSize,
          ),
          GridItem(
            imageUrl:
                'https://i.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
            title: 'Martin Garrix',
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
