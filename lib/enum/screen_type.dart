import 'package:portfolio/constants.dart';

enum ScreenType { desktop, phone }

extension GetScreenType on ScreenType {
  static ScreenType find(double width) {
    if (width <= widthBreakpoint) return ScreenType.phone;
    return ScreenType.desktop;
  }
}
