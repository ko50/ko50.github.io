import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/providers.dart';

class AnimatedCopyright extends StatefulWidget {
  @override
  _AnimatedCopyrightState createState() => _AnimatedCopyrightState();
}

class _AnimatedCopyrightState extends State<AnimatedCopyright>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
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
        !watch(loading).value ? _controller.forward() : _controller.reverse();

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 25,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(color: ThemeColor.PaleGrey.color)),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: [
                FadeTransition(
                  opacity: Tween(begin: 1.0, end: 0.0).animate(
                    CurvedAnimation(
                      curve: Interval(0.0, 1.0, curve: Curves.easeInQuart),
                      parent: _controller,
                    ),
                  ),
                  child: ScaleTransition(
                    scale: Tween(begin: 1.0, end: 0.0).animate(
                      CurvedAnimation(
                        curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                        parent: _controller,
                      ),
                    ),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        valueColor: ColorTween(
                          begin: ThemeColor.WhityPurple.color,
                          end: ThemeColor.Grey.color,
                        ).animate(_controller),
                      ),
                    ),
                  ),
                ),
                FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      curve: Interval(0.0, 1.0, curve: Curves.easeInQuart),
                      parent: _controller,
                    ),
                  ),
                  child: ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        curve: Interval(0.0, 1.0, curve: Curves.easeInBack),
                        parent: _controller,
                      ),
                    ),
                    child: _copyRight(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _copyRight() {
    return Text(
      '© 2020 ko',
      style: TextStyle(
        color: ThemeColor.PaleGrey.color,
        fontWeight: FontWeight.w100,
        fontSize: 10,
      ),
    );
  }
}
