import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/enum/animation_type.dart';
import 'package:portfolio/enum/asset_resources.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/providers.dart';

class CottonIcon extends StatefulWidget {
  @override
  _CottonIconState createState() => _CottonIconState();
}

class _CottonIconState extends State<CottonIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: transitionDefaultDuration * 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final visibilityState = watch(animationNotifier).value;

        visibilityState == AnimationType.appear
            ? _controller.forward()
            : _controller.reverse();

        return Container(
          constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
          margin: EdgeInsets.all(16.0),
          child: RotationTransition(
            turns: CurvedAnimation(
              curve: Curves.easeOutBack,
              reverseCurve: Curves.easeInOutBack,
              parent: _controller,
            ),
            child: ScaleTransition(
              scale: CurvedAnimation(
                curve: Curves.easeOutBack,
                reverseCurve: Curves.easeInOutBack,
                parent: _controller,
              ),
              child: FadeTransition(
                opacity: Tween(begin: 0.0, end: 4.0).animate(
                  CurvedAnimation(
                    curve: Interval(0.0, 0.4, curve: Curves.easeInOut),
                    reverseCurve: Interval(0.2, 0.6, curve: Curves.easeInOut),
                    parent: _controller,
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: _backgroundStyle(),
                  child: _icon(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _backgroundStyle() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(200),
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          ThemeColor.PurplePink.color,
          ThemeColor.PurpleBlack.color,
        ],
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 5.0,
          color: ThemeColor.Shadow.color,
        ),
      ],
    );
  }

  Container _icon() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        border: Border.all(width: 7.0, color: ThemeColor.Background.color),
      ),
      child: Image.asset(AssetResources.CircularCotton.path),
    );
  }
}
