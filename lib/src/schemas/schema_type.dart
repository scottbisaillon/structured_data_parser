import 'package:json_annotation/json_annotation.dart';

/// Schema @type values.
class SchemaConstants {
  /// Recipe schema type.
  ///
  /// source: https://schema.org/Recipe
  static const String recipe = 'Recipe';
}

/// {@template schema_type}
/// Enum representing all the schema types.
///
/// source: https://schema.org/docs/full.html
/// {@endtemplate}
enum SchemaType {
  /// Recipe schema type.
  ///
  /// source: https://schema.org/Recipe
  @JsonValue(SchemaConstants.recipe)
  recipe;
}
