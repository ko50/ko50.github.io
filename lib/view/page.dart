import 'package:flutter/material.dart';

import 'package:portfolio/view/component/header/header.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ko's Portfolio - with Flutter")),
      body: ListView(
        children: [Header()],
      ),
    );
  }
}
