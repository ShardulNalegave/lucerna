// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper_finder.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$findPapersHash() => r'f12358123763b9452fd84090064f1eb0af4d8d7b';

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

/// See also [findPapers].
@ProviderFor(findPapers)
const findPapersProvider = FindPapersFamily();

/// See also [findPapers].
class FindPapersFamily extends Family<AsyncValue<List<Paper>>> {
  /// See also [findPapers].
  const FindPapersFamily();

  /// See also [findPapers].
  FindPapersProvider call(String query) {
    return FindPapersProvider(query);
  }

  @override
  FindPapersProvider getProviderOverride(
    covariant FindPapersProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'findPapersProvider';
}

/// See also [findPapers].
class FindPapersProvider extends AutoDisposeFutureProvider<List<Paper>> {
  /// See also [findPapers].
  FindPapersProvider(String query)
    : this._internal(
        (ref) => findPapers(ref as FindPapersRef, query),
        from: findPapersProvider,
        name: r'findPapersProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$findPapersHash,
        dependencies: FindPapersFamily._dependencies,
        allTransitiveDependencies: FindPapersFamily._allTransitiveDependencies,
        query: query,
      );

  FindPapersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<Paper>> Function(FindPapersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FindPapersProvider._internal(
        (ref) => create(ref as FindPapersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Paper>> createElement() {
    return _FindPapersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FindPapersProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FindPapersRef on AutoDisposeFutureProviderRef<List<Paper>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _FindPapersProviderElement
    extends AutoDisposeFutureProviderElement<List<Paper>>
    with FindPapersRef {
  _FindPapersProviderElement(super.provider);

  @override
  String get query => (origin as FindPapersProvider).query;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
