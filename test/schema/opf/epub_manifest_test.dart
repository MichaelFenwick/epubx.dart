library epubreadertest;

import 'package:repub/repub.dart';
import 'package:test/test.dart';

Future<void> main() async {
  final EpubManifest reference = EpubManifest(items: <EpubManifestItem>[
    EpubManifestItem(
        fallback: 'Some Fallback',
        fallbackStyle: 'A Very Stylish Fallback',
        href: 'Some HREF',
        id: 'Some ID',
        mediaType: 'MKV',
        requiredModules: 'nodejs require()',
        requiredNamespace: '.NET Namespace')
  ]);

  late EpubManifest testManifest;
  setUp(() async {
    testManifest = EpubManifest(
      items: List<EpubManifestItem>.from(reference.items),
    );
  });

  group('EpubManifest', () {
    group('.equals', () {
      test('is true for equivalent objects', () async {
        expect(testManifest, equals(reference));
      });

      test('is false when Items changes', () async {
        testManifest.items.add(
          EpubManifestItem(
              fallback: 'Some Different Fallback',
              fallbackStyle: 'A less than Stylish Fallback',
              href: 'Some Different HREF',
              id: 'Some Different ID',
              mediaType: 'RealPlayer',
              requiredModules: 'require()',
              requiredNamespace: 'Namespace'),
        );

        expect(testManifest, isNot(reference));
      });
    });

    group('.hashCode', () {
      test('is true for equivalent objects', () async {
        expect(testManifest.hashCode, equals(reference.hashCode));
      });

      test('is false when Items changes', () async {
        testManifest.items.add(
          EpubManifestItem(
              fallback: 'Some Different Fallback',
              fallbackStyle: 'A less than Stylish Fallback',
              href: 'Some Different HREF',
              id: 'Some Different ID',
              mediaType: 'RealPlayer',
              requiredModules: 'require()',
              requiredNamespace: 'Namespace'),
        );
        expect(testManifest.hashCode, isNot(reference.hashCode));
      });
    });
  });
}
