import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class SkillCard extends StatelessWidget {
  final SkillData skill;
  final double animationDelay;

  const SkillCard({
    required this.skill,
    required this.animationDelay,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      bool visibility = watch(animationNotifier).value == AnimationType.appear;

      return AnimatedContainer(
        duration: Duration(milliseconds: transitionDefaultDuration),
        curve: Interval(animationDelay, 1.0, curve: Curves.easeInBack),
        transform: Matrix4.diagonal3Values(
          visibility ? 1 : 0,
          visibility ? 1 : 0,
          visibility ? 1 : 0,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_logo(), _name(), _description()],
        ),
      );
    });
  }

  Image _logo() {
    return Image.asset(
      skill.logoPath,
      scale: 0.5,
      fit: BoxFit.fitHeight,
      alignment: Alignment.center,
    );
  }

  Text _name() {
    return Text(
      skill.name,
      style: TextStyle(
        color: ThemeColor.Grey.color,
        fontSize: 20,
      ),
    );
  }

  Text _description() {
    return Text(
      skill.description,
      style: TextStyle(
        fontSize: 15,
      ),
    );
  }
}
