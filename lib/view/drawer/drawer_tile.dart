import 'package:flutter/material.dart';

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

      return ListTile(
        tileColor: focused
            ? ThemeColor.PurpleBlack.color
            : ThemeColor.Background.color,
        onTap: () => displayedNotifier.value = transitionTarget.index,
        title: Text(
          transitionTarget.text,
          style: TextStyle(
            color: focused
                ? ThemeColor.Background.color
                : ThemeColor.PurpleBlack.color,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
      );
    });
  }
}
