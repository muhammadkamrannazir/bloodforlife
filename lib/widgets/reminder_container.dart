import 'package:flutter/material.dart';

class ReminderContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  Color decorationColor;
  Color borderColor;
  ReminderContainer(
    this.decorationColor,
    this.borderColor, {
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.only(left: 15, right: 20),
      decoration: BoxDecoration(
        color: decorationColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Theme(
        data: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
          ),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
