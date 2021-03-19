import 'package:flutter/material.dart';

enum ThemeColor {
  PurpleBlack,
  Purple,
  Background,
  PurplePink,
  WhityPurple,
  PalePink,
  Grey,
  Shadow,
}

extension ColorData on ThemeColor {
  int get hex {
    switch (this) {
      case ThemeColor.Purple:
        return 0xff531a70;
      case ThemeColor.PurpleBlack:
        return 0xff280e3b;
      case ThemeColor.Background:
        return 0xffffffff;
      case ThemeColor.PurplePink:
        return 0xffbd3a9a;
      case ThemeColor.WhityPurple:
        return 0xffd3b7d8;
      case ThemeColor.PalePink:
        return 0xfffdfaff;
      case ThemeColor.Grey:
        return 0xfff5f5f5;
      case ThemeColor.Shadow:
        return 0x88000000;

      default:
        return 0xff000000;
    }
  }

  Color get color => Color(this.hex);
}
