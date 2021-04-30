import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/view/sections/about_me/about_me.dart';
import 'package:portfolio/view/sections/contacts/contacts.dart';
import 'package:portfolio/view/sections/root/root.dart';
import 'package:portfolio/view/sections/skills/skills.dart';
import 'package:portfolio/view/sections/works/works.dart';

class SectionRouter extends StatefulWidget {
  @override
  _SectionRouterState createState() => _SectionRouterState();
}

class _SectionRouterState extends State<SectionRouter> {
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
            return AboutMe();
          case Section.skills:
            return Skills();
          case Section.works:
            return Works();
          case Section.contacts:
            return Contacts();
        }
      },
    );
  }
}
