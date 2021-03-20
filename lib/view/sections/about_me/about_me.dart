import 'package:flutter/material.dart';
import 'package:portfolio/data/about_me.dart';
import 'package:portfolio/view/sections/about_me/information_tile.dart';

import 'package:portfolio/view/sections/section_container.dart';

class AboutMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'About Me',
      subTitle: '自己紹介',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (IntroduceTopic topic in IntroduceTopic.values)
            InformationTile(topic: topic),
        ],
      ),
    );
  }
}
