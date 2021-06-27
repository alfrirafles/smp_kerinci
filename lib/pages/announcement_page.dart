import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      topNavTitle: 'Pengumuman',
      body: Container(
        child: Center(
          child: Text('Sample Page'),
        ),
      ),
    );
  }
}
