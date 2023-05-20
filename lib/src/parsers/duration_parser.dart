import 'package:structured_data_parser/src/grammars/iso_8601_duration_grammar.dart';

/// {@template duration_parser}
/// Parses a duration of the format: https://en.wikipedia.org/wiki/ISO_8601#Durations.
/// {@endtemplate}
class DurationParser {
  /// {@macro duration_parser}
  static Duration? parse(String input) {
    final result = ISO8601DurationGrammar().build<Duration>().parse(input);
    return result.isSuccess ? result.value : null;
  }
}
