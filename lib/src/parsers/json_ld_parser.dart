import 'dart:convert';

import 'package:html/dom.dart';
import 'package:structured_data_parser/src/models/models.dart';
import 'package:structured_data_parser/src/schemas/schema.dart';
import 'package:structured_data_parser/src/schemas/schema_type.dart';
import 'package:structured_data_parser/src/schemas/schemas.dart';

/// {@template json_ld_parser}
/// Parses ld+json JSON objects into [StructuredData].
///
/// source: https://json-ld.org/
/// {@endtemplate}
class JsonLdParser {
  /// Parses and returns all schemas found within [document].
  static StructuredData parse(Document document) {
    final elements = document.querySelectorAll('[type="application/ld+json"]');
    final schemas = <Schema>[];
    for (final element in elements) {
      final dynamic json = jsonDecode(element.text);
      if (json is Map<String, dynamic>) {
        if (json['@graph'] != null) {
          schemas.addAll(_parseSchemaList(json['@graph'] as List));
          final schema = _parseSchema(json);
          if (schema != null) {
            schemas.add(schema);
          }
        } else {
          final schema = _parseSchema(json);
          if (schema != null) {
            schemas.add(schema);
          }
        }
      } else if (json is List) {
        schemas.addAll(_parseSchemaList(json));
      }
    }
    return StructuredData(schemas: schemas);
  }

  static List<Schema> _parseSchemaList(List<dynamic> objects) {
    final schemas = <Schema>[];
    for (final object in objects) {
      final schema = _parseSchema(object as Map<String, dynamic>);
      if (schema != null) {
        schemas.add(schema);
      }
    }
    return schemas;
  }

  static Schema? _parseSchema(Map<String, dynamic> object) {
    switch (object['@type']) {
      case SchemaConstants.recipe:
        return RecipeSchema.fromJson(object);
      default:
        return null;
    }
  }
}
