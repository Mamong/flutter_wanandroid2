import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin_detail_model.g.dart';

@JsonSerializable(createToJson: false)
class CoinDetailModel {
  final String reason;
  final String desc;
  final int coinCount;

  const CoinDetailModel(
      {required this.reason, required this.desc, required this.coinCount});

  factory CoinDetailModel.fromJson(Map<String, dynamic> json) =>
      _$CoinDetailModelFromJson(json);

  static CoinDetailModel fromJsonModel(Object? json) =>
      CoinDetailModel.fromJson(json as Map<String, dynamic>);
}

extension CoinDetailModeltoDomain on CoinDetailModel {
  CoinDetail toDomainModel() {
    return CoinDetail(reason: reason, desc: desc, coinCount: coinCount);
  }
}
