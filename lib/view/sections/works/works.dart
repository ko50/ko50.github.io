import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/model/works.dart';
import 'package:portfolio/view/sections/section_container.dart';
import 'package:portfolio/view/sections/works/work_card.dart';

class Works extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      section: Section.works,
      appearDuration: Duration(milliseconds: transitionDefaultDuration * 2),
      builder: (data, animation) {
        assert(data.every((e) => e is WorkData));

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < data.length; i++)
              WorkCard(
                work: data[i] as WorkData,
                index: i,
                animation: animation,
              ),
          ],
        );
      },
    );
  }
}
