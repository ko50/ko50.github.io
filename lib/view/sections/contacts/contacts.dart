import 'package:flutter/material.dart';

import 'package:portfolio/view/component/common/section_container.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Contacts',
      subTitle: '連絡',
      child: Text('Contacts'),
    );
  }
}
