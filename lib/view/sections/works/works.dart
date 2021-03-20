import 'package:flutter/material.dart';

import 'package:portfolio/view/sections/section_container.dart';

class Works extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Works',
      subTitle: 'やったこと',
      child: Text('Works'),
    );
  }
}
