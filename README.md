## ReCase ##

Changes the case of the input text to the desire case convention.

Requires Dart 3.13 or later and is compatible with Flutter 3.47 or later.
ReCase is a pure Dart package with no runtime dependencies. It can be used in
Flutter apps with `material_ui` without importing or depending on a UI library.

    import 'package:recase/recase.dart';

    void main() {
      ReCase rc = ReCase('Just_someSample-text');

      print(rc.camelCase); // Prints 'justSomeSampleText'
      print(rc.constantCase); // Prints 'JUST_SOME_SAMPLE_TEXT'
    }

String extensions are also available.

    import 'package:recase/recase.dart';

    void main() {
      String sample = 'Just_someSample-text';

      print(sample.camelCase); // Prints 'justSomeSampleText'
      print(sample.constantCase); // Prints 'JUST_SOME_SAMPLE_TEXT'
    }
_String extensions have been available since version 3.0.0._


Supports:
* snake_case
* dot.case
* path/case
* param-case
* PascalCase
* Header-Case
* Title Case
* camelCase
* Sentence case
* CONSTANT_CASE
