import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/data/about_me.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class InformationTile extends StatelessWidget {
  final IntroduceTopic topic;

  static const double translateXOffset = 32.0;

  InformationTile({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        AnimationType visibleState = watch(animationNotifier).value;

        return AnimatedOpacity(
          duration: Duration(milliseconds: transitionDefaultDuration),
          curve: Interval(
            topic.index * 0.1,
            (1.0 - (IntroduceTopic.values.length * 0.1)) + (topic.index * 0.1),
          ),
          opacity: visibleState == AnimationType.appear ? 1 : 0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: transitionDefaultDuration),
            curve: Interval(
              topic.index * 0.1,
              (1.0 - (IntroduceTopic.values.length * 0.1)) +
                  (topic.index * 0.1),
              curve: Curves.easeOutCubic,
            ),
            margin: EdgeInsets.only(
              bottom: 16.0,
              left: visibleState == AnimationType.appear ? translateXOffset : 0,
            ),
            padding: EdgeInsets.only(left: 8.0, right: translateXOffset),
            decoration: BoxDecoration(
              border: Border(
                  left: BorderSide(
                      width: 6.0, color: ThemeColor.PurpleBlack.color)),
            ),
            child: _content(),
          ),
        );
      },
    );
  }

  Column _content() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          topic.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: ThemeColor.PurpleBlack.color,
          ),
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            topic.content,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
