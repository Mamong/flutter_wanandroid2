import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_wanandroid2/core/common/app/current_user_provider.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';
import 'package:flutter_wanandroid2/src/auth/domain/usecases/get_user.dart';
import 'package:flutter_wanandroid2/src/auth/domain/usecases/login.dart';
import 'package:flutter_wanandroid2/src/auth/domain/usecases/logout.dart';
import 'package:flutter_wanandroid2/src/auth/domain/usecases/register.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';
part 'auth_state.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build([GlobalKey? familyKey]) {
    _getUser = sl<GetUser>();
    _logout = sl<Logout>();
    _login = sl<Login>();
    _register = sl<Register>();
    return const AuthInitial();
  }

  late GetUser _getUser;
  late Login _login;
  late Register _register;
  late Logout _logout;

  Future<void> getUser() async {
    state = const GettingUserData();
    final result =
    await _getUser();
    result.fold(
          (failure) => state = AuthError(failure.message),
          (user) {
        ref.read(currentUserProvider.notifier).setUser(user.userInfo);
        state = const FetchedUser();
      },
    );
  }

  Future<void> login(
      {required String username, required String password}) async {
    state = const AuthLoading();
    final result =
        await _login(LoginParams(username: username, password: password));
    result.fold(
      (failure) => state = AuthError(failure.message),
      (user) {
        ref.read(currentUserProvider.notifier).setUser(user);
        state = LoggedIn(user);
      },
    );
  }

  Future<void> register(
      {required String username,
      required String password,
      required String repassword}) async {
    state = const AuthLoading();
    final result = await _register(RegisterParams(
        username: username, password: password, repassword: repassword));
    result.fold(
      (failure) => state = AuthError(failure.message),
      (user) {
        ref.read(currentUserProvider.notifier).setUser(user);
        state = Registered(user);
      },
    );
  }

  Future<void> logout() async {
    state = const AuthLoading();
    final result =
    await _logout();
    result.fold(
          (failure) => state = AuthError(failure.message),
          (user) {
        ref.read(currentUserProvider.notifier).setUser(null);
        state = const LoggedOut();
      },
    );
  }
}
