class Article {
  final bool isTop;

  final String author;
  final int chapterId;
  final String chapterName;
  final bool collect;
  final String desc;
  final String envelopePic;
  final bool fresh;
  final int id;
  final String link;
  final String niceDate;
  final String origin;
  final int? originId;
  final int publishTime;
  // final int? shareDate;
  final String shareUser;
  // final int superChapterId;
  final String superChapterName;
  // final List<TagRM> tags;
  final String title;
  final int type;
  final int userId;
  final int zan;

  String get displayAuthor => [author, shareUser, chapterName]
      .firstWhere((String element) => element.isNotEmpty);

  Article({
    required this.author,
    required this.chapterId,
    required this.chapterName,
    required this.collect,
    required this.desc,
    required this.fresh,
    required this.envelopePic,
    required this.id,
    required this.link,
    required this.niceDate,
    required this.origin,
    this.originId,
    required this.publishTime,
    // this.shareDate,
    required this.shareUser,
    // required this.superChapterId,
    required this.superChapterName,
    required this.title,
    required this.type,
    required this.userId,
    required this.zan,
    this.isTop = false,
  });
}

class Tag {
  final String name;
  final String url;

  Tag({required this.name, required this.url});
}
