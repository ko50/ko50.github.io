import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/constants.dart';
import 'package:portfolio/controller/section_routing_controller.dart';
import 'package:portfolio/enum/animation_type.dart';
import 'package:portfolio/enum/sections.dart';
import 'package:portfolio/enum/theme_colors.dart';
import 'package:portfolio/model/portfolio_api_data.dart';
import 'package:portfolio/providers.dart';
import 'package:portfolio/view/component/common/non_data_telop.dart';

class SectionContainer extends StatefulWidget {
  final Section section;
  final Duration appearDuration;
  final Duration? hideDuration;
  final Widget Function(List<PortfolioAPIData>, AnimationController) builder;

  SectionContainer({
    required this.section,
    required this.builder,
    this.appearDuration =
        const Duration(milliseconds: transitionDefaultDuration),
    this.hideDuration,
  });

  @override
  _SectionContainerState createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.appearDuration,
      reverseDuration: widget.hideDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, detail) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: detail.maxHeight),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 64.0),
              width: double.infinity,
              constraints: BoxConstraints(minHeight: detail.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [_title(), _subTitle(), _child()],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _title() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: ThemeColor.PurpleBlack.color)),
      ),
      child: Text(
        widget.section.title,
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.w700,
          color: ThemeColor.PurpleBlack.color,
        ),
      ),
    );
  }

  Container _subTitle() {
    return Container(
      margin: const EdgeInsets.only(bottom: 32, right: 32.0, left: 32.0),
      child: Text(
        widget.section.subTitle,
        style: TextStyle(
          color: ThemeColor.PurpleBlack.color,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _child() {
    final List<PortfolioAPIData> data = SectionRoutingController.displayedData;

    return Consumer(
      builder: (context, watch, child) {
        watch(animationNotifier).value == AnimationType.appear
            ? _controller.forward()
            : _controller.reverse();

        return data.isEmpty
            ? NonDataTelop(animation: _controller)
            : widget.builder(data, _controller);
      },
    );
  }
}
