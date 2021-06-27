import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';
import 'package:smp_kerinci/utilities/constants.dart' as constants;
import 'package:smp_kerinci/components/landing_banner.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      topNavTitle: 'SMP Kerinci',
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LandingBanner(
              buttonTitle: 'Kalender',
              buttonAction: () {},
              imageAssetName: 'calendar_flatline.svg',
              imageAssetLabel: 'Calendar Logo',
              orientation: constants.Orientation.leftToRight,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            LandingBanner(
              buttonTitle: 'Pengumuman',
              buttonAction: () {},
              imageAssetName: 'news_flatline.svg',
              imageAssetLabel: 'Announcement Logo',
              orientation: constants.Orientation.rightToLeft,
            ),
          ],
        ),
      ),
    );
  }
}
