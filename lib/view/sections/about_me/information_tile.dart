import 'package:flutter/material.dart';

import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/about_me.dart';

class InformationTile extends StatelessWidget {
  final AboutMeData data;
  final int index;
  final AnimationController animation;

  static const double maxWidth = 300;

  InformationTile({
    required this.data,
    required this.index,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      width: InformationTile.maxWidth,
      child: Stack(
        children: [
          SizeTransition(
            axis: Axis.horizontal,
            sizeFactor: CurvedAnimation(
              curve: Interval(
                (index + 2) * 0.1,
                (1.0 - (4 * 0.1)) + (index * 0.1),
                curve: Curves.easeOutQuint,
              ),
              parent: animation,
            ),
            child: _content(),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            child: SizeTransition(
              axis: Axis.horizontal,
              sizeFactor: Tween<double>(
                begin: 1.0,
                end: 0.0,
              ).animate(
                CurvedAnimation(
                  curve: Interval(
                    (index + 3) * 0.1,
                    (1.0 - (4 * 0.1)) + (index * 0.1),
                    curve: Curves.easeOutCirc,
                  ),
                  parent: animation,
                ),
              ),
              child: SizeTransition(
                axis: Axis.horizontal,
                axisAlignment: 1.0,
                sizeFactor: Tween<double>(begin: 0, end: 1).animate(
                  CurvedAnimation(
                    curve: Interval(
                      index * 0.1,
                      (1.0 - (4 * 0.1)) + (index * 0.1),
                      curve: Curves.easeOutCirc,
                    ),
                    parent: animation,
                  ),
                ),
                child: Container(
                  color: ThemeColor.PurpleBlack.color,
                  width: InformationTile.maxWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _content() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      // constraints: BoxConstraints(maxWidth: InformationTile.maxWidth),
      width: InformationTile.maxWidth,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 6.0, color: ThemeColor.PurpleBlack.color),
          bottom: BorderSide(width: 1.0, color: ThemeColor.PurpleBlack.color),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ThemeColor.PurpleBlack.color,
            ),
          ),
          Text(
            data.content,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
