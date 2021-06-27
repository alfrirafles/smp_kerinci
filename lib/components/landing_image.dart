import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class LandingImage extends StatelessWidget {
  final String assetName;
  final String? assetLabel;

  LandingImage({required this.assetName, this.assetLabel = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * kLandingImageWidthFactor,
      height: MediaQuery.of(context).size.height * kLandingImageHeightFactor,
      child: SvgPicture.asset(
        '$kImageAssetsSourceDirectory' + '$assetName',
        semanticsLabel: '$assetLabel',
      ),
    );
  }
}
