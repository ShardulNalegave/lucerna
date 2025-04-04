// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_paper.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addPaperHash() => r'1541bb7156029e1c13e258787606068335492b22';

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

/// See also [addPaper].
@ProviderFor(addPaper)
const addPaperProvider = AddPaperFamily();

/// See also [addPaper].
class AddPaperFamily extends Family<AsyncValue<Paper?>> {
  /// See also [addPaper].
  const AddPaperFamily();

  /// See also [addPaper].
  AddPaperProvider call(String doi, String title, String abstract) {
    return AddPaperProvider(doi, title, abstract);
  }

  @override
  AddPaperProvider getProviderOverride(covariant AddPaperProvider provider) {
    return call(provider.doi, provider.title, provider.abstract);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'addPaperProvider';
}

/// See also [addPaper].
class AddPaperProvider extends AutoDisposeFutureProvider<Paper?> {
  /// See also [addPaper].
  AddPaperProvider(String doi, String title, String abstract)
    : this._internal(
        (ref) => addPaper(ref as AddPaperRef, doi, title, abstract),
        from: addPaperProvider,
        name: r'addPaperProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$addPaperHash,
        dependencies: AddPaperFamily._dependencies,
        allTransitiveDependencies: AddPaperFamily._allTransitiveDependencies,
        doi: doi,
        title: title,
        abstract: abstract,
      );

  AddPaperProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.doi,
    required this.title,
    required this.abstract,
  }) : super.internal();

  final String doi;
  final String title;
  final String abstract;

  @override
  Override overrideWith(
    FutureOr<Paper?> Function(AddPaperRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddPaperProvider._internal(
        (ref) => create(ref as AddPaperRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        doi: doi,
        title: title,
        abstract: abstract,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Paper?> createElement() {
    return _AddPaperProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddPaperProvider &&
        other.doi == doi &&
        other.title == title &&
        other.abstract == abstract;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, doi.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, abstract.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AddPaperRef on AutoDisposeFutureProviderRef<Paper?> {
  /// The parameter `doi` of this provider.
  String get doi;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `abstract` of this provider.
  String get abstract;
}

class _AddPaperProviderElement extends AutoDisposeFutureProviderElement<Paper?>
    with AddPaperRef {
  _AddPaperProviderElement(super.provider);

  @override
  String get doi => (origin as AddPaperProvider).doi;
  @override
  String get title => (origin as AddPaperProvider).title;
  @override
  String get abstract => (origin as AddPaperProvider).abstract;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
