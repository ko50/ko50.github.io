import 'package:flutter/material.dart';
import 'package:portfolio/helper/theme_colors.dart';

class SectionContainer extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget child;

  SectionContainer({
    required this.title,
    required this.subTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(32.0),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _title(),
          _subTitle(),
          _child(),
        ],
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
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 32.0),
        child: child,
      ),
    );
  }
}
