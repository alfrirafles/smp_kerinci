import 'package:intl/intl.dart';

class Announcement {
  String title;
  DateTime postedDate;
  String postedBy;
  String content;
  String? image;

  Announcement({
    required this.title,
    required this.postedDate,
    required this.postedBy,
    required this.content,
    this.image,
  });

  String formatDateTimeDisplay() =>
      DateFormat.yMd().add_jm().format(postedDate).toString();

  String showContentPreview() =>
      content.length > 32 ? content.substring(0, 31) + '...' : content;
}
