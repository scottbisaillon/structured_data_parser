import 'package:structured_data_parser/src/parsers/parsers.dart';
import 'package:test/test.dart';

void main() {
  group('DurationParser', () {
    test(
      "'P3Y6M4DT12H30M5S' shoud return [${const Duration(
        days: (3 * 12 * 4 * 7) + (6 * 4 * 7) + (0 * 7) + 4,
        hours: 12,
        minutes: 30,
        seconds: 5,
      )}]",
      () {
        const input = 'P3Y6M4DT12H30M5S';
        const output = Duration(
          days: (3 * 12 * 4 * 7) + (6 * 4 * 7) + (0 * 7) + 4,
          hours: 12,
          minutes: 30,
          seconds: 5,
        );
        final result = DurationParser.parse(input);
        expect(result, isNotNull);
        expect(result, equals(output));
      },
    );

    test(
      "'P0,5M' shoud return [${const Duration(days: 14)}]",
      () {
        const input = 'P0,5M';
        const output = Duration(days: 14);
        final result = DurationParser.parse(input);
        expect(result, isNotNull);
        expect(result, equals(output));
      },
    );

    test(
      "'P0.5M' shoud return [${const Duration(days: 14)}]",
      () {
        const input = 'P0,5M';
        const output = Duration(days: 14);
        final result = DurationParser.parse(input);
        expect(result, isNotNull);
        expect(result, equals(output));
      },
    );
  });
}
