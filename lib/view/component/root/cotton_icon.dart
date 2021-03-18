import 'package:flutter/material.dart';
import 'package:portfolio/helper/asset_resources.dart';
import 'package:portfolio/helper/theme_colors.dart';

class CottonIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              ThemeColor.PurplePink.color,
              ThemeColor.PurpleBlack.color,
            ],
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 5.0,
              color: Color(0x80000000),
            ),
          ],
        ),
        child: _icon(),
      ),
    );
  }

  Container _icon() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        border: Border.all(width: 7.0, color: ThemeColor.Background.color),
      ),
      child: Image.asset(AssetResources.CircularCotton.path),
    );
  }
}
