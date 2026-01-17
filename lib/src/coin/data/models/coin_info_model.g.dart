// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinInfoModel _$CoinInfoModelFromJson(Map<String, dynamic> json) =>
    CoinInfoModel(
      coinCount: (json['coinCount'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      nickname: json['nickname'] as String,
      rank: json['rank'] as String,
      userId: (json['userId'] as num).toInt(),
      username: json['username'] as String,
    );
