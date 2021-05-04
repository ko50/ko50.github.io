import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

import 'package:portfolio/enum/theme_colors.dart';

class NonDataTelop extends StatefulWidget {
  final List<String> messages;
  final AnimationController animation;

  const NonDataTelop({
    this.messages = const ['データがありません', '通信に失敗しました'],
    required this.animation,
  });

  @override
  _NonDataTelopState createState() => _NonDataTelopState();
}

class _NonDataTelopState extends State<NonDataTelop>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true, period: Duration(seconds: 3));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [for (String text in widget.messages) _text(text)],
    );
  }

  Widget _text(String text) {
    return Container(
      height: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [for (int i = 0; i < text.length; i++) _char(i, text[i])],
      ),
    );
  }

  Widget _char(int index, String char) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            curve: Interval(index * 0.05, 1.0, curve: Curves.bounceOut),
            reverseCurve: Interval(index * 0.05, 1.0, curve: Curves.bounceIn),
            parent: _controller,
          ),
        ),
        child: FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              curve: Interval(0.0, 0.5, curve: Curves.easeInOutBack),
              parent: widget.animation,
            ),
          ),
          child: SlideTransition(
            position: Tween(begin: Offset(50.0, 0.0), end: Offset.zero).animate(
              CurvedAnimation(
                curve: Interval(index * 0.05, 1.0, curve: Curves.easeOutBack),
                parent: widget.animation,
              ),
            ),
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  curve:
                      Interval(index * 0.05, 1.0, curve: Curves.easeInOutBack),
                  parent: widget.animation,
                ),
              ),
              child: Text(
                char,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                  color: ThemeColor.Grey.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
