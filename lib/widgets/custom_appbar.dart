import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  // final Color backgroundColor;
  const CustomAppBar({
    Key? key,
    required this.title,
    // required this.backgroundColor,
  }) : super(key: key);

  Size get PreferredSize => const Size.fromHeight(60);
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: backgroundColor,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(title),
      elevation: 0,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}
