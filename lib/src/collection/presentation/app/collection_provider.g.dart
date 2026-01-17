// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$collectionHash() => r'98014d0227cc351a7fd905a0a76f6ac25fb6dc48';

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

abstract class _$Collection
    extends BuildlessAutoDisposeNotifier<CollectionState> {
  late final GlobalKey<State<StatefulWidget>>? familyKey;

  CollectionState build([
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]);
}

/// See also [Collection].
@ProviderFor(Collection)
const collectionProvider = CollectionFamily();

/// See also [Collection].
class CollectionFamily extends Family<CollectionState> {
  /// See also [Collection].
  const CollectionFamily();

  /// See also [Collection].
  CollectionProvider call([
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]) {
    return CollectionProvider(
      familyKey,
    );
  }

  @override
  CollectionProvider getProviderOverride(
    covariant CollectionProvider provider,
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
  String? get name => r'collectionProvider';
}

/// See also [Collection].
class CollectionProvider
    extends AutoDisposeNotifierProviderImpl<Collection, CollectionState> {
  /// See also [Collection].
  CollectionProvider([
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]) : this._internal(
          () => Collection()..familyKey = familyKey,
          from: collectionProvider,
          name: r'collectionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$collectionHash,
          dependencies: CollectionFamily._dependencies,
          allTransitiveDependencies:
              CollectionFamily._allTransitiveDependencies,
          familyKey: familyKey,
        );

  CollectionProvider._internal(
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
  CollectionState runNotifierBuild(
    covariant Collection notifier,
  ) {
    return notifier.build(
      familyKey,
    );
  }

  @override
  Override overrideWith(Collection Function() create) {
    return ProviderOverride(
      origin: this,
      override: CollectionProvider._internal(
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
  AutoDisposeNotifierProviderElement<Collection, CollectionState>
      createElement() {
    return _CollectionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CollectionProvider && other.familyKey == familyKey;
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
mixin CollectionRef on AutoDisposeNotifierProviderRef<CollectionState> {
  /// The parameter `familyKey` of this provider.
  GlobalKey<State<StatefulWidget>>? get familyKey;
}

class _CollectionProviderElement
    extends AutoDisposeNotifierProviderElement<Collection, CollectionState>
    with CollectionRef {
  _CollectionProviderElement(super.provider);

  @override
  GlobalKey<State<StatefulWidget>>? get familyKey =>
      (origin as CollectionProvider).familyKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
