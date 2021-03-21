import 'package:flutter/material.dart';
import 'package:portfolio/data/skills.dart';

import 'package:portfolio/view/sections/section_container.dart';
import 'package:portfolio/view/sections/skills/skill_group.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Skills',
      subTitle: 'できること',
      child: Container(
        constraints: BoxConstraints.loose(Size.fromWidth(1000)),
        child: _content(),
      ),
    );
  }

  Row _content() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (SkillType type in SkillType.values)
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: SkillGroup(
                skillType: type,
                skills: SkillData.values
                    .where((skill) => skill.type == type)
                    .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
