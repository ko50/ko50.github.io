import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/data/skills.dart';

import 'package:portfolio/view/sections/section_container.dart';
import 'package:portfolio/view/sections/skills/skill_group.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Skills',
      subTitle: 'できること',
      child: LayoutBuilder(
        builder: (context, detail) {
          return Container(
            constraints: BoxConstraints.loose(Size.fromWidth(1000)),
            child: detail.maxWidth <= widthBreakpoint
                ? _scaledContent()
                : _extendedContent(),
          );
        },
      ),
    );
  }

  ListView _scaledContent() {
    return ListView.builder(
      itemCount: SkillType.values.length,
      itemBuilder: (context, index) {
        SkillType type = SkillType.values[index];

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
          child: SkillGroup(
            skillType: type,
            skills:
                SkillData.values.where((skill) => skill.type == type).toList(),
          ),
        );
      },
    );
  }

  Row _extendedContent() {
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
