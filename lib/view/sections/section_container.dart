import 'package:flutter/material.dart';
import 'package:portfolio/controller/transition_controller.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/model_base.dart';
import 'package:portfolio/view/component/common/non_data_telop.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget Function(List<ModelBase>) builder;

  SectionContainer({
    required this.title,
    required this.subTitle,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_title(), _subTitle(), _child()],
      ),
    );
  }

  Container _title() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ThemeColor.PurpleBlack.color)),
      ),
      child: Text(
        title,
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
      child: Text(
        subTitle,
        style: TextStyle(
          color: ThemeColor.PurpleBlack.color,
          fontSize: 15,
        ),
      ),
    );
  }

  Expanded _child() {
    final List<ModelBase> data = TransitionController.displayedData;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: data.isEmpty ? NonDataTelop() : builder(data),
      ),
    );
  }
}
