import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/controller/transition_controller.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/providers.dart';

class TitleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        TransitionController controller = watch(transitionController);

        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => controller.transition(Section.root),
            child: Text(
              Section.values[0].title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: ThemeColor.Background.color,
              ),
            ),
          ),
        );
      },
    );
  }
}
