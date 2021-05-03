import 'package:flutter/material.dart';

import 'package:portfolio/controller/transition_controller.dart';
import 'package:portfolio/model/about_me.dart';
import 'package:portfolio/model/portfolio_api_data.dart';
import 'package:portfolio/view/sections/about_me/information_tile.dart';
import 'package:portfolio/view/sections/section_container.dart';

class AboutMe extends StatelessWidget {
  final List<PortfolioAPIData> data = TransitionController.displayedData;
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'About Me',
      subTitle: '自己紹介',
      builder: (data) {
        assert(data.every((e) => e is AboutMeData));

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (int index = 0; index < data.length; index++)
              InformationTile(data: data[index] as AboutMeData, index: index),
          ],
        );
      },
    );
  }
}
