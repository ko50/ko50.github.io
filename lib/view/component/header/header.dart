import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/enum/screen_type.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/view/component/header/section_transition_button.dart';
import 'package:portfolio/view/component/header/title_button.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Consumer(
        builder: (context, watch, _) {
          final ScreenType screen = watch(screenType).value;

          return AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: ThemeColor.PurpleBlack.color,
                boxShadow: <BoxShadow>[
                  BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5)
                ],
                border: Border(
                    bottom: BorderSide(
                        color: ThemeColor.WhityPurple.color, width: 4.0)),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
              child: content(screen == ScreenType.desktop),
            ),
          );
        },
      ),
    );
  }

  Widget content(bool buttonsVisibility) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TitleButton(),
        Expanded(child: Container()),
        if (buttonsVisibility)
          for (Section section in List.from(Section.values).sublist(1))
            SectionTransitionButton(transitionTarget: section)
      ],
    );
  }
}
