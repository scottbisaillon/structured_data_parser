// ignore_for_file: prefer_const_constructors
import 'package:structured_data_parser/structured_data_parser.dart';
import 'package:test/test.dart';

void main() {
  group('StructuredDataParser', () {
    group('Recipe Schema', () {
      group('json ld', () {
        test('should extract recipe from website', () async {
          final result = await StructuredDataParser.extractJsonLd(
            'https://www.cookingchanneltv.com/recipes/chocolate-chip-cookie-dough-truffles-2120435',
          );
          expect(result.getSchema<RecipeSchema>(), isNotNull);
        });

        test('should extract recipe from website with graph and schema at root',
            () async {
          final result = await StructuredDataParser.extractJsonLd(
            'https://www.delish.com/cooking/recipe-ideas/a22698129/baked-eggplant-parm-recipe/',
          );
          expect(result.getSchema<RecipeSchema>(), isNotNull);
        });
      });
    });
  });
}
