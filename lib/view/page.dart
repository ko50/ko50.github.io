import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/view/component/footer/footer.dart';
import 'package:portfolio/view/component/header/header.dart';
import 'package:portfolio/view/component/root/root.dart';
import 'package:portfolio/view/component/drawer/drawer.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, detail) {
      return Scaffold(
        appBar: Header(),
        endDrawer:
            detail.maxWidth <= widthBreakpoint ? ResponsiveDrawer() : null,
        body: ListView(
          children: [
            Root(),
            Container(height: 500),
          ],
        ),
        bottomNavigationBar: Footer(),
      );
    });
  }
}
