import 'package:flutter/material.dart';
import 'package:portfolio/data/works.dart';

import 'package:portfolio/view/sections/section_container.dart';
import 'package:portfolio/view/sections/works/work_card.dart';

class Works extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Works',
      subTitle: 'やったこと',
      child: LayoutBuilder(builder: (context, detail) {
        return Container(
          constraints: BoxConstraints(maxWidth: 600),
          child: ListView.builder(
            itemCount: WorkData.values.length,
            itemBuilder: (context, index) {
              WorkData work = WorkData.values[index];

              return WorkCard(work: work);
            },
          ),
        );
      }),
    );
  }
}
