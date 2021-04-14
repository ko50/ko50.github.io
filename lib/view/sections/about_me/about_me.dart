import 'package:flutter/material.dart';

import 'package:portfolio/controller/transition_controller.dart';
import 'package:portfolio/model/about_me.dart';
import 'package:portfolio/model/model_base.dart';
import 'package:portfolio/view/component/common/non_data_telop.dart';
import 'package:portfolio/view/sections/about_me/information_tile.dart';
import 'package:portfolio/view/sections/section_container.dart';

class AboutMe extends StatelessWidget {
  final List<ModelBase> data = TransitionController.displayedData;
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'About Me',
      subTitle: '自己紹介',
      child: ConstrainedBox(
        constraints: BoxConstraints.loose(Size.fromWidth(400)),
        child: Builder(
          builder: (context) {
            if (data.isEmpty) return NonDataTelop();

            assert(data[0].runtimeType == AboutMeData);

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => InformationTile(
                data: data[index] as AboutMeData,
                index: index,
              ),
            );
          },
        ),
      ),
    );
  }
}
