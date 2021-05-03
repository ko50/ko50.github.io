import 'package:flutter/material.dart';

import 'package:portfolio/controller/transition_controller.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/portfolio_api_data.dart';
import 'package:portfolio/view/component/common/non_data_telop.dart';

class SectionContainer extends StatelessWidget {
  final Section section;
  final Widget Function(List<PortfolioAPIData>) builder;

  SectionContainer({
    required this.section,
    required this.builder, 
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, detail) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: detail.maxHeight),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 64.0),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: detail.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [_title(), _subTitle(), _child()],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _title() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ThemeColor.PurpleBlack.color)),
      ),
      child: Text(
        section.title,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: ThemeColor.PurpleBlack.color,
        ),
      ),
    );
  }

  Container _subTitle() {
    return Container(
      margin: EdgeInsets.only(bottom: 32, right: 32.0, left: 32.0),
      child: Text(
        section.subTitle,
        style: TextStyle(
          color: ThemeColor.PurpleBlack.color,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _child() {
    final List<PortfolioAPIData> data = TransitionController.displayedData;

    return data.isEmpty ? NonDataTelop() : builder(data);
  }
}
