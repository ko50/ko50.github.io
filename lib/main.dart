import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/helper/theme_colors.dart';

import 'package:portfolio/view/page.dart';

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
      ),
      home: RootPage(),
    );
  }
}
