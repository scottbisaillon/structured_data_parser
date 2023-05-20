// ignore_for_file: lines_longer_than_80_chars

import 'package:json_annotation/json_annotation.dart';
import 'package:structured_data_parser/src/converters/duration_converter.dart';
import 'package:structured_data_parser/src/parsers/parsers.dart';
import 'package:structured_data_parser/src/schemas/how_to/how_to.dart';
import 'package:structured_data_parser/src/schemas/schema.dart';
import 'package:structured_data_parser/src/schemas/schema_type.dart';
import 'package:structured_data_parser/src/utils/sanitize.dart';

part 'recipe_schema.g.dart';

List<String> _recipeIngredientsFromJson(List<dynamic> json) =>
    json.map((dynamic e) => sanitizeInput(e as String)!).toList();

Object? _readValueRecipeKeywords(Map<dynamic, dynamic> json, String key) =>
    json[key] as dynamic;

List<String> _recipeKeywordsFromJson(dynamic json) {
  final result = <String>[];
  if (json is List) {
    result.addAll(json.map((dynamic e) => (e as String).toLowerCase()));
  } else if (json is String && json.contains(',')) {
    result.addAll(json.split(',').map((e) => e.trim().toLowerCase()));
  }

  return result;
}

/// {@template recipe_schema}
/// A recipe. For dietary restrictions covered by the recipe,
/// a few common restrictions are enumerated via suitableForDiet.
///  The keywords property can also be used to add more detail.
/// {@endtemplate}
@JsonSerializable()
class RecipeSchema extends Schema {
  /// {@macro recipe_schema}
  RecipeSchema({
    super.type = SchemaType.recipe,
    String? name,
    String? description,
    this.performTime,
    this.prepTime,
    this.totalTime,
    required this.keywords,
    this.cookTime,
    this.cookingMethod,
    required this.recipeCategory,
    required this.recipeCuisine,
    required this.recipeIngredient,
    required this.recipeInstructions,
    required this.recipeYield,
  })  : name = sanitizeInput(name),
        description = sanitizeInput(description);

  /// Factory constructor for creating a [RecipeSchema] from a json map.
  factory RecipeSchema.fromJson(Map<String, dynamic> json) =>
      _$RecipeSchemaFromJson(json);

  /** Properties from Thing */
  /// The name of the item.
  final String? name;

  /// A description of the item.
  final String? description;

  /** Properties from HowTo */
  /// The length of time it takes to perform instructions or a direction
  /// (not including time to prepare the supplies), in ISO 8601 duration format.
  @DurationJsonConverter()
  final Duration? performTime;

  /// The length of time it takes to prepare the items to be used in instructions or a direction,
  /// in ISO 8601 duration format.
  @DurationJsonConverter()
  final Duration? prepTime;

  /// The total time required to perform instructions or a direction
  /// (including time to prepare the supplies), in ISO 8601 duration format.
  @DurationJsonConverter()
  final Duration? totalTime;

  /** Properties from CreativeWork */
  /// Keywords or tags used to describe some item.
  /// Multiple textual entries in a keywords list are typically delimited by commas, or by repeating the property.
  @JsonKey(
    defaultValue: <String>[],
    readValue: _readValueRecipeKeywords,
    fromJson: _recipeKeywordsFromJson,
  )
  final List<String> keywords;

  /** Properties from Recipe */
  /// The time it takes to actually cook the dish, in ISO 8601 duration format.
  @DurationJsonConverter()
  final Duration? cookTime;

  /// The method of cooking, such as Frying, Steaming, ...
  final String? cookingMethod;

  /// The category of the recipe—for example, appetizer, entree, etc.
  @JsonKey(defaultValue: <String>[])
  @StringListJsonConverter()
  final List<String> recipeCategory;

  /// The cuisine of the recipe (for example, French or Ethiopian).
  @JsonKey(defaultValue: <String>[])
  @StringListJsonConverter()
  final List<String> recipeCuisine;

  /// A single ingredient used in the recipe, e.g. sugar, flour or garlic.
  @JsonKey(defaultValue: <String>[], fromJson: _recipeIngredientsFromJson)
  final List<String> recipeIngredient;

  /// A step in making the recipe,
  /// in the form of a single item (document, video, etc.) or
  /// an ordered list with HowToStep and/or HowToSection items,
  @HowToJsonConverter()
  @JsonKey(readValue: howToReadValue)
  final List<HowTo> recipeInstructions;

  /// The quantity produced by the recipe
  /// (for example, number of people served, number of servings, etc).
  @JsonKey(defaultValue: <String>[])
  @StringListJsonConverter()
  final List<String> recipeYield;

  @override
  List<Object?> get props => [
        type,
        name,
        description,
        performTime,
        prepTime,
        totalTime,
        keywords,
        cookTime,
        cookingMethod,
        recipeCategory,
        recipeCuisine,
        recipeIngredient,
        recipeInstructions,
        recipeYield,
      ];

  @override
  String toString() {
    return 'RecipeSchema(name: $name, description: $description, performTime: $performTime, prepTime: $prepTime, totalTime: $totalTime, keywords: $keywords, cookTime: $cookTime, cookingMethod: $cookingMethod, recipeCategory: $recipeCategory, recipeCuisine: $recipeCuisine, recipeIngredient: $recipeIngredient, recipeInstructions: $recipeInstructions, recipeYield: $recipeYield)';
  }
}
