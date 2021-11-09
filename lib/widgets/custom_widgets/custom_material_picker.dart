import 'package:flutter/material.dart';

class CustomMaterialPicker extends StatefulWidget {
  final ScrollController? scrollController;
  final void Function(int) onSelectedItemChanged;
  final List<Widget> listOfWidgets;

  const CustomMaterialPicker({
    Key? key,
    this.scrollController,
    required this.onSelectedItemChanged,
    required this.listOfWidgets,
  }) : super(key: key);

  @override
  _CustomMaterialPickerState createState() => _CustomMaterialPickerState();
}

class _CustomMaterialPickerState extends State<CustomMaterialPicker> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 65, left: 15),
          padding: EdgeInsets.all(15),
          child: Text("         "),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white,
              ),
              bottom: BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        ),
        ShaderMask(
          shaderCallback: (rect) => const LinearGradient(
            colors: [
              Colors.transparent,
              Colors.white,
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(rect),
          blendMode: BlendMode.modulate,
          child: Container(
            margin: EdgeInsets.all(20),
            height: 180,
            width: 50,
            child: ListWheelScrollView.useDelegate(
              controller: widget.scrollController,
              childDelegate: ListWheelChildLoopingListDelegate(
                children: widget.listOfWidgets,
              ),
              physics: const FixedExtentScrollPhysics(),
              offAxisFraction: 0.0,
              diameterRatio: 1000,
              squeeze: 1,
              itemExtent: 60,
              magnification: 1.0,
              onSelectedItemChanged: widget.onSelectedItemChanged,
            ),
          ),
        ),
      ],
    );
  }
}
