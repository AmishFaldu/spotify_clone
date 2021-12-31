// import 'package:flutter/material.dart';
//
// class CustomTextField extends StatefulWidget {
//   final void Function(String)? onChanged;
//   final TextEditingController? textEditingController;
//   final TextInputType? textInputType;
//   final TextInputAction? textInputAction;
//   final bool obscureText;
//   final InputDecoration? inputDecoration;
//
//   const CustomTextField({
//     Key? key,
//     this.onChanged,
//     this.textEditingController,
//     this.textInputType,
//     this.textInputAction,
//     this.inputDecoration,
//     required this.obscureText,
//   }) : super(key: key);
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   bool isInputEntered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: widget.obscureText,
//       controller: widget.textEditingController,
//       cursorHeight: 24,
//       cursorRadius: Radius.circular(
//         10,
//       ),
//       enableSuggestions: true,
//       autofocus: true,
//       textInputAction: widget.textInputAction,
//       keyboardType: widget.textInputType,
//       cursorColor: Colors.white,
//       style: TextStyle(
//         height: isInputEntered == true ? 1.35 : 1.5,
//         fontSize: isInputEntered == true ? 15.0 : 16.0,
//       ),
//       onChanged: (text) {
//         widget.onChanged!(text);
//         if (text.isNotEmpty) {
//           isInputEntered = true;
//           setState(() {});
//           return;
//         }
//         isInputEntered = false;
//         setState(() {});
//       },
//       decoration: widget.inputDecoration,
//     );
//   }
// }
