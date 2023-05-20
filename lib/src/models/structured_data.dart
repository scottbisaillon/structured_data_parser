// ignore_for_file: lines_longer_than_80_chars

import 'package:collection/collection.dart';
import 'package:structured_data_parser/src/schemas/schema.dart';

/// {@template structured_data}
/// A model representing the structured data extracted from a website's metadata.
///
/// source: https://developers.google.com/search/docs/advanced/structured-data/intro-structured-data
/// source: https://schema.org/
/// {@endtemplate}
class StructuredData {
  /// {@macro structured_data}
  const StructuredData({this.errorMessage, this.schemas = const []});

  /// An error message if parsing was unnsuccessful.
  final String? errorMessage;

  /// List of extracted schemas.
  ///
  /// see: https://schema.org/
  final List<Schema> schemas;

  /// Retreives the first schema of type [T] if it exists, otherwise, null.
  T? getSchema<T extends Schema>() {
    return schemas.firstWhereOrNull((element) => element is T) as T?;
  }
}
