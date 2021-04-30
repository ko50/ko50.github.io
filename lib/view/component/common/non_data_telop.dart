import 'package:flutter/material.dart';
import 'package:portfolio/enum/theme_colors.dart';

class NonDataTelop extends StatelessWidget {
  final String? message;

  const NonDataTelop({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'データがありません',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w300,
          color: ThemeColor.Grey.color,
        ),
      ),
    );
  }
}
