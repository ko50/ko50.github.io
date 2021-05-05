import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/providers.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        bool expanded = watch(isFooterExpanded).value;

        return BottomAppBar(
          child: AnimatedContainer(
            duration: footerAnimateDuration,
            curve: Curves.easeInOutExpo,
            height: expanded ? MediaQuery.of(context).size.height : 60,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ThemeColor.PurpleBlack.color,
              boxShadow: [
                BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5)
              ],
              border: Border(
                top:
                    BorderSide(color: ThemeColor.WhityPurple.color, width: 4.0),
              ),
            ),
            child: Center(child: copyRight()),
          ),
        );
      },
    );
  }

  Column copyRight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: ThemeColor.PaleGrey.color)),
          ),
        ),
        Text(
          '© 2020 ko',
          style: TextStyle(
            color: ThemeColor.PaleGrey.color,
            fontWeight: FontWeight.w100,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
