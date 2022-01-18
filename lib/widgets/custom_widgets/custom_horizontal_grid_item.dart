import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class CustomHorizontalGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color gridItemBGColor;
  final double gridItemWidth;
  final double gridItemImageWidth;
  final double gridItemImageHeight;
  final double gridItemImageTextPadding;
  final double gridItemTextBoxSize;

  const CustomHorizontalGridItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.gridItemBGColor,
    required this.gridItemWidth,
    required this.gridItemImageWidth,
    required this.gridItemImageHeight,
    required this.gridItemImageTextPadding,
    required this.gridItemTextBoxSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomBouncingButton(
      finalSmallScale: 0.03,
      child: Container(
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
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
