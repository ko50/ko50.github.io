import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/data/works.dart';
import 'package:portfolio/helper/animation_type.dart';

import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class WorkCard extends StatelessWidget {
  final WorkData work;

  const WorkCard({required this.work});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final visibility =
            watch(animationNotifier).value == AnimationType.appear;

        return AnimatedOpacity(
          duration: Duration(milliseconds: transitionDefaultDuration),
          opacity: visibility ? 1 : 0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: transitionDefaultDuration),
            curve: Interval(work.index * 0.1, 1.0, curve: Curves.easeInOutBack),
            transform: Matrix4.diagonal3Values(1, visibility ? 1 : 0.1, 1),
            constraints: BoxConstraints.loose(Size.fromHeight(400)),
            decoration: BoxDecoration(
              color: ThemeColor.Background.color,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: ThemeColor.PurpleBlack.color),
              boxShadow: [
                BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5.0)
              ],
            ),
            child: AspectRatio(
              aspectRatio: 6 / 5,
              child: Column(
                children: [Expanded(child: _snapshot()), _information()],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _snapshot() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 2)],
      ),
      child: Image.asset(work.snapshotPath, fit: BoxFit.fitWidth),
    );
  }

  Container _information() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            work.title,
            style: TextStyle(
              color: ThemeColor.PurpleBlack.color,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              work.description,
              style: TextStyle(fontSize: 13),
            ),
          ),
          Text(
            'Tag: ${work.tags.join(', ')}',
            style: TextStyle(
              color: ThemeColor.PurpleBlack.color,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
