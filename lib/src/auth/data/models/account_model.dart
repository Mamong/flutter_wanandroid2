import 'package:flutter_wanandroid2/src/auth/domain/entities/account.dart';
import 'package:flutter_wanandroid2/src/coin/data/models/coin_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:flutter_wanandroid2/src/auth/data/models/user_model.dart';

part 'account_model.g.dart';

@JsonSerializable(createToJson: false)
class AccountModel {
  final CoinInfoModel coinInfo;
  final UserModel userInfo;

  AccountModel({required this.coinInfo, required this.userInfo});

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}

extension AccountModeltoDomain on AccountModel {
  Account toDomainModel() {
    return Account(
        userInfo: userInfo.toDomainModel(), coinInfo: coinInfo.toDomainModel());
  }
}
