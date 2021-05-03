import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/enum/animation_type.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/about_me.dart';
import 'package:portfolio/providers.dart';

class InformationTile extends StatefulWidget {
  final AboutMeData data;
  final int index;
  final AnimationController animation;

  static const double maxWidth = 300;

  InformationTile({
    required this.data,
    required this.index,
    required this.animation,
  });

  @override
  _InformationTileState createState() => _InformationTileState();
}

class _InformationTileState extends State<InformationTile>
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
        AnimationType visibleState = watch(animationNotifier).value;

        visibleState == AnimationType.appear
            ? _controller.forward()
            : _controller.reverse();

        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          width: InformationTile.maxWidth,
          child: Stack(
            children: [
              SizeTransition(
                axis: Axis.horizontal,
                sizeFactor: CurvedAnimation(
                  curve: Interval(
                    (widget.index + 2) * 0.1,
                    (1.0 - (4 * 0.1)) + (widget.index * 0.1),
                    curve: Curves.easeOutQuint,
                  ),
                  parent: _controller,
                ),
                child: _content(),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                child: SizeTransition(
                  axis: Axis.horizontal,
                  sizeFactor: Tween<double>(
                    begin: 1.0,
                    end: 0.0,
                  ).animate(
                    CurvedAnimation(
                      curve: Interval(
                        (widget.index + 3) * 0.1,
                        (1.0 - (4 * 0.1)) + (widget.index * 0.1),
                        curve: Curves.easeOutCirc,
                      ),
                      parent: _controller,
                    ),
                  ),
                  child: SizeTransition(
                    axis: Axis.horizontal,
                    axisAlignment: 1.0,
                    sizeFactor: Tween<double>(begin: 0, end: 1).animate(
                      CurvedAnimation(
                        curve: Interval(
                          widget.index * 0.1,
                          (1.0 - (4 * 0.1)) + (widget.index * 0.1),
                          curve: Curves.easeOutCirc,
                        ),
                        parent: _controller,
                      ),
                    ),
                    child: Container(
                      color: ThemeColor.PurpleBlack.color,
                      width: InformationTile.maxWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Container _content() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      // constraints: BoxConstraints(maxWidth: InformationTile.maxWidth),
      width: InformationTile.maxWidth,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(width: 6.0, color: ThemeColor.PurpleBlack.color),
          bottom: BorderSide(width: 1.0, color: ThemeColor.PurpleBlack.color),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: ThemeColor.PurpleBlack.color,
            ),
          ),
          Text(
            widget.data.content,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
