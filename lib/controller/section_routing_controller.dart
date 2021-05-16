import 'package:flutter/material.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/enum/animation_type.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/model/portfolio_api_data.dart';

class SectionRoutingController {
  static late List<PortfolioAPIData> displayedData;

  bool initalized = false;

  ValueNotifier<int> displayedSectionIndex = ValueNotifier(0);
  ValueNotifier<bool> isFooterExpanded = ValueNotifier(true);
  ValueNotifier<bool> loading = ValueNotifier(true);
  ValueNotifier<AnimationType> animationNotifier =
      ValueNotifier(AnimationType.appear);

  void initial() async {
    if (initalized) return;

    animationNotifier.value = AnimationType.appear;
    loading.value = true;

    await Future.delayed(initialLoadDuration);
    animationNotifier.value = AnimationType.hide;

    await Future.delayed(footerCloseDelay);
    loading.value = false;
    isFooterExpanded.value = false;

    await Future.delayed(footerAnimateDuration);
    animationNotifier.value = AnimationType.appear;

    initalized = true;
  }

  void transition(Section target) async {
    if (target.index == displayedSectionIndex.value) return;

    animationNotifier.value = AnimationType.hide;

    await Future.delayed(Duration(milliseconds: transitionDefaultDuration));
    isFooterExpanded.value = true;
    loading.value = true;

    await Future.delayed(footerAnimateDuration);
    displayedData = await target.fetchData();
    displayedSectionIndex.value = target.index;

    await Future.delayed(footerCloseDelay);
    loading.value = false;
    isFooterExpanded.value = false;

    await Future.delayed(footerAnimateDuration);
    animationNotifier.value = AnimationType.appear;
  }
}
