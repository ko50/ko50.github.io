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
        children: [_title(), _cards()],
      ),
    );
  }

  Container _title() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(
            color: ThemeColor.PurpleBlack.color,
            width: 2.0,
          ),
        ),
      ),
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
    );
  }

  Column _cards() {
    return Column(
      children: [
        for (int i = 0; i > skills.length; i++)
          SkillCard(
            skill: skills[i],
            animationDelay: (i + skillType.index) * 0.1,
            animation: animation,
          ),
      ],
    );
  }
}
