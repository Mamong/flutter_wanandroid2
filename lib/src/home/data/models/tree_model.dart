import 'package:flutter_wanandroid2/src/home/domain/entities/tree.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tree_model.g.dart';

@JsonSerializable(createToJson: false)
class TreeModel {
  final String author;
  final List<TreeModel> children;
  final int courseId;
  final String cover;
  final String desc;
  final int id;
  final String lisense;
  final String lisenseLink;
  final String name;
  final int order;
  final int parentChapterId;
  final int type;
  final bool userControlSetTop;
  final int visible;

  const TreeModel(
      {required this.author,
      required this.children,
      required this.courseId,
      required this.cover,
      required this.desc,
      required this.id,
      required this.lisense,
      required this.lisenseLink,
      required this.name,
      required this.order,
      required this.parentChapterId,
      required this.type,
      required this.userControlSetTop,
      required this.visible});

  factory TreeModel.fromJson(Map<String, dynamic> json) =>
      _$TreeModelFromJson(json);
}

extension TreeModeltoDomain on TreeModel {
  Tree toDomainModel() {
    return Tree(
      author: author,
      courseId: courseId,
      children: children.map((e) => e.toDomainModel()).toList(),
      cover: cover,
      desc: desc,
      id: id,
      lisense: lisense,
      lisenseLink: lisenseLink,
      name: name,
      parentChapterId: parentChapterId,
      type: type,
      userControlSetTop: userControlSetTop,
    );
  }
}
