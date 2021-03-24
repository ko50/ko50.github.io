import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants.dart';

import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/view/sections/root/cotton_icon.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, detail) {
        return Container(
          width: double.infinity,
          decoration: _backgroundStyle(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CottonIcon(),
              introduction(),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _backgroundStyle() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white, Color(0xfffdfaff)],
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 5.0,
          color: ThemeColor.Shadow.color,
        ),
      ],
    );
  }

  Widget introduction() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Consumer(
          builder: (context, watch, _) {
            AnimationType visibleState = watch(animationNotifier).value;

            return AnimatedOpacity(
              duration: Duration(milliseconds: transitionDefaultDuration - 200),
              opacity: visibleState == AnimationType.appear ? 1 : 0,
              curve: Curves.easeInOut,
              child: Text(
                'Hello World, My Name is ko!',
                style: TextStyle(
                  color: ThemeColor.PurpleBlack.color,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
