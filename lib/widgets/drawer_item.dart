import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String name;
  final double fontSize;
  final Icon icon;
  final Function onTap;

  const DrawerItem({
    Key? key,
    required this.name,
    required this.fontSize,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap,
      leading: icon,
      title: Text(
        name,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
