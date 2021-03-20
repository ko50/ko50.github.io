import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/sections.dart';

class TransitionController {
  ValueNotifier<int> displayedSectionIndex = ValueNotifier(0);
  ValueNotifier<bool> isFooterExpanded = ValueNotifier(false);
  ValueNotifier<AnimationType> animationNotifier =
      ValueNotifier(AnimationType.appear);

  void transition(Section target) async {
    if (target.index == displayedSectionIndex.value) return;

    animationNotifier.value = AnimationType.hide;

    await Future.delayed(footerExpandDelay);
    await Future.delayed(footerAnimateDuration);
    displayedSectionIndex.value = target.index;
    isFooterExpanded.value = true;

    await Future.delayed(footerCloseDelay);
    isFooterExpanded.value = false;

    animationNotifier.value = AnimationType.appear;
  }
}
