import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable(createToJson: false)
class Account {
  final CoinInfo coinInfo;
  final User userInfo;

  Account({required this.coinInfo, required this.userInfo});

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}