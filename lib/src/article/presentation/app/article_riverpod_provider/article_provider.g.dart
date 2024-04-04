// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$articleAdapterHash() => r'84efe061ec9d0521f7687a828d17b53aaab96ace';

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

abstract class _$ArticleAdapter
    extends BuildlessAutoDisposeAsyncNotifier<PaginatedResp<Article>> {
  late final ArticleSource source;
  late final dynamic ext;
  late final GlobalKey<State<StatefulWidget>>? familyKey;

  FutureOr<PaginatedResp<Article>> build(
    ArticleSource source, [
    dynamic ext,
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]);
}

/// See also [ArticleAdapter].
@ProviderFor(ArticleAdapter)
const articleAdapterProvider = ArticleAdapterFamily();

/// See also [ArticleAdapter].
class ArticleAdapterFamily extends Family<AsyncValue<PaginatedResp<Article>>> {
  /// See also [ArticleAdapter].
  const ArticleAdapterFamily();

  /// See also [ArticleAdapter].
  ArticleAdapterProvider call(
    ArticleSource source, [
    dynamic ext,
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]) {
    return ArticleAdapterProvider(
      source,
      ext,
      familyKey,
    );
  }

  @override
  ArticleAdapterProvider getProviderOverride(
    covariant ArticleAdapterProvider provider,
  ) {
    return call(
      provider.source,
      provider.ext,
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
  String? get name => r'articleAdapterProvider';
}

/// See also [ArticleAdapter].
class ArticleAdapterProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ArticleAdapter, PaginatedResp<Article>> {
  /// See also [ArticleAdapter].
  ArticleAdapterProvider(
    ArticleSource source, [
    dynamic ext,
    GlobalKey<State<StatefulWidget>>? familyKey,
  ]) : this._internal(
          () => ArticleAdapter()
            ..source = source
            ..ext = ext
            ..familyKey = familyKey,
          from: articleAdapterProvider,
          name: r'articleAdapterProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$articleAdapterHash,
          dependencies: ArticleAdapterFamily._dependencies,
          allTransitiveDependencies:
              ArticleAdapterFamily._allTransitiveDependencies,
          source: source,
          ext: ext,
          familyKey: familyKey,
        );

  ArticleAdapterProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.source,
    required this.ext,
    required this.familyKey,
  }) : super.internal();

  final ArticleSource source;
  final dynamic ext;
  final GlobalKey<State<StatefulWidget>>? familyKey;

  @override
  FutureOr<PaginatedResp<Article>> runNotifierBuild(
    covariant ArticleAdapter notifier,
  ) {
    return notifier.build(
      source,
      ext,
      familyKey,
    );
  }

  @override
  Override overrideWith(ArticleAdapter Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArticleAdapterProvider._internal(
        () => create()
          ..source = source
          ..ext = ext
          ..familyKey = familyKey,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        source: source,
        ext: ext,
        familyKey: familyKey,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ArticleAdapter,
      PaginatedResp<Article>> createElement() {
    return _ArticleAdapterProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArticleAdapterProvider &&
        other.source == source &&
        other.ext == ext &&
        other.familyKey == familyKey;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, source.hashCode);
    hash = _SystemHash.combine(hash, ext.hashCode);
    hash = _SystemHash.combine(hash, familyKey.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ArticleAdapterRef
    on AutoDisposeAsyncNotifierProviderRef<PaginatedResp<Article>> {
  /// The parameter `source` of this provider.
  ArticleSource get source;

  /// The parameter `ext` of this provider.
  dynamic get ext;

  /// The parameter `familyKey` of this provider.
  GlobalKey<State<StatefulWidget>>? get familyKey;
}

class _ArticleAdapterProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ArticleAdapter,
        PaginatedResp<Article>> with ArticleAdapterRef {
  _ArticleAdapterProviderElement(super.provider);

  @override
  ArticleSource get source => (origin as ArticleAdapterProvider).source;
  @override
  dynamic get ext => (origin as ArticleAdapterProvider).ext;
  @override
  GlobalKey<State<StatefulWidget>>? get familyKey =>
      (origin as ArticleAdapterProvider).familyKey;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
