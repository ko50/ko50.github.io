import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/enum/screen_type.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/view/shared/footer/footer.dart';
import 'package:portfolio/view/shared/header/header.dart';
import 'package:portfolio/view/shared/drawer/drawer.dart';
import 'package:portfolio/view/sections/section_view_changer.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final ScreenType screen = watch(screenType).value;

        return Scaffold(
          appBar: Header(),
          endDrawer: screen == ScreenType.desktop ? null : ResponsiveDrawer(),
          body: SectionViewChanger(),
          bottomNavigationBar: Footer(),
        );
      },
    );
  }
}
