import 'package:flutter/material.dart';

class CustomBouncingButton extends StatefulWidget {
  final Widget child;
  const CustomBouncingButton({Key? key, required this.child}) : super(key: key);

  @override
  _CustomBouncingButtonState createState() => _CustomBouncingButtonState();
}

class _CustomBouncingButtonState extends State<CustomBouncingButton>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      lowerBound: 0.0,
      upperBound: 0.06,
      duration: const Duration(milliseconds: 40),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _scale = 1 - animationController!.value;

    return GestureDetector(
      child: Transform.scale(
        scale: _scale,
        child: Listener(
          child: widget.child,
          onPointerDown: (pointerEvent) {
            animationController!.forward();
          },
          onPointerCancel: (pointerEvent) {
            animationController!.reverse();
          },
          onPointerUp: (pointerEvent) {
            animationController!.reverse();
          },
        ),
      ),
    );
  }
}
