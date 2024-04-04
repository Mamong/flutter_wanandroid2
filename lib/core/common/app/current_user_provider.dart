import 'package:flutter_wanandroid2/core/common/app_storage_service.dart';
import 'package:flutter_wanandroid2/core/common/singletons/cache.dart';
import 'package:flutter_wanandroid2/core/services/injection_container.dart';
import 'package:flutter_wanandroid2/src/auth/domain/entities/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'current_user_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentUser extends _$CurrentUser {
  //late AppStorageService _storageService;

  @override
  User? build() {
    //_storageService = sl<AppStorageService>();
    return Cache.instance.user;
  }

  /// also update user info storage
  Future<void> setUser(User? user) async {
    if (state != user) {
      if(user == null){
        await sl<AppStorageService>().clearUserInfo();
      }else {
        await sl<AppStorageService>().setUserInfo(user);
      }
      Cache.instance.user = user;
      state = user;
    }
  }
}
