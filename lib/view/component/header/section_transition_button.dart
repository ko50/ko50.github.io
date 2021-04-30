import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/controller/transition_controller.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/providers.dart';

class SectionTransitionButton extends StatefulWidget {
  final Section transitionTarget;

  SectionTransitionButton({required this.transitionTarget});

  @override
  _SectionTransitionButtonState createState() =>
      _SectionTransitionButtonState();
}

class _SectionTransitionButtonState extends State<SectionTransitionButton> {
  bool _highlighted(int hoveredIndex, int displayedIndex) =>
      hoveredIndex == widget.transitionTarget.index ||
      (hoveredIndex == -1 && displayedIndex == 0) ||
      (displayedIndex != 0 && displayedIndex == widget.transitionTarget.index);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      TransitionController controller = watch(transitionController);
      ValueNotifier<int> hoverNotifier = watch(hoveredSectionIndex),
          displayNotifier = watch(displayedSectionIndex);

      return MouseRegion(
        onEnter: (_) => hoverNotifier.value = widget.transitionTarget.index,
        onExit: (_) => hoverNotifier.value = -1,
        cursor: SystemMouseCursors.click,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          padding: EdgeInsets.only(bottom: 2.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: ThemeColor.WhityPurple.color))),
          child: GestureDetector(
            onTap: () => controller.transition(widget.transitionTarget),
            behavior: HitTestBehavior.opaque,
            child: _text(
              _highlighted(
                hoverNotifier.value,
                displayNotifier.value,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _text(bool highlighted) => AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 200),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: highlighted
              ? ThemeColor.Background.color
              : ThemeColor.WhityPurple.color,
        ),
        child: Text(widget.transitionTarget.text),
      );
}
