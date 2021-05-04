import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/model/enum/skill_type.dart';
import 'package:portfolio/model/skills.dart';
import 'package:portfolio/view/sections/section_container.dart';
import 'package:portfolio/view/sections/skills/skill_group.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      section: Section.skills,
      appearDuration: Duration(milliseconds: transitionDefaultDuration * 2),
      hideDuration: Duration(milliseconds: transitionDefaultDuration),
      builder: (data, animation) {
        assert(data.every((e) => e is SkillData));

        return _content(data.whereType<SkillData>().toList(), animation);
      },
    );
  }

  Widget _content(List<SkillData> data, AnimationController animation) {
    return LayoutBuilder(
      builder: (context, detail) {
        return Wrap(
          alignment: WrapAlignment.center,
          spacing: 32.0,
          runSpacing: 32.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: _selectSkillTypes(data, detail, animation),
        );
      },
    );
  }

  List<Widget> _selectSkillTypes(List<SkillData> data, BoxConstraints detail,
      AnimationController animation) {
    return SkillType.values.map((type) {
      final List<SkillData> skills =
          data.where((skill) => skill.type == type).toList();

      if (skills.isEmpty) return Container();

      return Container(
        width: detail.maxWidth / (SkillType.values.length + 1),
        constraints: BoxConstraints(minWidth: 200.0),
        child: SkillGroup(
          skillType: type,
          skills: skills,
          animation: animation,
        ),
      );
    }).toList();
  }
}
