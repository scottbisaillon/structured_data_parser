import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:structured_data_parser/src/models/models.dart';
import 'package:structured_data_parser/src/parsers/json_ld_parser.dart';

/// {@template structured_data_parser}
/// A parser for extracting structured data embeded in websites.
/// {@endtemplate}
class StructuredDataParser {
  /// Extracts [StructuredData] from the given [url] utilizing json+ld.
  static Future<StructuredData> extractJsonLd(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final doc = Document.html(response.body);
      return JsonLdParser.parse(doc);
    } catch (e) {
      return StructuredData(errorMessage: e.toString());
    }
  }
}
