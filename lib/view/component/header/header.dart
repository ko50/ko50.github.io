import 'package:flutter/material.dart';
import 'package:portfolio/helper/theme_colors.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: ThemeColor.PurpleBlack.color,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('About Me'),
          ),
        ],
      ),
    );
  }
}
