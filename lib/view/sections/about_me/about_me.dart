import 'package:flutter/material.dart';

import 'package:portfolio/view/sections/section_container.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'About Me',
      subTitle: '自己紹介',
      child: Text('About Me'),
    );
  }
}
