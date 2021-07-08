import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/skills.dart';

class SkillCard extends StatelessWidget {
  final SkillData skill;
  final double animationDelay;
  final AnimationController animation;

  const SkillCard({
    required this.skill,
    required this.animationDelay,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, detail) {
        return ScaleTransition(
          alignment: Alignment.center,
          scale: CurvedAnimation(
            curve: Interval(animationDelay, 1.0, curve: Curves.easeOutBack),
            reverseCurve: Interval(0, 1.0, curve: Curves.easeOutBack),
            parent: animation,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0),
            width: detail.maxWidth,
            child: Stack(
              children: [
                Positioned(
                  top: 10.0,
                  right: 0.0,
                  bottom: 0.0,
                  left: 10.0,
                  child: Container(color: ThemeColor.PurpleBlack.color),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0, right: 10.0),
                  padding: const EdgeInsets.all(16.0),
                  width: detail.maxWidth - 10.0,
                  decoration: BoxDecoration(
                    color: ThemeColor.Background.color,
                    border: Border.all(
                      width: 0.5,
                      color: ThemeColor.PurpleBlack.color,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [_logo(), _name(), _description()],
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 9.9,
                  bottom: 9.9,
                  left: 0.0,
                  child: FadeTransition(
                    opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
                      CurvedAnimation(
                        curve: Interval(animationDelay + 0.2, 1.0,
                            curve: Curves.easeOutExpo),
                        reverseCurve: Curves.easeOutExpo,
                        parent: animation,
                      ),
                    ),
                    child: Container(color: ThemeColor.PurpleBlack.color),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SvgPicture _logo() {
    return SvgPicture.network(
      skill.iconUrl,
      height: 30,
      fit: BoxFit.fitHeight,
      alignment: Alignment.center,
    );
  }

  Padding _name() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
