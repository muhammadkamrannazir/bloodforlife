import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String name;
  final double fontsize;
  final Color color;

  const CustomText({
    Key? key,
    required this.name,
    required this.fontsize,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        style: TextStyle(
          fontSize: fontsize,
          color: color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
