import 'package:flutter/material.dart';
import 'package:portfolio/helper/asset_resources.dart';

class HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 2.0, color: Colors.purple[900]),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 2.5, color: Colors.white),
          ),
          child: Image.asset(AssetResources.CircularCotton.path),
        ),
      ),
    );
  }
}
