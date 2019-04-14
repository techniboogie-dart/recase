import 'package:test/test.dart';

import 'package:recase/recase.dart';

void main() {
  ReCase rcInput = new ReCase('This is-Some_sampleText. YouDig?');
  ReCase allCapsInput = new ReCase('FOO_BAR');
  ReCase acronynInput = new ReCase('My HTTP DBConnection-Info ID XML');

  group('snake_case', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.snakeCase, equals('this_is_some_sample_text_you_dig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.snakeCase, equals('foo_bar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.snakeCase, equals('my_http_db_connection_info_id_xml'));
    });

  });

  group('dot.case', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.dotCase, equals('this.is.some.sample.text.you.dig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.dotCase, equals('foo.bar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.dotCase, equals('my.http.db.connection.info.id.xml'));
    });
  });

  group('path/case', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.pathCase, equals('this/is/some/sample/text/you/dig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.pathCase, equals('foo/bar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.pathCase, equals('my/http/db/connection/info/id/xml'));
    });
  });

  group('param-case', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.paramCase, equals('this-is-some-sample-text-you-dig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.paramCase, equals('foo-bar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.paramCase, equals('my-http-db-connection-info-id-xml'));
    });
  });

  group('PascalCase', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.pascalCase, equals('ThisIsSomeSampleTextYouDig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.pascalCase, equals('FooBar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.pascalCase, equals('MyHttpDBConnectionInfoIdXml'));
    });
  });

  group('Header-Case', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.headerCase, equals('This-Is-Some-Sample-Text-You-Dig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.headerCase, equals('Foo-Bar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.headerCase, equals('My-Http-DB-Connection-Info-Id-Xml'));
    });
  });

  group('Title Case', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.titleCase, equals('This Is Some Sample Text You Dig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.titleCase, equals('Foo Bar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.titleCase, equals('My Http DB Connection Info Id Xml'));
    });
  });

  group('camelCase', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.camelCase, equals('thisIsSomeSampleTextYouDig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.camelCase, equals('fooBar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.camelCase, equals('myHttpDBConnectionInfoIdXml'));
    });
  });

  group('Sentence case', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.sentenceCase, equals('This is some sample text you dig?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.sentenceCase, equals('Foo bar'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.sentenceCase, equals('My http db connection info id xml'));
    });
  });

  group('CONSTANT_CASE', () {
    test('from "${rcInput.originalText}".', () {
      expect(rcInput.constantCase, equals('THIS_IS_SOME_SAMPLE_TEXT_YOU_DIG?'));
    });

    test('from "${allCapsInput.originalText}".', () {
      expect(allCapsInput.constantCase, equals('FOO_BAR'));
    });

    test('from "${acronynInput.originalText}".', () {
      expect(acronynInput.constantCase, equals('MY_HTTP_DB_CONNECTION_INFO_ID_XML'));
    });
  });
}
