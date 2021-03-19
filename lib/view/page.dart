import 'package:flutter/material.dart';

import 'package:portfolio/view/component/header/header.dart';
import 'package:portfolio/view/component/root/root.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: ListView(children: [Root()]),
    );
  }
}
