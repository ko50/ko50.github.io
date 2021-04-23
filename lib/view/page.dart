import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/helper/screen_type.dart';
import 'package:portfolio/provider.dart';
import 'package:portfolio/view/component/footer/footer.dart';
import 'package:portfolio/view/component/header/header.dart';
import 'package:portfolio/view/component/drawer/drawer.dart';
import 'package:portfolio/view/sections/section_router.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, _) {
        final ScreenType screen = watch(screenType).value;

        return Scaffold(
          appBar: Header(),
          endDrawer: screen == ScreenType.desktop ? null : ResponsiveDrawer(),
          body: SectionRouter(),
          bottomNavigationBar: Footer(),
        );
      },
    );
  }
}
