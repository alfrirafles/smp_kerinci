import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      topNavTitle: 'SMP Kerinci',
      body: Container(
        child: Center(
          child: Text('Sample Text'),
        ),
      ),
    );
  }
}
