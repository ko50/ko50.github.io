import 'package:flutter/material.dart';

import 'package:portfolio/helper/theme_colors.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: ThemeColor.PurpleBlack.color,
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
          height: 5.0,
          width: 20,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: ThemeColor.Grey.color)),
          ),
        ),
        Text(
          '2020 ©ko',
          style: TextStyle(color: ThemeColor.Grey.color, fontSize: 10),
        ),
      ],
    );
  }
}
