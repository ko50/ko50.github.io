import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class TitleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      final notifier = watch(displayedSectionIndex);

      return GestureDetector(
        onTap: () => notifier.value = 0,
        child: Text(
          Section.values[0].text,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w700,
            color: ThemeColor.Background.color,
          ),
        ),
      );
    });
  }
}
