import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/data/contacts.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatefulWidget {
  final ContactWay way;

  ContactCard({required this.way});

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _transitionAnimationController =
      AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
  );

  bool _hovered = false;

  void _launchLink() async{
    String url = widget.way.link;
    if (await canLaunch(url))
    await launch(url, forceSafariVC: false, forceWebView: false);
  }

  @override
  void dispose() {
    _transitionAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: _launchLink,
        child: Consumer(
          builder: (context, watch, _) {
            bool visibility =
                watch(animationNotifier).value == AnimationType.appear;

            visibility
                ? _transitionAnimationController.forward()
                : _transitionAnimationController.reverse();

            return AnimatedOpacity(
              duration: Duration(milliseconds: transitionDefaultDuration),
              opacity: visibility ? 1 : 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: transitionDefaultDuration),
                curve: Curves.easeInOutBack,
                transform: Matrix4.diagonal3Values(visibility ? 1 : 0.1, 1, 1),
                margin: EdgeInsets.symmetric(vertical: 32.0),
                padding: EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: _hovered
                      ? ThemeColor.PurpleBlack.color
                      : ThemeColor.Background.color,
                  boxShadow: [
                    BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5.0),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [_logo(visibility), _userName()],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SafeArea _logo(bool visibility) {
    return SafeArea(
      child: RotationTransition(
        turns: CurvedAnimation(
          parent: _transitionAnimationController,
          curve: Curves.easeInOutBack,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: transitionDefaultDuration - 100),
          curve: Curves.easeInExpo,
          height: visibility ? 40 : 0,
          width: visibility ? 40 : 0,
          child: SvgPicture.asset(
            widget.way.logoPath,
            color: _hovered
                ? ThemeColor.Background.color
                : ThemeColor.PurpleBlack.color,
          ),
        ),
      ),
    );
  }

  Padding _userName() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: AnimatedDefaultTextStyle(
        duration: Duration(milliseconds: transitionDefaultDuration - 100),
        style: TextStyle(
          fontSize: _hovered ? 30 : 25,
          color: _hovered
              ? ThemeColor.Background.color
              : ThemeColor.DeepGrey.color,
        ),
        child: Text(widget.way.userName),
      ),
    );
  }
}
