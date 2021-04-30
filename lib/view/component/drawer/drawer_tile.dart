import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/controller/transition_controller.dart';

import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/providers.dart';

class SectionTransitionTile extends StatelessWidget {
  final Section transitionTarget;

  SectionTransitionTile(this.transitionTarget);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      TransitionController controller = watch(transitionController);
      final displayedNotifier = watch(displayedSectionIndex);
      bool focused = displayedNotifier.value == transitionTarget.index;

      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () async {
            controller.transition(transitionTarget);
            await Future.delayed(
              drawerAnimateDuration,
              () => Navigator.of(context).pop(),
            );
          },
          behavior: HitTestBehavior.opaque,
          child: _content(focused),
        ),
      );
    });
  }

  AnimatedContainer _content(bool focused) {
    return AnimatedContainer(
      duration: drawerAnimateDuration,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.symmetric(vertical: 2.0),
      decoration: BoxDecoration(
        boxShadow: [
          if (focused) BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5),
        ],
        // border: Border.symmetric(
        //   horizontal: BorderSide(
        //     color: focused
        //         ? ThemeColor.WhityPurple.color
        //         : ThemeColor.Background.color,
        //     width: 4.0,
        //   ),
        // ),
        color: focused
            ? ThemeColor.PurpleBlack.color
            : ThemeColor.Background.color,
      ),
      child: AnimatedDefaultTextStyle(
        duration: drawerAnimateDuration,
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
    );
  }
}
