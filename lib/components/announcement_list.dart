import 'package:flutter/material.dart';
import 'package:smp_kerinci/models/announcement.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smp_kerinci/utilities/constants.dart';

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({
    Key? key,
    required this.list,
  }) : super(key: key);

  final List<Announcement> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: kAnnouncementCardPadding,
            child: Column(
              children: [
                _Picture(announcements: list),
                _Title(list[index].title),
                _Description(
                  datePosted: list[index].formatDateTimeDisplay(),
                  postedBy: list[index].postedBy,
                ),
                Text(list[index].showContentPreview()),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Description extends StatelessWidget {
  _Description({required this.datePosted, this.postedBy});

  final String datePosted;
  final String? postedBy;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: postedBy != null
          ? MainAxisAlignment.spaceAround
          : MainAxisAlignment.start,
      children: [
        Text(
          datePosted,
        ),
        postedBy != null ? Text('Posted by: $postedBy') : Container(),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kAnnouncementTitleTextStyle,
    );
  }
}

class _Picture extends StatelessWidget {
  const _Picture({
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
