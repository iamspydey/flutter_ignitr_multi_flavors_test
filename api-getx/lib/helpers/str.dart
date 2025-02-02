import 'package:recase/recase.dart';

/// A utility class for string manipulation.
///
/// The `Str` class provides methods to convert strings into different cases
/// using the `ReCase` package. It allows you to easily access multiple
/// properties to get different string cases.
///
/// {@tool snippet}
/// Example usage:
///
/// ```dart
/// Str.of("hello world").ucFirst(); // "Hello world"
/// ```
/// {@end-tool}
///
/// Properties:
/// - `text`: A `ReCase` object that holds the original string and its different cases.
///   you can call all available properties of `ReCase` class.
///  Example: `Str.of("hello world").text.camelCase;`
/// This will return `helloWorld`
///
/// Methods:
/// - `of(String txt)`: Converts a string to a `Str` object.
/// - `ucFirst()`: Converts the first letter of the string to uppercase.
/// - `sentenceCase()`: Converts the string to sentence case.
/// - `slug()`: Converts the string to slug case.
/// - `param()`: Converts the string to param case.
/// - `toLower()`: Converts the string to lowercase.
/// - `toUpper()`: Converts the string to uppercase.
/// - `snake()`: Converts the string to snake case.
/// - `title()`: Converts the string to title case.
/// - `pascal()`: Converts the string to Pascal case.
/// - `dot()`: Converts the string to dot case.
/// - `path()`: Converts the string to path case.
/// - `header()`: Converts the string to header case.
/// - `constant()`: Converts the string to constant case.
class Str {
  ReCase text = ReCase("");
  Str(String txt) {
    text = ReCase(txt);
  }

  /// This converts [String] to [ReCase] object in which you can
  /// Access multiple properties in order to get the different string cases
  ///
  /// param: [String] txt
  ///
  /// returns: [Str]
  static Str of(String txt) {
    return Str(txt);
  }

  /// Covert given [String] to `First letter of string uppercase`
  ///
  /// Example: `"hello world" => "Hello world"`
  String ucFirst() {
    return text.sentenceCase;
  }

  /// Covert given [String] to `Sentence case`
  ///
  /// Example: `"hello world" => "Hello world"`
  String sentenceCase() {
    return text.sentenceCase;
  }

  /// Covert given [String] to `slug-case`
  ///
  /// Example: `"Hello World" => "hello-world"`
  String slug() {
    return text.paramCase;
  }

  /// Covert given [String] to `param-case`
  ///
  /// Example: `"Hello World" => "hello-world"`
  String param() {
    return text.paramCase;
  }

  /// Covert given [String] to `lowercase`
  ///
  /// Example: `"Hello world" => "hello world"`
  String toLower() {
    return text.originalText.toLowerCase();
  }

  /// Covert given [String] to `uppercase`
  ///
  /// Example `"hello" => "HELLO"`
  String toUpper() {
    return text.originalText.toUpperCase();
  }

  /// Covert given [String] to `snake_case`
  ///
  /// Example: `"Hello world" => "hello_world"`
  String snake() {
    return text.snakeCase;
  }

  /// Covert given [String] to `Title Case`
  ///
  /// Example: `"hello world" => "Hello World"`
  String title() {
    return text.titleCase;
  }

  /// Covert given [String] to `PascalCase`
  ///
  /// Example: `"hello world" => "HelloWorld"`
  String pascal() {
    return text.pascalCase;
  }

  /// Covert given [String] to `dot.case`
  ///
  /// Example: `"hello world" => "hello.world"`
  String dot() {
    return text.dotCase;
  }

  /// Covert given [String] to `path/case`
  ///
  /// Example: `"hello world" => "hello/world"`
  String path() {
    return text.pathCase;
  }

  /// Covert given [String] to `Header-Case`
  ///
  /// Example: `"hello world" => "Hello-World"`
  String header() {
    return text.headerCase;
  }

  /// Covert given [String] to `CONSTANT_CASE`
  ///
  /// Example: `"hello world" => "HELLO_WORLD"`
  String constant() {
    return text.constantCase;
  }
}
