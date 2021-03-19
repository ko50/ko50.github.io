import 'package:flutter/material.dart';
import 'package:portfolio/helper/asset_resources.dart';
import 'package:portfolio/helper/theme_colors.dart';

class CottonIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: EdgeInsets.all(8.0),
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
                blurRadius: 5.0,
                color: ThemeColor.Shadow.color,
              ),
            ],
          ),
          child: _icon(),
        ),
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
