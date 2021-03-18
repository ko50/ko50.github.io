import 'package:flutter/material.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/view/component/header/section_transition_button.dart';
import 'package:portfolio/view/component/header/title_button.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        backgroundColor: ThemeColor.PurpleBlack.color,
        flexibleSpace: Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              TitleButton(),
              Expanded(child: Container()),
              for (Section section in List.from(Section.values).sublist(1))
                SectionTransitionButton(transitionTarget: section)
            ],
          ),
        ),
      ),
    );
  }
}
