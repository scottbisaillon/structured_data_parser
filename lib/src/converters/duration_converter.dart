import 'package:json_annotation/json_annotation.dart';
import 'package:structured_data_parser/src/parsers/parsers.dart';

/// {@template duration_json_converter}
/// Converts an ISO8601 duration string to and from [Duration].
/// {@endtemplate}
class DurationJsonConverter implements JsonConverter<Duration?, String?> {
  /// {@macro duration_json_converter}
  const DurationJsonConverter();

  @override
  Duration? fromJson(String? json) {
    return json != null ? DurationParser.parse(json) : null;
  }

  @override
  String? toJson(Duration? object) {
    throw UnimplementedError();
  }
}
