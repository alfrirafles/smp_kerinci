import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';
import 'package:smp_kerinci/models/announcement.dart';
import 'package:smp_kerinci/components/announcement_list.dart';

class AnnouncementPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Announcement> announcements = [
      Announcement(
        title: 'Judul Pengumuman Pertama',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel tellus ut ipsum fringilla dictum ut a mi. In eget ex nulla. Ut sit amet mauris eu elit feugiat imperdiet.',
        postedBy: 'Admin',
        postedDate: DateTime.now(),
      ),
      Announcement(
        title: 'Judul Pengumuman Kedua',
        content: '',
        postedBy: 'Admin',
        postedDate: DateTime.now(),
      ),
      Announcement(
        title: 'Judul Pengumuman Ketiga',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel tellus ut ipsum fringilla dictum ut a mi. In eget ex nulla. Ut sit amet mauris eu elit feugiat imperdiet.',
        postedBy: 'Admin',
        postedDate: DateTime.now(),
      )
    ];
    return BasePage(
      topNavTitle: 'Pengumuman',
      body: AnnouncementList(list: announcements),
    );
  }
}
