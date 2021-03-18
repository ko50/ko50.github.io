import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class SectionTransitionButton extends StatefulWidget {
  final void Function() onPressed;
  final Section transitionTarget;

  SectionTransitionButton({
    required this.onPressed,
    required this.transitionTarget,
  });

  @override
  _SectionTransitionButtonState createState() =>
      _SectionTransitionButtonState();
}

class _SectionTransitionButtonState extends State<SectionTransitionButton> {
  bool _isHovered(int currentHovered) =>
      currentHovered == widget.transitionTarget.index && currentHovered != -1;

  Widget _text(bool isHovered) => AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: 250),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: isHovered
              ? ThemeColor.WhityPurple.color
              : ThemeColor.Background.color,
        ),
        child: Text(widget.transitionTarget.text),
      );

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      ValueNotifier<int> notifier = watch(hoveredSectionIndex);

      return MouseRegion(
        onEnter: (_) => notifier.value = widget.transitionTarget.index,
        onExit: (_) => notifier.value = -1,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0),
          padding: EdgeInsets.only(bottom: 2.0),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: ThemeColor.WhityPurple.color))),
          child: GestureDetector(
            onTap: widget.onPressed,
            behavior: HitTestBehavior.opaque,
            child: _text(_isHovered(notifier.value)),
          ),
        ),
      );
    });
  }
}
