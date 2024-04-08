class CollectionInfo {
  final String author; //
  final int chapterId; //
  final String chapterName; //
  final int courseId; //
  final String desc; //
  final String envelopePic; //
  final int id; //
  final String link; //
  final String niceDate; //
  final String origin; //
  final int? originId; //
  final int publishTime; //
  final String? superChapterName;
  final String title; //
  final int userId; //
  final int visible; //
  final int zan; //

  CollectionInfo(
      {this.originId,
      required this.author,
      required this.chapterId,
      required this.chapterName,
      required this.courseId,
      required this.desc,
      required this.envelopePic,
      required this.id,
      required this.link,
      required this.niceDate,
      required this.origin,
      required this.publishTime,
      this.superChapterName,
      required this.title,
      required this.userId,
      required this.visible,
      required this.zan});
}
