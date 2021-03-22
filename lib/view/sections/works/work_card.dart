import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/data/works.dart';
import 'package:portfolio/helper/animation_type.dart';

import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class WorkCard extends StatefulWidget {
  final WorkData work;

  const WorkCard({required this.work});

  @override
  _WorkCardState createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, detail) {
        return Consumer(
          builder: (context, watch, _) {
            final visibility =
                watch(animationNotifier).value == AnimationType.appear;

            return AnimatedOpacity(
              duration: Duration(milliseconds: transitionDefaultDuration),
              opacity: visibility ? 1 : 0,
              child: MouseRegion(
                onEnter: (_) => setState(() => _hovered = true),
                onExit: (_) => setState(() => _hovered = false),
                cursor: SystemMouseCursors.click,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: transitionDefaultDuration),
                  curve: Interval(
                    widget.work.index * 0.1,
                    1.0,
                    curve: Curves.easeInOutBack,
                  ),
                  transform:
                      Matrix4.diagonal3Values(1, visibility ? 1 : 0.1, 1),
                  constraints: BoxConstraints(maxHeight: 500, maxWidth: 600),
                  decoration: BoxDecoration(
                    color: _hovered
                        ? ThemeColor.PurpleBlack.color
                        : ThemeColor.Background.color,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: ThemeColor.PurpleBlack.color),
                    boxShadow: [
                      BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5.0)
                    ],
                  ),
                  child: Column(
                    children: [Expanded(child: _snapshot()), _information()],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Container _snapshot() {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.grey,
        boxShadow: [BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 2)],
      ),
      child: Image.asset(
        widget.work.snapshotPath,
        alignment: Alignment.topCenter,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _information() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              color: _hovered
                  ? ThemeColor.Background.color
                  : ThemeColor.PurpleBlack.color,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
            child: Text(widget.work.title),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 13,
                color: _hovered ? ThemeColor.Background.color : Colors.black,
              ),
              child: Text(widget.work.description),
            ),
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              color: _hovered
                  ? ThemeColor.Background.color
                  : ThemeColor.PurpleBlack.color,
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
            child: Text('Tag: ${widget.work.tags.join(', ')}'),
          ),
        ],
      ),
    );
  }
}
