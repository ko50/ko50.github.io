import 'package:flutter/material.dart';

import 'package:portfolio/view/component/common/section_container.dart';

class Skills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Skills',
      subTitle: 'できること',
      child: Text('Skills'),
    );
  }
}
