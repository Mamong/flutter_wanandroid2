part of 'auth_provider.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class GettingUserData extends AuthState {
  const GettingUserData();
}

class FetchedUser extends AuthState {
  const FetchedUser();
}

class LoggedIn extends AuthState {
  const LoggedIn(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}

class Registered extends LoggedIn {
  const Registered(super.user);
}

class LoggedOut extends AuthState {
  const LoggedOut();
}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}