import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/data/skills.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/asset_resources.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class SkillCard extends StatelessWidget {
  final SkillData skill;
  final double animationDelay;

  const SkillCard({
    required this.skill,
    required this.animationDelay,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      bool visibility = watch(animationNotifier).value == AnimationType.appear;

      return AnimatedOpacity(
        duration: Duration(milliseconds: transitionDefaultDuration),
        curve: Interval(animationDelay + 0.2, 1.0),
        opacity: visibility ? 1 : 0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: transitionDefaultDuration),
          curve: Interval(animationDelay, 1.0, curve: Curves.easeInOutBack),
          margin: EdgeInsets.all(16.0),
          padding: EdgeInsets.all(16.0),
          transform: Matrix4.diagonal3Values(
            visibility ? 1 : 0.1,
            visibility ? 1 : 0.1,
            visibility ? 1 : 0.1,
          ),
          decoration: BoxDecoration(
            color: ThemeColor.Background.color,
            boxShadow: [
              BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5.0),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_logo(), _name(), _description()],
          ),
        ),
      );
    });
  }

  Image _logo() {
    return Image.asset(
      AssetResources.CircularCotton.path, // skill.logoPath,
      height: 20,
      fit: BoxFit.fitHeight,
      alignment: Alignment.center,
    );
  }

  Padding _name() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        skill.name,
        style: TextStyle(
          color: ThemeColor.Grey.color,
          fontSize: 20,
        ),
      ),
    );
  }

  Text _description() {
    return Text(
      skill.description,
      style: TextStyle(
        fontSize: 12,
      ),
    );
  }
}
