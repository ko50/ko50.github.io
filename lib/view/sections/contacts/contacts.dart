import 'package:flutter/material.dart';
import 'package:portfolio/constants.dart';

import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/model/contacts.dart';
import 'package:portfolio/view/sections/contacts/contact_card.dart';
import 'package:portfolio/view/sections/section_container.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      section: Section.contacts,
      appearDuration: Duration(milliseconds: transitionDefaultDuration * 3),
      builder: (data, animation) {
        assert(data.every((e) => e is ContactData));

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 0; i < data.length; i++)
              ContactCard(
                contact: data[i] as ContactData,
                animation: animation,
              ),
          ],
        );
      },
    );
  }
}
