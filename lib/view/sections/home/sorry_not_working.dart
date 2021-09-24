import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/enum/theme_colors.dart';

class SorryNotWorking extends StatefulWidget {
  final Animation<double> animation;

  const SorryNotWorking(this.animation, {Key? key}) : super(key: key);

  @override
  _SorryNotWorkingState createState() => _SorryNotWorkingState();
}

class _SorryNotWorkingState extends State<SorryNotWorking> {
  Color _color = ThemeColor.PaleGrey.color;

  void _selectRandomColor() {
    setState(
      () => _color = (List.from(Colors.accents)
            ..shuffle(Random(DateTime.now().second)))
          .first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(0.0, 1.0),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          curve: Curves.easeInOutQuart,
          parent: widget.animation,
        ),
      ),
      child: FadeTransition(
        opacity: CurvedAnimation(
          curve: Curves.easeInOutExpo,
          parent: widget.animation,
        ),
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Stack(
            children: [
              _card(),
              Positioned.fill(child: _pressable()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _pressable() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: _color,
        highlightColor: Colors.transparent,
        onTap: () => _selectRandomColor(),
      ),
    );
  }

  Widget _card() {
    return Container(
      padding: EdgeInsets.all(16.0),
      constraints: BoxConstraints(minHeight: 100.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: ThemeColor.PurpleBlack.color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5.0)],
      ),
      child: AnimatedSize(
        duration: Duration(milliseconds: 500),
        alignment: Alignment.center,
        curve: Curves.easeOutQuart,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.stream,
                color: _color,
                size: 25.0,
              ),
              SizedBox(width: 10.0),
              Flexible(child: _text()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text() {
    return AnimatedTextKit(
      totalRepeatCount: 1000,
      animatedTexts: [
        TypewriterAnimatedText(
          "このサイトは現在動作していません",
          curve: Curves.easeOutCirc,
          cursor: "|",
          speed: Duration(milliseconds: 100),
          textAlign: TextAlign.left,
          textStyle: TextStyle(
            color: _color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TypewriterAnimatedText(
          "管理者がサーバーの証明書の発行をサボっているからです",
          curve: Curves.easeOutCirc,
          cursor: "|",
          speed: Duration(milliseconds: 100),
          textAlign: TextAlign.left,
          textStyle: TextStyle(
            color: _color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        TypewriterAnimatedText(
          "僕が証明書を更新できるように\nTwitterをフォローして応援してください →@ko_CottonLove",
          curve: Curves.easeOutCirc,
          cursor: "|",
          speed: Duration(milliseconds: 100),
          textAlign: TextAlign.left,
          textStyle: TextStyle(
            color: _color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
