import 'package:flutter/material.dart';

import 'package:portfolio/data/contacts.dart';
import 'package:portfolio/view/sections/contacts/contact_card.dart';
import 'package:portfolio/view/sections/section_container.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: 'Contacts',
      subTitle: '連絡',
      child: Container(
        constraints: BoxConstraints(maxWidth: 400),
        child: ListView.builder(
          itemCount: ContactWay.values.length,
          itemBuilder: (context, index) {
            ContactWay way = ContactWay.values[index];

            return ContactCard(way: way);
          },
        ),
      ),
    );
  }
}
