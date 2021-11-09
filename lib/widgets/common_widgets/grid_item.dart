import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? subTitle;
  final Color gridItemBGColor;
  final double gridItemWidth;
  final double gridItemImageWidth;
  final double gridItemImageHeight;
  final double gridItemImageTextPadding;
  final double gridItemTextBoxSize;

  const GridItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.subTitle,
    required this.gridItemBGColor,
    required this.gridItemWidth,
    required this.gridItemImageWidth,
    required this.gridItemImageHeight,
    required this.gridItemImageTextPadding,
    required this.gridItemTextBoxSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: gridItemWidth,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: gridItemBGColor,
        backgroundBlendMode: BlendMode.luminosity,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
            child: Image.network(
              imageUrl,
              height: gridItemImageHeight,
              width: gridItemImageWidth,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: gridItemImageTextPadding,
          ),
          SizedBox(
            width: gridItemTextBoxSize,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                if (subTitle != null && subTitle!.isNotEmpty)
                  Text(
                    subTitle as String,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
