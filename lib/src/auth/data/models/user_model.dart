import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel {
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

  UserModel(
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

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModeltoDomain on UserModel {
  User toDomainModel() {
    return User(
      admin: admin,
      chapterTops: chapterTops,
      coinCount: coinCount,
      collectIds: collectIds,
      email: email,
      icon: icon,
      id: id,
      nickname: nickname,
      type: type,
      token: token,
      username: username,
    );
  }
}