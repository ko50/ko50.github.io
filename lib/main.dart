import 'package:flutter/material.dart';

import 'package:portfolio/view/page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ko's portfolio",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RootPage(),
    );
  }
}
