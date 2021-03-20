import 'package:flutter/material.dart';

import 'package:portfolio/view/component/common/section_container.dart';

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
