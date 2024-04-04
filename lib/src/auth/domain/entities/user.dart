import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(createToJson: true)
class User {
  final bool admin;
  final List<int> chapterTops;
  final int coinCount;
  final List<int> collectIds;
  final String email;
  final String icon;
  final int id;
  final String nickname;
  final int type;
  final String token;

  final String username;

  User(
      {required this.admin,
        required this.chapterTops,
        required this.coinCount,
        required this.collectIds,
        required this.email,
        required this.icon,
        required this.id,
        required this.nickname,
        required this.type,
        required this.token,
        required this.username});

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}
