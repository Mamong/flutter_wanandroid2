part of 'user_coin_provider.dart';

abstract class UserCoinState extends Equatable {
  const UserCoinState();

  @override
  List<Object?> get props => [];
}

class UserCoinInitial extends UserCoinState {
  const UserCoinInitial();
}

/// loading fetch coin info
class GettingUserCoinInfo extends UserCoinState {
  const GettingUserCoinInfo();
}

class FetchedUserCoinInfo extends UserCoinState {
  const FetchedUserCoinInfo(this.result);

  final CoinInfo result;

  @override
  List<Object?> get props => [result];
}

/// loading coin details
class GettingUserCoinDetails extends UserCoinState {
  const GettingUserCoinDetails();
}

// fetch coin details success
class FetchedUserCoinDetails extends UserCoinState {
  const FetchedUserCoinDetails(this.result);

  final PaginatedResp<CoinDetail> result;

  @override
  List<Object?> get props => [result];
}

class UserCoinError extends UserCoinState {
  const UserCoinError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
