import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
// import 'package:scrolling_page_indicator/scrolling_page_indicator.dart';

class BottomBarIndicator extends StatelessWidget {
  const BottomBarIndicator({
    this.controller,
    this.pageIndicator,
    Key? key,
  }) : super(key: key);

  final PageController? controller;
  final Color? pageIndicator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      // child: ScrollingPageIndicator(
      //   controller: controller,
      //   itemCount: 4,
      //   dotSelectedColor: pageIndicator,
      //   dotSize: 8,
      //   dotSelectedSize: 12,
      //   dotSpacing: 15,
      // ),
    );
  }
}
