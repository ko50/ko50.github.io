import 'package:flutter/material.dart';
import 'package:portfolio/enum/sections.dart';

import 'package:portfolio/model/contacts.dart';
import 'package:portfolio/view/sections/contacts/contact_card.dart';
import 'package:portfolio/view/sections/section_container.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      section: Section.contacts,
      builder: (data, animation) {
        assert(data.every((e) => e is ContactData));

        return Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ContactCard(
                contact: data[index] as ContactData,
                animation: animation,
              );
            },
          ),
        );
      },
    );
  }
}
