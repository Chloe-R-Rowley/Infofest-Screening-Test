import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {required this.buttonName,
      required this.function,
      required this.top,
      required this.bottom,
      super.key});
  final double top, bottom;
  final String buttonName;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16, top, 16, bottom),
      height: 60,
      child: ElevatedButton(onPressed: function, child: Text(buttonName)),
    );
  }
}
