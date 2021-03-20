import 'package:flutter/cupertino.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/helper/sections.dart';

class TransitionController {
  ValueNotifier<int> displayedSectionIndex = ValueNotifier(0);
  ValueNotifier<bool> isFooterExpanded = ValueNotifier(false);

  void transition(Section target) async {
    if (target.index == displayedSectionIndex.value) return;

    displayedSectionIndex.value = target.index;

    await Future.delayed(footerExpandDelay);
    isFooterExpanded.value = true;

    await Future.delayed(footerAnimateDuration);
    await Future.delayed(footerCloseDelay);
    isFooterExpanded.value = false;
  }
}
