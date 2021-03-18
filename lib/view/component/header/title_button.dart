import 'package:flutter/material.dart';
import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/helper/theme_colors.dart';

class TitleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        Section.values[0].text,
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w700,
          color: ThemeColor.Background.color,
        ),
      ),
    );
  }
}
