import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/contacts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard extends StatefulWidget {
  final ContactData contact;
  final AnimationController animation;

  ContactCard({
    required this.contact,
    required this.animation,
  });

  @override
  _ContactCardState createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  void _launchLink() async {
    String url = widget.contact.serviceLink;
    if (await canLaunch(url))
      await launch(url, forceSafariVC: false, forceWebView: false);
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      child: SizeTransition(
        axis: Axis.horizontal,
        sizeFactor: CurvedAnimation(
          curve: Interval(0.0, 0.4, curve: Curves.easeOutQuint),
          reverseCurve: Interval(0.2, 0.6, curve: Curves.easeInQuint),
          parent: widget.animation,
        ),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => _controller.forward(),
          onExit: (_) => _controller.reverse(),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _launchLink,
            child: Stack(
              children: [
                _card(),
                Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  left: 0,
                  child: _fade(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _fade() {
    return FadeTransition(
      opacity: Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
          curve: Curves.easeOutQuint,
          reverseCurve: Curves.easeInQuint,
          parent: widget.animation,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.PurpleBlack.color,
          border: Border.all(color: ThemeColor.PurpleBlack.color),
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
      constraints: BoxConstraints(maxWidth: 400),
      decoration: BoxDecoration(
        color: ThemeColor.Background.color,
        border: Border.all(color: ThemeColor.PurpleBlack.color),
        boxShadow: [
          BoxShadow(
            color: ThemeColor.Shadow.color,
            blurRadius: 5.0,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_logo(), _userName()],
        ),
      ),
    );
  }

  Widget _logo() {
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.5).animate(
        CurvedAnimation(
          curve: Curves.bounceOut,
          reverseCurve: Curves.bounceIn,
          parent: _controller,
        ),
      ),
      child: Container(
        width: 40,
        height: 40,
        child: ScaleTransition(
          scale: CurvedAnimation(
            curve: Curves.easeOutCirc,
            reverseCurve: Curves.easeInCirc,
            parent: widget.animation,
          ),
          child: SvgPicture.network(widget.contact.logoUrl),
        ),
      ),
    );
  }

  Widget _userName() {
    return FadeTransition(
      opacity: CurvedAnimation(
        curve: Interval(0.4, 1.0, curve: Curves.easeInOutExpo),
        parent: widget.animation,
      ),
      child: SizeTransition(
        axis: Axis.horizontal,
        axisAlignment: 1.0,
        sizeFactor: CurvedAnimation(
          curve: Interval(0.4, 1.0, curve: Curves.easeInOutExpo),
          parent: widget.animation,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(
            '@${widget.contact.userName}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: ThemeColor.Grey.color,
            ),
          ),
        ),
      ),
    );
  }
}
