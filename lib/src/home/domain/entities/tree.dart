class Tree {
  final String author;
  final List<Tree> children;
  final int courseId;
  final String cover;
  final String desc;
  final int id;
  final String lisense;
  final String lisenseLink;
  final String name;
  final int parentChapterId;
  final int type;
  final bool userControlSetTop;

  const Tree(
      {required this.author,
      required this.children,
      required this.courseId,
      required this.cover,
      required this.desc,
      required this.id,
      required this.lisense,
      required this.lisenseLink,
      required this.name,
      required this.parentChapterId,
      required this.type,
      required this.userControlSetTop});
}
