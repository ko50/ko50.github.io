import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/view/sections/root/root.dart';

class SectionRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        Section displayedSection =
            Section.values[watch(displayedSectionIndex).value];

        switch (displayedSection) {
          case Section.root:
            return Column(children: [Expanded(child: Root())]);
          case Section.aboutMe:
            return Text(displayedSection.text);
          case Section.skills:
            return Text(displayedSection.text);
          case Section.works:
            return Text(displayedSection.text);
          case Section.contacts:
            return Text(displayedSection.text);
        }
      },
    );
  }
}
