import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChangeNotifierProvider<ValueNotifier<int>> hoveredSectionIndex =
    ChangeNotifierProvider((_) => ValueNotifier<int>(-1));

final ChangeNotifierProvider<ValueNotifier<int>> displayedSectionIndex =
    ChangeNotifierProvider((_) => ValueNotifier<int>(0));
