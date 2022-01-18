import 'package:flutter/material.dart';
import 'package:spotify_clone/widgets/custom_widgets/custom_bouncing_button.dart';

class CustomVerticalGridItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Color gridItemBGColor;
  final double gridItemWidth;
  final double gridItemImageWidth;
  final double gridItemImageHeight;
  final double gridItemImageTextPadding;
  final double gridItemTextBoxSize;

  const CustomVerticalGridItem({
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
      child: SizedBox(
        width: gridItemWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                height: gridItemImageHeight,
                width: gridItemImageWidth,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
              child: Container(
                width: gridItemTextBoxSize,
                margin: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: Text(
                  title,
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
