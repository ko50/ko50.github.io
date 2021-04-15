import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/asset_resources.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class CottonIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final visibilityState = watch(animationNotifier).value;

        return AnimatedContainer(
          duration: Duration(milliseconds: transitionDefaultDuration),
          curve: Curves.easeInOutBack,
          width: visibilityState == AnimationType.appear ? 300 : 0,
          constraints: BoxConstraints(maxWidth: 300, maxHeight: 300),
          margin: EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: transitionDefaultDuration - 200),
              curve: Curves.easeOut,
              opacity: visibilityState == AnimationType.appear ? 1 : 1,
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: _backgroundStyle(),
                child: _icon(),
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
