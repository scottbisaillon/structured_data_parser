// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeSchema _$RecipeSchemaFromJson(Map<String, dynamic> json) => RecipeSchema(
      type: $enumDecodeNullable(_$SchemaTypeEnumMap, json['@type']) ??
          SchemaType.recipe,
      name: json['name'] as String?,
      description: json['description'] as String?,
      performTime: const DurationJsonConverter()
          .fromJson(json['performTime'] as String?),
      prepTime:
          const DurationJsonConverter().fromJson(json['prepTime'] as String?),
      totalTime:
          const DurationJsonConverter().fromJson(json['totalTime'] as String?),
      keywords: _readValueRecipeKeywords(json, 'keywords') == null
          ? []
          : _recipeKeywordsFromJson(_readValueRecipeKeywords(json, 'keywords')),
      cookTime:
          const DurationJsonConverter().fromJson(json['cookTime'] as String?),
      cookingMethod: json['cookingMethod'] as String?,
      recipeCategory: json['recipeCategory'] == null
          ? []
          : const StringListJsonConverter().fromJson(json['recipeCategory']),
      recipeCuisine: json['recipeCuisine'] == null
          ? []
          : const StringListJsonConverter().fromJson(json['recipeCuisine']),
      recipeIngredient: json['recipeIngredient'] == null
          ? []
          : _recipeIngredientsFromJson(json['recipeIngredient'] as List),
      recipeInstructions: const HowToJsonConverter()
          .fromJson(howToReadValue(json, 'recipeInstructions')),
      recipeYield: json['recipeYield'] == null
          ? []
          : const StringListJsonConverter().fromJson(json['recipeYield']),
    );

Map<String, dynamic> _$RecipeSchemaToJson(RecipeSchema instance) =>
    <String, dynamic>{
      '@type': _$SchemaTypeEnumMap[instance.type]!,
      'name': instance.name,
      'description': instance.description,
      'performTime': const DurationJsonConverter().toJson(instance.performTime),
      'prepTime': const DurationJsonConverter().toJson(instance.prepTime),
      'totalTime': const DurationJsonConverter().toJson(instance.totalTime),
      'keywords': instance.keywords,
      'cookTime': const DurationJsonConverter().toJson(instance.cookTime),
      'cookingMethod': instance.cookingMethod,
      'recipeCategory':
          const StringListJsonConverter().toJson(instance.recipeCategory),
      'recipeCuisine':
          const StringListJsonConverter().toJson(instance.recipeCuisine),
      'recipeIngredient': instance.recipeIngredient,
      'recipeInstructions':
          const HowToJsonConverter().toJson(instance.recipeInstructions),
      'recipeYield':
          const StringListJsonConverter().toJson(instance.recipeYield),
    };

const _$SchemaTypeEnumMap = {
  SchemaType.recipe: 'Recipe',
};
