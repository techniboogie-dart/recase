/// An instance of text to be re-cased.
class ReCase {
  final RegExp _upperAlphaRegex = RegExp(r'[A-Z]');

  final symbolSet = {' ', '.', '/', '_', '\\', '-'};

  late String originalText;
  late List<String> _words;

  ReCase(String text) {
    this.originalText = text;
    this._words = _groupIntoWords(text);
  }

  List<String> _groupIntoWords(String text) {
    StringBuffer sb = StringBuffer();
    List<String> words = [];
    bool isAllCaps = text.toUpperCase() == text;

    for (int i = 0; i < text.length; i++) {
      String char = text[i];
      String? nextChar = i + 1 == text.length ? null : text[i + 1];

      if (symbolSet.contains(char)) {
        continue;
      }

      sb.write(char);

      bool isEndOfWord = nextChar == null ||
          (_upperAlphaRegex.hasMatch(nextChar) && !isAllCaps) ||
          symbolSet.contains(nextChar);

      if (isEndOfWord) {
        words.add(sb.toString());
        sb.clear();
      }
    }

    return words;
  }

  /// camelCase
  String get camelCase => _getCamelCase();

  /// CONSTANT_CASE
  String get constantCase => _getConstantCase();

  /// Sentence case
  String get sentenceCase => _getSentenceCase();

  /// snake_case
  String get snakeCase => _getSnakeCase();

  /// dot.case
  String get dotCase => _getSnakeCase(separator: '.');

  /// param-case
  String get paramCase => _getSnakeCase(separator: '-');

  /// path/case
  String get pathCase => _getSnakeCase(separator: '/');

  /// PascalCase
  String get pascalCase => _getPascalCase();

  /// Header-Case
  String get headerCase => _getPascalCase(separator: '-');

  /// Title Case
  String get titleCase => _getTitleCase(separator: ' ');

  String _getCamelCase({String separator = ''}) {
    List<String> words = this._words.map(_upperCaseFirstLetter).toList();
    if (_words.isNotEmpty) {
      words[0] = words[0].toLowerCase();
    }

    return words.join(separator);
  }

  String _getConstantCase({String separator = '_'}) {
    List<String> words = this._words.map((word) => word.toUpperCase()).toList();

    return words.join(separator);
  }

  String _getPascalCase({String separator = ''}) {
    List<String> words = this._words.map(_upperCaseFirstLetter).toList();

    return words.join(separator);
  }

  String _getSentenceCase({String separator = ' '}) {
    List<String> words = this._words.map((word) => word.toLowerCase()).toList();
    if (_words.isNotEmpty) {
      words[0] = _upperCaseFirstLetter(words[0]);
    }

    return words.join(separator);
  }

  String _getSnakeCase({String separator = '_'}) {
    List<String> words = this._words.map((word) => word.toLowerCase()).toList();

    return words.join(separator);
  }

  // following APA Style guide:
  // - https://apastyle.apa.org/style-grammar-guidelines/capitalization/title-case
  String _getTitleCase({String separator = ' '}) {
    // reset all to lowercase
    List<String> words = this._words.map((word) => word.toLowerCase()).toList();
    // exclusion list
    List<String> exclusionListEng = [
      // articles
      'a',
      'an',
      'the',
      // coordinating conjunctions
      'and',
      'but',
      'for',
      // 'nor', // not NYT-style
      'or',
      // 'so', // not NYT-style
      'yet',
      // short prepositions (< 4 chars)
      'as',
      'at',
      'by',
      'en',
      'if',
      'in',
      'of',
      // 'off', // not NYT-style
      'on',
      'per',
      'to',
      // 'up', // not NYT-style
      'v.',
      'via',
      'vs.'
    ];
    List<String> punctuationList = [':', '--', '.', '?', '!'];

    // apply Title Case
    words = words.asMap().entries.map((word) {
      var isFirstWord = word.key == 0;
      var isAfterPunctuation =
          !isFirstWord && punctuationList.contains(words[word.key - 1]);
      var isExcluded = exclusionListEng.contains(word.value);

      // If NOT first word exception AND is NOT after punctuation AND is part of the exclusion list
      if (!isFirstWord && !isAfterPunctuation && isExcluded) {
        // return word unchanged
        return word.value;
      }

      // capitalize first letter of word
      return _upperCaseFirstLetter(word.value);
    }).toList();

    // rejoin words into sentence string
    return words.join(separator);
  }

  String _upperCaseFirstLetter(String word) {
    return '${word.substring(0, 1).toUpperCase()}${word.substring(1).toLowerCase()}';
  }
}

extension StringReCase on String {
  String get camelCase => ReCase(this).camelCase;

  String get constantCase => ReCase(this).constantCase;

  String get sentenceCase => ReCase(this).sentenceCase;

  String get snakeCase => ReCase(this).snakeCase;

  String get dotCase => ReCase(this).dotCase;

  String get paramCase => ReCase(this).paramCase;

  String get pathCase => ReCase(this).pathCase;

  String get pascalCase => ReCase(this).pascalCase;

  String get headerCase => ReCase(this).headerCase;

  String get titleCase => ReCase(this).titleCase;
}
