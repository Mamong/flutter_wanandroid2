import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';
import 'package:flutter_wanandroid2/src/coin/domain/entities/coin_info.dart';

class Account {
  final CoinInfo coinInfo;
  final User userInfo;

  Account({required this.coinInfo, required this.userInfo});
}
