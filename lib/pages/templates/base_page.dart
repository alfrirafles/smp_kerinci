import 'package:flutter/material.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class BasePage extends StatelessWidget {
  final Widget? topNavLeading;
  final String topNavTitle;
  final TextStyle? topNavTitleStyle;
  final List<Widget>? topNavTrailing;
  final Widget body;

  BasePage(
      {required this.topNavTitle,
      this.topNavTitleStyle,
      this.topNavLeading,
      this.topNavTrailing,
      required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTopNavBackgroundColor,
        leading: topNavLeading,
        title: Text(
          topNavTitle,
          style: topNavTitleStyle,
        ),
        actions: topNavTrailing,
      ),
      body: body,
    );
  }
}
