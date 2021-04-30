import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/enum/animation_type.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/model/model_base.dart';

class TransitionController {
  static late List<ModelBase> displayedData;

  ValueNotifier<int> displayedSectionIndex = ValueNotifier(0);
  ValueNotifier<bool> isFooterExpanded = ValueNotifier(false);
  ValueNotifier<AnimationType> animationNotifier =
      ValueNotifier(AnimationType.appear);

  void transition(Section target) async {
    if (target.index == displayedSectionIndex.value) return;

    animationNotifier.value = AnimationType.hide;

    await Future.delayed(Duration(milliseconds: transitionDefaultDuration));
    isFooterExpanded.value = true;

    await Future.delayed(footerAnimateDuration);
    displayedData = await target.fetchData();
    displayedSectionIndex.value = target.index;

    await Future.delayed(footerCloseDelay);
    isFooterExpanded.value = false;

    await Future.delayed(footerAnimateDuration);
    animationNotifier.value = AnimationType.appear;
  }
}
