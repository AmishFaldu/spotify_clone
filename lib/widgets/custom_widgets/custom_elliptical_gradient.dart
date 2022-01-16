import 'package:flutter/material.dart';

class CustomEllipticalGradientWidget extends StatelessWidget {
  const CustomEllipticalGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.width;
    final topOverlayHeight = MediaQuery.of(context).padding.top;
    final containerHeight = 60.0 + 50.0 + topOverlayHeight;
    final radius = containerWidth * .6 / 100;
    final initialColor = Color.fromARGB(255, 80, 48, 180);

    return Stack(
      children: [
        Container(
          height: containerHeight,
          width: containerWidth,
          decoration: BoxDecoration(
            backgroundBlendMode: BlendMode.lighten,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.elliptical(
                200,
                100,
              ),
            ),
            gradient: RadialGradient(
              colors: [
                initialColor,
                Colors.transparent,
              ],
              radius: radius,
              // focalRadius: .1,
              center: Alignment(0.2, -1.0),
              focal: Alignment(-1.4, -1.0),
            ),
          ),
        ),
      ],
    );
  }
}
