import 'package:flutter/material.dart';
import 'package:portfolio/helper/theme_colors.dart';

import 'package:portfolio/view/component/header/header.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ThemeColor.PalePink.color,
        title: Text(
          "ko's Portfolio - with Flutter",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 27),
        ),
        backgroundColor: ThemeColor.PurpleBlack.color,
      ),
      body: ListView(
        children: [
          Header(),
        ],
      ),
    );
  }
}
