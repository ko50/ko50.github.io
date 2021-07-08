import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show SystemMouseCursors;
import 'package:flutter/widgets.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/model/works.dart';
import 'package:portfolio/enum/theme_colors.dart';

class WorkCard extends StatefulWidget {
  final WorkData work;
  final int index;
  final AnimationController animation;

  const WorkCard({
    required this.work,
    required this.index,
    required this.animation,
  });

  @override
  _WorkCardState createState() => _WorkCardState();
}

class _WorkCardState extends State<WorkCard>
    with SingleTickerProviderStateMixin {
  static const Duration _hoveredAnimationDuration = Duration(milliseconds: 200);
  late final AnimationController _hoveredAnimationController =
      AnimationController(
    vsync: this,
    duration: _hoveredAnimationDuration,
  );

  bool _hovered = false;

  @override
  void dispose() {
    _hoveredAnimationController.dispose();
    super.dispose();
  }

  void _launchLink() async {
    String url = widget.work.link;
    if (await canLaunch(url))
      await launch(url, forceSafariVC: false, forceWebView: false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0),
      constraints: BoxConstraints(maxWidth: 600),
      child: ScaleTransition(
        scale: CurvedAnimation(
          curve: Interval(0.0, 0.6, curve: Curves.easeOutQuint),
          parent: widget.animation,
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              bottom: 0,
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: ThemeColor.PurpleBlack.color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            ScaleTransition(
              scale: CurvedAnimation(
                curve: Interval(0.1, 0.7, curve: Curves.easeOutQuint),
                parent: widget.animation,
              ),
              child: GestureDetector(
                onTap: _launchLink,
                child: MouseRegion(
                  onEnter: (_) => setState(() {
                    _hovered = true;
                    _hoveredAnimationController.forward();
                  }),
                  onExit: (_) => setState(() {
                    _hovered = false;
                    _hoveredAnimationController.reverse();
                  }),
                  cursor: SystemMouseCursors.click,
                  child: AnimatedContainer(
                    duration: _hoveredAnimationDuration,
                    decoration: BoxDecoration(
                      color: _hovered
                          ? ThemeColor.PurpleBlack.color
                          : ThemeColor.Background.color,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: ThemeColor.PurpleBlack.color),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [_screenshot(), ..._information()],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _screenshot() {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        curve: Interval(0.6, 1.0, curve: Curves.easeInQuart),
        parent: widget.animation,
      ),
      child: Stack(
        children: [
          AnimatedContainer(
            duration: _hoveredAnimationDuration,
            padding: EdgeInsets.zero,
            child: ScaleTransition(
              scale: Tween<double>(begin: 1.0, end: 1.2).animate(
                CurvedAnimation(
                  parent: _hoveredAnimationController,
                  curve: Curves.easeInOutCubic,
                ),
              ),
              child: Image.network(
                widget.work.screenshotUrl,
                alignment: Alignment.topCenter,
              ),
            ),
            // ),
          ),
          Positioned(
            top: 0.0,
            right: 0.0,
            bottom: 0.0,
            left: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    ThemeColor.PaleShadow.color,
                  ],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _information() {
    return [
      Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          right: 16.0,
          left: 16.0,
        ),
        child: AnimatedDefaultTextStyle(
          duration: _hoveredAnimationDuration,
          style: TextStyle(
            color: _hovered
                ? ThemeColor.Background.color
                : ThemeColor.PurpleBlack.color,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
          child: Text(widget.work.name),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AnimatedDefaultTextStyle(
          duration: _hoveredAnimationDuration,
          style: TextStyle(
            fontSize: 13,
            color: _hovered ? ThemeColor.Background.color : Colors.black,
          ),
          child: Text(widget.work.description),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(
          top: 8.0,
          right: 16.0,
          bottom: 16.0,
          left: 16.0,
        ),
        child: AnimatedDefaultTextStyle(
          duration: _hoveredAnimationDuration,
          style: TextStyle(
            color: _hovered
                ? ThemeColor.Background.color
                : ThemeColor.PurpleBlack.color,
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
          child: Text('Tag: ${widget.work.tags.join(', ')}'),
        ),
      ),
    ];
  }
}
