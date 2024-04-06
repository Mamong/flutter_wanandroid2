import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_info_model.g.dart';

@JsonSerializable(createToJson: false)
class CoinInfoModel {
  final int coinCount;
  final int level;
  final String nickname;
  final String rank;
  final int userId;
  final String username;

  const CoinInfoModel(
      {required this.coinCount,
      required this.level,
      required this.nickname,
      required this.rank,
      required this.userId,
      required this.username});

  factory CoinInfoModel.fromJson(Map<String, dynamic> json) =>
      _$CoinInfoModelFromJson(json);
}

extension CoinInfoModeltoDomain on CoinInfoModel {
  CoinInfo toDomainModel() {
    return CoinInfo(
        coinCount: coinCount,
        level: level,
        nickname: nickname,
        rank: rank,
        userId: userId,
        username: username);
  }
}
