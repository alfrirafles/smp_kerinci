import 'package:flutter/material.dart';
import 'package:smp_kerinci/models/announcement.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({
    Key? key,
    required this.announcements,
  }) : super(key: key);

  final List<Announcement> announcements;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: announcements.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: kAnnouncementCardPadding,
            child: Column(
              children: [
                _AnnouncementImage(announcements: announcements),
                Text(
                  announcements[index].title,
                  style: kAnnouncementTitleTextStyle,
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
    );
  }
}

class _AnnouncementImage extends StatelessWidget {
  const _AnnouncementImage({
    Key? key,
    required this.announcements,
  }) : super(key: key);

  final List<Announcement> announcements;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
        '$kImageAssetsSourceDirectory' + 'image_placeholder.svg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / announcements.length,
      ),
    );
  }
}
