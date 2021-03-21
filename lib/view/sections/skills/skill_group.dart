import 'package:flutter/material.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/view/sections/skills/skill_card.dart';

class SkillGroup extends StatelessWidget {
  final SkillType skillType;
  final List<SkillData> skills;

  const SkillGroup({
    required this.skillType,
    required this.skills,
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
          horizontal: BorderSide(
            color: ThemeColor.PurpleBlack.color,
            width: 2.0,
          ),
        ),
      ),
      child: Text(
        skillType.name,
        style: TextStyle(
          fontSize: 30,
          color: ThemeColor.PurpleBlack.color,
        ),
      ),
    );
  }

  ListView _cards() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: skills.length,
      itemBuilder: (context, index) {
        SkillData skill = skills[index];

        return SkillCard(
          skill: skill,
          animationDelay: skill.index * 0.1,
        );
      },
    );
  }
}
