import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class SectionTransitionTile extends StatelessWidget {
  final Section transitionTarget;

  SectionTransitionTile(this.transitionTarget);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final displayedNotifier = watch(displayedSectionIndex);
      bool focused = displayedNotifier.value == transitionTarget.index;

      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            displayedNotifier.value = transitionTarget.index;
            await Future.delayed(
              Duration(milliseconds: 300),
              () => Navigator.of(context).pop(),
            );
          },
          behavior: HitTestBehavior.opaque,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.all(16.0),
            color: focused
                ? ThemeColor.PurpleBlack.color
                : ThemeColor.Background.color,
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                color: focused
                    ? ThemeColor.Background.color
                    : ThemeColor.PurpleBlack.color,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
              child: Text(
                transitionTarget.text,
              ),
            ),
          ),
        ),
      );
    });
  }
}
