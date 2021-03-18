import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/view/component/root/root.dart';

class SectionRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        Section displayedSection =
            Section.values[watch(displayedSectionIndex).value];

        switch (displayedSection) {
          case Section.root:
            return Root();
          case Section.aboutMe:
            return Root();
          case Section.skills:
            return Root();
          case Section.works:
            return Root();
          case Section.contacts:
            return Root();
        }
      },
    );
  }
}
