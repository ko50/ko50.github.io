import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/controller/transition_controller.dart';
import 'package:portfolio/helper/animation_type.dart';
import 'package:portfolio/helper/screen_type.dart';

final Provider<TransitionController> transitionController =
    Provider((_) => TransitionController());

final ChangeNotifierProvider<ValueNotifier<int>> displayedSectionIndex =
    ChangeNotifierProvider(
  (ref) => ref.watch(transitionController).displayedSectionIndex,
);

final ChangeNotifierProvider<ValueNotifier<bool>> isFooterExpanded =
    ChangeNotifierProvider(
  (ref) => ref.watch(transitionController).isFooterExpanded,
);

final ChangeNotifierProvider<ValueNotifier<AnimationType>> animationNotifier =
    ChangeNotifierProvider(
  (ref) => ref.watch(transitionController).animationNotifier,
);

final ChangeNotifierProvider<ValueNotifier<int>> hoveredSectionIndex =
    ChangeNotifierProvider((_) => ValueNotifier<int>(-1));

final ChangeNotifierProvider<ValueNotifier<ScreenType>> screenType =
    ChangeNotifierProvider((_) => ValueNotifier(ScreenType.desktop));
