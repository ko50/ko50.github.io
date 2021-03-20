import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/controller/transition_controller.dart';

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

final ChangeNotifierProvider<ValueNotifier<int>> hoveredSectionIndex =
    ChangeNotifierProvider((_) => ValueNotifier<int>(-1));
