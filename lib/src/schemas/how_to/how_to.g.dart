// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'how_to.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HowToSection _$HowToSectionFromJson(Map<String, dynamic> json) => HowToSection(
      type: $enumDecodeNullable(_$HowToTypeEnumMap, json['@type']) ??
          HowToType.howToSection,
      position: json['position'] as int?,
      name: json['name'] as String,
      itemListElement: (json['itemListElement'] as List<dynamic>?)
              ?.map((e) => HowToStep.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$HowToSectionToJson(HowToSection instance) =>
    <String, dynamic>{
      '@type': _$HowToTypeEnumMap[instance.type]!,
      'position': instance.position,
      'name': instance.name,
      'itemListElement': instance.itemListElement,
    };

const _$HowToTypeEnumMap = {
  HowToType.howToSection: 'HowToSection',
  HowToType.howToStep: 'HowToStep',
};

HowToStep _$HowToStepFromJson(Map<String, dynamic> json) => HowToStep(
      type: $enumDecodeNullable(_$HowToTypeEnumMap, json['@type']) ??
          HowToType.howToStep,
      position: json['position'] as int?,
      text: json['text'] as String,
    );

Map<String, dynamic> _$HowToStepToJson(HowToStep instance) => <String, dynamic>{
      '@type': _$HowToTypeEnumMap[instance.type]!,
      'position': instance.position,
      'text': instance.text,
    };
