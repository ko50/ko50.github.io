import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/model/works.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class WorkCard extends StatefulWidget {
  final WorkData work;
  final int index;

  const WorkCard({required this.work, required this.index});

  @override
  _WorkCardState createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard> {
  bool _hovered = false;

  void _launchLink() async {
    String url = widget.work.link;
    if (await canLaunch(url))
      await launch(url, forceSafariVC: false, forceWebView: false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchLink,
      child: Consumer(
        builder: (context, watch, _) {
          final visibility =
              watch(animationNotifier).value == AnimationType.appear;

          return AnimatedOpacity(
            duration: Duration(milliseconds: transitionDefaultDuration + 200),
            opacity: visibility ? 1 : 0,
            child: MouseRegion(
              onEnter: (_) => setState(() => _hovered = true),
              onExit: (_) => setState(() => _hovered = false),
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                duration: Duration(milliseconds: transitionDefaultDuration),
                curve: Interval(
                  widget.index * 0.1,
                  1.0,
                  curve: Curves.easeInOutBack,
                ),
                transform: Matrix4.diagonal3Values(1, visibility ? 1 : 0.1, 1),
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
      ),
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
        fit: BoxFit.cover,
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
            child: Text(widget.work.name),
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
