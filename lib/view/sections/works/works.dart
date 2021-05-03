import 'package:flutter/material.dart';

import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/model/works.dart';
import 'package:portfolio/view/sections/section_container.dart';
import 'package:portfolio/view/sections/works/work_card.dart';

class Works extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      section: Section.works,
      builder: (data, animation) {
        assert(data.every((e) => e is WorkData));

        return Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) => WorkCard(
              work: data[index] as WorkData,
              index: index,
              animation: animation,
            ),
          ),
        );
      },
    );
  }
}
