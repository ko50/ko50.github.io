import 'package:flutter/material.dart';

import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/enum/skill_type.dart';
import 'package:portfolio/model/skills.dart';
import 'package:portfolio/view/sections/skills/skill_card.dart';

class SkillGroup extends StatelessWidget {
  final SkillType skillType;
  final List<SkillData> skills;
  final AnimationController animation;

  const SkillGroup({
    required this.skillType,
    required this.skills,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_title(), ..._cards()],
      ),
    );
  }

  Widget _title() {
    return ScaleTransition(
      scale: CurvedAnimation(
        curve: Interval(0.0, 0.4, curve: Curves.easeOutCirc),
        reverseCurve: Interval(0.0, 0.6, curve: Curves.easeOutBack),
        parent: animation,
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(
              color: ThemeColor.PurpleBlack.color,
              width: 2.0,
            ),
          ),
        ),
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: CurvedAnimation(
            curve: Interval(0.4, 1.0, curve: Curves.easeOutQuint),
            reverseCurve: Interval(0.7, 1.0, curve: Curves.easeOutCubic),
            parent: animation,
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                skillType.name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: ThemeColor.PurpleBlack.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _cards() {
    return [
      for (int i = 0; i < skills.length; i++)
        SkillCard(
          skill: skills[i],
          animationDelay: (i + skillType.index) * 0.2,
          animation: animation,
        ),
    ];
  }
}
