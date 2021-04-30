import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/enum/screen_type.dart';
import 'package:portfolio/model/enum/skill_type.dart';
import 'package:portfolio/model/skills.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/view/sections/section_container.dart';
import 'package:portfolio/view/sections/skills/skill_group.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
        title: 'Skills',
        subTitle: 'できること',
        builder: (data) {
          assert(data.every((e) => e is SkillData));

          return Consumer(
            builder: (context, watch, _) {
              final ScreenType screen = watch(screenType).value;

              return Expanded(
                child: Container(
                  constraints: BoxConstraints.loose(Size.fromWidth(1000)),
                  child: screen == ScreenType.desktop
                      ? _content(data.whereType<SkillData>().toList())
                      : _scaledContent(data.whereType<SkillData>().toList()),
                ),
              );
            },
          );
        });
  }

  ListView _scaledContent(List<SkillData> data) {
    return ListView.builder(
      itemCount: SkillType.values.length,
      itemBuilder: (context, index) {
        SkillType type = SkillType.values[index];

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
          child: SkillGroup(
            skillType: type,
            skills: data.where((skill) => skill.type == type).toList(),
          ),
        );
      },
    );
  }

  Wrap _content(List<SkillData> data) {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        for (SkillType type in SkillType.values)
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: SkillGroup(
                skillType: type,
                skills: data.where((skill) => skill.type == type).toList(),
              ),
            ),
          ),
      ],
    );
  }
}
