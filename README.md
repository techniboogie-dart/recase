## ReCase ##

Changes the case of the input text to the desire case convention.

    import 'package:recase/recase.dart';

    void main() {
      ReCase rc = new ReCase('Just_someSample-text');

      print(rc.camelCase); // Prints 'justSomeSampleText'
      print(rc.constantCase); // Prints 'JUST_SOME_SAMPLE_TEXT'
    }

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
