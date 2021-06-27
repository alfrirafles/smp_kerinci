import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      topNavTitle: 'SMP Kerinci',
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  child: SvgPicture.asset(
                    'assets/images/calendar_flatline.svg',
                    semanticsLabel: 'Calendar Logo',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
