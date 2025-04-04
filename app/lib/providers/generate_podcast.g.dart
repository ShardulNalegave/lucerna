// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_podcast.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$generatePodcastHash() => r'422d68ab5045a9c83c0a8bf6df742b222bf16529';

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

/// See also [generatePodcast].
@ProviderFor(generatePodcast)
const generatePodcastProvider = GeneratePodcastFamily();

/// See also [generatePodcast].
class GeneratePodcastFamily extends Family<AsyncValue<bool>> {
  /// See also [generatePodcast].
  const GeneratePodcastFamily();

  /// See also [generatePodcast].
  GeneratePodcastProvider call(String filePath) {
    return GeneratePodcastProvider(filePath);
  }

  @override
  GeneratePodcastProvider getProviderOverride(
    covariant GeneratePodcastProvider provider,
  ) {
    return call(provider.filePath);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'generatePodcastProvider';
}

/// See also [generatePodcast].
class GeneratePodcastProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [generatePodcast].
  GeneratePodcastProvider(String filePath)
    : this._internal(
        (ref) => generatePodcast(ref as GeneratePodcastRef, filePath),
        from: generatePodcastProvider,
        name: r'generatePodcastProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$generatePodcastHash,
        dependencies: GeneratePodcastFamily._dependencies,
        allTransitiveDependencies:
            GeneratePodcastFamily._allTransitiveDependencies,
        filePath: filePath,
      );

  GeneratePodcastProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filePath,
  }) : super.internal();

  final String filePath;

  @override
  Override overrideWith(
    FutureOr<bool> Function(GeneratePodcastRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GeneratePodcastProvider._internal(
        (ref) => create(ref as GeneratePodcastRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filePath: filePath,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _GeneratePodcastProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GeneratePodcastProvider && other.filePath == filePath;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filePath.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GeneratePodcastRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `filePath` of this provider.
  String get filePath;
}

class _GeneratePodcastProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with GeneratePodcastRef {
  _GeneratePodcastProviderElement(super.provider);

  @override
  String get filePath => (origin as GeneratePodcastProvider).filePath;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
