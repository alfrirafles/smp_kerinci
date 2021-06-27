import 'package:flutter/material.dart';
import 'package:smp_kerinci/utilities/constants.dart' as constants;
import 'package:smp_kerinci/components/landing_button.dart';
import 'package:smp_kerinci/components/landing_image.dart';

class LandingBanner extends StatelessWidget {
  final constants.Orientation orientation;
  final String buttonTitle;
  final VoidCallback? buttonAction;
  final String imageAssetName;
  final String? imageAssetLabel;

  LandingBanner(
      {this.orientation = constants.Orientation.leftToRight,
      required this.buttonTitle,
      this.buttonAction,
      required this.imageAssetName,
      this.imageAssetLabel});

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonImagePair = [
      LandingButton(
        title: '$buttonTitle',
        action: buttonAction,
      ),
      LandingImage(
        assetName: imageAssetName,
        assetLabel: imageAssetLabel,
      ),
    ];
    if (orientation == constants.Orientation.leftToRight) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttonImagePair,
      );
    } else {
      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttonImagePair.reversed.toList());
    }
  }
}
