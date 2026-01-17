// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_coin_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userCoinHash() => r'8a5fc38d0f515b8bee67d85d966cd7e1a9918ce1';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UserCoin extends BuildlessAutoDisposeNotifier<UserCoinState> {
  late final GlobalKey<State<StatefulWidget>>? familyKey;

  UserCoinState build([
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]);
}

/// See also [UserCoin].
@ProviderFor(UserCoin)
const userCoinProvider = UserCoinFamily();

/// See also [UserCoin].
class UserCoinFamily extends Family<UserCoinState> {
  /// See also [UserCoin].
  const UserCoinFamily();

  /// See also [UserCoin].
  UserCoinProvider call([
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]) {
    return UserCoinProvider(
      familyKey,
    );
  }

  @override
  UserCoinProvider getProviderOverride(
    covariant UserCoinProvider provider,
  ) {
    return call(
      provider.familyKey,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userCoinProvider';
}

/// See also [UserCoin].
class UserCoinProvider
    extends AutoDisposeNotifierProviderImpl<UserCoin, UserCoinState> {
  /// See also [UserCoin].
  UserCoinProvider([
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]) : this._internal(
          () => UserCoin()..familyKey = familyKey,
          from: userCoinProvider,
          name: r'userCoinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userCoinHash,
          dependencies: UserCoinFamily._dependencies,
          allTransitiveDependencies: UserCoinFamily._allTransitiveDependencies,
          familyKey: familyKey,
        );

  UserCoinProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.familyKey,
  }) : super.internal();

  final GlobalKey<State<StatefulWidget>>? familyKey;

  @override
  UserCoinState runNotifierBuild(
    covariant UserCoin notifier,
  ) {
    return notifier.build(
      familyKey,
    );
  }

  @override
  Override overrideWith(UserCoin Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserCoinProvider._internal(
        () => create()..familyKey = familyKey,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        familyKey: familyKey,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<UserCoin, UserCoinState> createElement() {
    return _UserCoinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserCoinProvider && other.familyKey == familyKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, familyKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserCoinRef on AutoDisposeNotifierProviderRef<UserCoinState> {
  /// The parameter `familyKey` of this provider.
  GlobalKey<State<StatefulWidget>>? get familyKey;
}

class _UserCoinProviderElement
    extends AutoDisposeNotifierProviderElement<UserCoin, UserCoinState>
    with UserCoinRef {
  _UserCoinProviderElement(super.provider);

  @override
  GlobalKey<State<StatefulWidget>>? get familyKey =>
      (origin as UserCoinProvider).familyKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
