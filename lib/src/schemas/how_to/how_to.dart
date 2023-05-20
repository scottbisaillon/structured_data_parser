// ignore_for_file: lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:structured_data_parser/src/utils/sanitize.dart';

part 'how_to.g.dart';

/// Customizes how List<HowTo> is read from the parsed json map.
Object? howToReadValue(Map<dynamic, dynamic> json, String key) {
  return json[key] as dynamic;
}

/// {@template how_to_json_converter}
/// Json converter for [HowTo].
/// {@endtemplate}
class HowToJsonConverter extends JsonConverter<List<HowTo>, dynamic> {
  /// {@macro how_to_json_converter}
  const HowToJsonConverter();

  @override
  List<HowTo> fromJson(dynamic json) {
    final result = <HowTo>[];
    if (json is List) {
      for (final element in json) {
        if ((element as Map<String, dynamic>)['@type'] == 'HowToSection') {
          result.add(HowToSection.fromJson(element));
        } else if (element['@type'] == 'HowToStep') {
          final step = HowToStep.fromJson(element);
          // step = step.copyWith(text: step.text.replaceAll('&nbsp;', ' '));
          result.add(step);
        }
      }
    } else if (json is String) {
      result.addAll(
        json
            .split('. ')
            .map((e) => e.endsWith('.') ? e : '$e.')
            .map((e) => HowToStep(text: e)),
      );
    }
    return result;
  }

  @override
  List<Map<String, dynamic>> toJson(dynamic object) {
    throw UnimplementedError();
  }
}

/// Enum indicating the type of [HowTo].
enum HowToType {
  /// A [HowToSection] which consists of a list of [HowToStep]s.
  @JsonValue('HowToSection')
  howToSection,

  /// A [HowToStep].
  @JsonValue('HowToStep')
  howToStep;
}

/// {@template how_to}
/// The base class for [HowToSection] and [HowToStep].
/// {@endtemplate}
abstract class HowTo extends Equatable {
  /// {@macro how_to}
  const HowTo({required this.type, this.position});

  /// Type differentiating between [HowToSection] and [HowToStep].
  @JsonKey(name: '@type')
  @JsonEnum()
  final HowToType type;

  /// The position of an item in a series or sequence of items.
  final int? position;

  /// Returns true if type is [HowToType.howToStep].
  bool get isStep => type == HowToType.howToStep;

  /// Returns true if type is [HowToType.howToSection].
  bool get isSection => type == HowToType.howToSection;
}

/// {@template how_to_section}
/// A sub-grouping of steps in the instructions for how to achieve a result (e.g. steps for making a pie crust within a pie recipe).
///
/// source: https://schema.org/HowToSection
/// {@endtemplate}
@JsonSerializable()
class HowToSection extends HowTo {
  /// {@macro how_to_section}
  HowToSection({
    super.type = HowToType.howToSection,
    super.position,
    required String name,
    required this.itemListElement,
  }) : name = sanitizeInput(name)!;

  /// Factory constructor to create a [HowToSection] from a json map.
  factory HowToSection.fromJson(Map<String, dynamic> json) =>
      _$HowToSectionFromJson(json);

  ///	The name of the item.
  final String name;

  /// For itemListElement values, you can use simple strings (e.g. "Peter", "Paul", "Mary"), existing entities, or use ListItem.
  /// Text values are best if the elements in the list are plain strings.
  /// Existing entities are best for a simple, unordered list of existing things in your data.
  /// ListItem is used with ordered lists when you want to provide additional context about the element in that list or when the same item might be in different places in different lists.
  /// Note: The order of elements in your mark-up is not sufficient for indicating the order or elements. Use ListItem with a 'position' property in such cases.
  @JsonKey(defaultValue: <HowToStep>[])
  final List<HowToStep> itemListElement;

  @override
  List<Object?> get props => [type, position, name, itemListElement];

  @override
  String toString() =>
      "HowToSection(type: $type, name: '$name', itemListElement: $itemListElement)";
}

// TODO(scottbisaillon): This currnent implementation assumes that HowToStep is a simple string and does not have any nested items.

/// {@template how_to_step}
/// A step in the instructions for how to achieve a result. It is an ordered list with HowToDirection and/or HowToTip items.
///
/// source: https://schema.org/HowToStep
/// {@endtemplate}
@JsonSerializable()
class HowToStep extends HowTo {
  /// {@macro how_to_step}
  HowToStep({
    super.type = HowToType.howToStep,
    super.position,
    required String text,
  }) : text = sanitizeInput(text)!;

  /// Factory constructor to create a [HowToStep] from a json map.
  factory HowToStep.fromJson(Map<String, dynamic> json) =>
      _$HowToStepFromJson(json);

  /// The textual content of this CreativeWork.
  final String text;

  @override
  List<Object?> get props => [type, position, text, position];

  @override
  String toString() => "HowToStep(position: $position, text: '$text')";

  /// Returns a copy of this [HowToStep] with the specified fields.
  HowToStep copyWith({
    String? text,
  }) {
    return HowToStep(
      text: text ?? this.text,
    );
  }
}
