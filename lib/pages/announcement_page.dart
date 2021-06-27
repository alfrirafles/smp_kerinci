import 'package:flutter/material.dart';
import 'package:smp_kerinci/pages/templates/base_page.dart';
import 'package:smp_kerinci/models/announcement.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smp_kerinci/utilities/constants.dart';

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
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel tellus ut ipsum fringilla dictum ut a mi. In eget ex nulla. Ut sit amet mauris eu elit feugiat imperdiet.',
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
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      '$kImageAssetsSourceDirectory' + 'image_placeholder.svg',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height /
                          announcements.length,
                    ),
                  ),
                  Text(
                    announcements[index].title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        announcements[index].formatDateTimeDisplay(),
                      ),
                      Text('Posted by: ' + announcements[index].postedBy),
                    ],
                  ),
                  Text(announcements[index].showContentPreview()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
