import 'package:json_annotation/json_annotation.dart';

part 'coin_info.g.dart';

@JsonSerializable(createToJson: false)
class CoinInfo {
  final int coinCount;
  final int level;
  final String nickname;
  final String rank;
  final int userId;
  final String username;

  const CoinInfo({
    required this.coinCount,
    required this.level,
    required this.nickname,
    required this.rank,
    required this.userId,
    required this.username});

  factory CoinInfo.fromJson(Map<String, dynamic> json) =>
      _$CoinInfoFromJson(json);
}