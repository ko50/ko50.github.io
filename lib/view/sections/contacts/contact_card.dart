import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/data/contacts.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/provider.dart';

class ContactCard extends StatefulWidget {
  final ContactWay way;

  ContactCard({required this.way});

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 1),
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
        bool visibility =
            watch(animationNotifier).value == AnimationType.appear;

        visibility ? _controller.forward() : _controller.reverse();

        return AnimatedOpacity(
          duration: Duration(milliseconds: transitionDefaultDuration),
          opacity: visibility ? 1 : 0,
          child: AnimatedContainer(
            duration: Duration(milliseconds: transitionDefaultDuration),
            curve: Curves.easeInOutBack,
            transform: Matrix4.diagonal3Values(visibility ? 1 : 0.1, 1, 1),
            margin: EdgeInsets.symmetric(vertical: 32.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
            decoration: BoxDecoration(
              color: ThemeColor.Background.color,
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
    );
  }

  SafeArea _logo(bool visibility) {
    return SafeArea(
      child: RotationTransition(
        turns: CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOutBack,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: transitionDefaultDuration),
          curve: Curves.easeInExpo,
          height: visibility ? 40 : 0,
          width: visibility ? 40 : 0,
          child: SvgPicture.asset(widget.way.logoPath),
        ),
      ),
    );
  }

  Padding _userName() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        widget.way.userName,
        style: TextStyle(fontSize: 25, color: ThemeColor.DeepGrey.color),
      ),
    );
  }
}
