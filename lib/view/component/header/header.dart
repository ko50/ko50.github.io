import 'package:flutter/material.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/view/component/header/section_transition_button.dart';
import 'package:portfolio/view/component/header/title_button.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.PurpleBlack.color,
          boxShadow: <BoxShadow>[BoxShadow(blurRadius: 5)],
          border: Border(
            bottom: BorderSide(
              color: ThemeColor.WhityPurple.color,
              width: 4.0,
            ),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TitleButton(),
            Expanded(child: Container()),
            for (Section section in List.from(Section.values).sublist(1))
              SectionTransitionButton(transitionTarget: section)
          ],
        ),
      ),
    );
  }
}
