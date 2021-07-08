import 'package:flutter/material.dart';

import 'package:portfolio/enum/asset_resources.dart';
import 'package:portfolio/enum/theme_colors.dart';

class CottonIcon extends StatelessWidget {
  final AnimationController animation;

  const CottonIcon(this.animation);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 300, maxWidth: 300),
      margin: const EdgeInsets.all(16.0),
      child: DualTransitionBuilder(
        animation: animation,
        forwardBuilder: (context, animation, child) {
          return RotationTransition(
            turns: Tween<double>(begin: 1.0, end: -1.0).animate(
              CurvedAnimation(
                curve: Curves.easeOutQuint,
                parent: animation,
              ),
            ),
            child: child,
          );
        },
        reverseBuilder: (context, animation, child) {
          return RotationTransition(
            turns: Tween<double>(begin: -1.0, end: 1.0).animate(
              CurvedAnimation(
                curve: Curves.easeOutQuart,
                parent: animation,
              ),
            ),
            child: child,
          );
        },
        child: ScaleTransition(
          scale: CurvedAnimation(
            curve: Interval(0.0, 1.0, curve: Curves.easeOutBack),
            reverseCurve: Interval(0.2, 1.0, curve: Curves.easeOutBack),
            parent: animation,
          ),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                curve: Interval(0.0, 0.2, curve: Curves.easeInOut),
                reverseCurve: Interval(0.1, 0.2, curve: Curves.easeInOut),
                parent: animation,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: _backgroundStyle(),
              child: _icon(),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _backgroundStyle() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(1000),
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
        borderRadius: BorderRadius.circular(10000),
        border: Border.all(width: 7.0, color: ThemeColor.Background.color),
      ),
      child: Image.asset(AssetResources.CircularCotton.path),
    );
  }
}
