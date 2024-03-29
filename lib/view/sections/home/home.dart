import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/enum/animation_type.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/view/sections/home/cotton_icon.dart';
import 'package:portfolio/view/sections/home/sorry_not_working.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: Duration(milliseconds: transitionDefaultDuration * 2),
    vsync: this,
  );

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

        return LayoutBuilder(
          builder: (context, detail) {
            return Container(
              constraints: BoxConstraints.expand(),
              decoration: _backgroundStyle(),
              child: LayoutBuilder(
                builder: (context, detail) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: detail.maxHeight),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 32.0),
                          CottonIcon(_controller),
                          _introduction(),
                          SorryNotWorking(_controller),
                          SizedBox(height: 32.0),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
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

  Widget _introduction() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: FadeTransition(
          opacity: CurvedAnimation(
            curve: Curves.easeInOutExpo,
            parent: _controller,
          ),
          child: Text(
            'Hello World, My Name is ko!',
            style: TextStyle(
              color: ThemeColor.PurpleBlack.color,
              fontSize: 35,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
