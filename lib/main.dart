import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/helper/screen_type.dart';

import 'package:portfolio/helper/theme_colors.dart';
import 'package:portfolio/view/page.dart';
import 'package:portfolio/provider.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ko's portfolio",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: ThemeColor.Background.color,
        fontFamily: 'Roboto',
        accentColor: ThemeColor.Background.color,
      ),
      home: LayoutBuilder(
        builder: (context, detail) {
          return Consumer(
            builder: (context, watch, _) {
              watch(screenType).value = GetScreenType.find(detail.maxWidth);

              return RootPage();
            },
          );
        },
      ),
    );
  }
}
