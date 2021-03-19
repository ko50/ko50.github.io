import 'package:flutter/material.dart';

import 'package:portfolio/helper/theme_colors.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 60,
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: ThemeColor.PurpleBlack.color,
          boxShadow: [BoxShadow(color: ThemeColor.Shadow.color, blurRadius: 5)],
          border: Border(
            top: BorderSide(
              color: ThemeColor.WhityPurple.color,
              width: 4.0,
            ),
          ),
        ),
        child: Center(child: copyRight()),
      ),
    );
  }

  Column copyRight() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25,
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: ThemeColor.Grey.color)),
          ),
        ),
        Text(
          '© 2020 ko',
          style: TextStyle(
            color: ThemeColor.Grey.color,
            fontWeight: FontWeight.w100,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
