import 'package:json_annotation/json_annotation.dart';

/// {@template string_list_json_converter}
/// Converts a [List] or any object into a list of strings.
/// {@endtemplate}
class StringListJsonConverter implements JsonConverter<List<String>, Object?> {
  /// {@macro string_list_json_converter}
  const StringListJsonConverter();

  @override
  List<String> fromJson(Object? json) {
    final result = <String>[];
    if (json is List) {
      result
          .addAll(json.map((dynamic e) => (e as String).trim().toLowerCase()));
    } else if (json is String) {
      result.add(json.trim().toLowerCase());
    } else {
      result.add(json.toString().trim().toLowerCase());
    }
    return result;
  }

  @override
  Object? toJson(List<String> object) {
    throw UnimplementedError();
  }
}
