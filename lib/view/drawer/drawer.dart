import 'package:flutter/material.dart';
import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/view/drawer/drawer_tile.dart';

class ResponsiveDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('ko\'s Portfolio'),
            decoration: BoxDecoration(color: ThemeColor.PurpleBlack.color),
          ),
          for (Section section in List.from(Section.values).sublist(1))
            SectionTransitionTile(section)
        ],
      ),
    );
  }
}
