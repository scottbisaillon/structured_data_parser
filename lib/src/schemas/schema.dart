import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:structured_data_parser/src/schemas/schema_type.dart';

/// {@template schema}
/// The base schema class that all implementation must implement.
///
/// source: https://schema.org/docs/schemas.html
/// {@endtemplate}
abstract class Schema extends Equatable {
  /// {@macro schema}
  const Schema({required this.type});

  /// The type of schema.
  @JsonKey(name: '@type')
  @JsonEnum()
  final SchemaType type;
}
