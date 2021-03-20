import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/helper/sections.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/view/sections/about_me/about_me.dart';
import 'package:portfolio/view/sections/contacts/contacts.dart';
import 'package:portfolio/view/sections/root/root.dart';
import 'package:portfolio/view/sections/skills/skills.dart';
import 'package:portfolio/view/sections/works/works.dart';

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
            return Column(children: [Expanded(child: AboutMe())]);
          case Section.skills:
            return Column(children: [Expanded(child: Skills())]);
          case Section.works:
            return Column(children: [Expanded(child: Works())]);
          case Section.contacts:
            return Column(children: [Expanded(child: Contacts())]);
        }
      },
    );
  }
}
