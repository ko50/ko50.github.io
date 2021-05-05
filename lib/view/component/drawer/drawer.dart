import 'package:flutter/material.dart';

import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/view/component/drawer/drawer_tile.dart';

class ResponsiveDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          drawerHeader(),
          for (Section section in List.from(Section.values).sublist(1))
            SectionTransitionTile(section)
        ],
      ),
    );
  }

  DrawerHeader drawerHeader() {
    return DrawerHeader(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        color: ThemeColor.PurpleBlack.color,
        boxShadow: [BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5)],
        border: Border(
          bottom: BorderSide(color: ThemeColor.WhityPurple.color, width: 4.0),
        ),
      ),
      child: Text(
        'ko\'s Portfolio',
        style: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          color: ThemeColor.Background.color,
        ),
      ),
    );
  }
}
