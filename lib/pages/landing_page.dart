import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';
import 'package:smp_kerinci/utilities/constants.dart' as constants;
import 'package:smp_kerinci/components/landing_banner.dart';
import 'package:smp_kerinci/utilities/routes.dart';

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
              orientation: constants.Orientation.leftToRight,
              buttonTitle: 'Kalender',
              imageAssetName: 'calendar_flatline.svg',
              imageAssetLabel: 'Calendar Logo',
              buttonAction: () {
                Navigator.pushNamed(context, '$calendarPageRoute');
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.20,
            ),
            LandingBanner(
              orientation: constants.Orientation.rightToLeft,
              buttonTitle: 'Pengumuman',
              imageAssetName: 'news_flatline.svg',
              imageAssetLabel: 'Announcement Logo',
              buttonAction: () {
                Navigator.pushNamed(context, '$announcementPageRoute');
              },
            ),
          ],
        ),
      ),
    );
  }
}
