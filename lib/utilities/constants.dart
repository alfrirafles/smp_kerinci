import 'package:flutter/material.dart';

const kTopNavBackgroundColor = Colors.green;
const kImageAssetsSourceDirectory = 'assets/images/';

const Set<MaterialState> kButtonInteractiveStates = <MaterialState>{
  MaterialState.pressed,
  MaterialState.hovered,
  MaterialState.focused,
};
const double kButtonVerticalPadding = 15;
const double kButtonHorizontalPadding = 25;
const kButtonBorderStyle = BorderStyle.solid;
const kButtonBorderColor = Colors.green;

const kLandingImageWidthFactor = 0.6;
const kLandingImageHeightFactor = 0.25;

enum Orientation {
  leftToRight,
  rightToLeft,
}
