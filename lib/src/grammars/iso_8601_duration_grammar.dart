import 'package:petitparser/petitparser.dart';

/// {@template iso_8601_duration_grammar}
/// Grammar defition for https://en.wikipedia.org/wiki/ISO_8601#Durations.
/// {@endtemplate}
class ISO8601DurationGrammar extends GrammarDefinition<Duration> {
  @override
  Parser<Duration> start() => _duration().end();

  Parser<Duration> _duration() => (char('P') &
              ref0<dynamic>(_period).optional() &
              ref0<dynamic>(_time).optional())
          .castList<double?>()
          .map((values) {
        return Duration(
          days: values[1]?.toInt() ?? 0,
          seconds: values[2]?.toInt() ?? 0,
        );
      });

  Parser<double> _period() => (ref0<dynamic>(_year).optional() &
              ref0<dynamic>(_month).optional() &
              ref0<dynamic>(_week).optional() &
              ref0<dynamic>(_day).optional())
          .castList<double?>()
          .map((values) {
        final years = values[0] ?? 0;
        final months = values[1] ?? 0;
        final weeks = values[2] ?? 0;
        final days = values[3] ?? 0;
        return (years * 12 * 4 * 7) + (months * 4 * 7) + (weeks * 7) + days;
      });

  Parser<double> _time() => (char('T') &
              ref0<dynamic>(_hour).optional() &
              ref0<dynamic>(_minute).optional() &
              ref0<dynamic>(_second).optional())
          .castList<double?>()
          .map((values) {
        final hours = values[1] ?? 0;
        final minutes = values[2] ?? 0;
        final seconds = values[3] ?? 0;
        return (hours * 60 * 60) + (minutes * 60) + seconds;
      });

  Parser<double> _year() =>
      (ref0<dynamic>(_number) & char('Y')).castList<double>().pick(0);
  Parser<double> _month() =>
      (ref0<dynamic>(_number) & char('M')).castList<double>().pick(0);
  Parser<double> _week() =>
      (ref0<dynamic>(_number) & char('W')).castList<double>().pick(0);
  Parser<double> _day() =>
      (ref0<dynamic>(_number) & char('D')).castList<double>().pick(0);
  Parser<double> _hour() =>
      (ref0<dynamic>(_number) & char('H')).castList<double>().pick(0);
  Parser<double> _minute() =>
      (ref0<dynamic>(_number) & char('M')).castList<double>().pick(0);
  Parser<double> _second() =>
      (ref0<dynamic>(_number) & char('S')).castList<double>().pick(0);

  Parser<double> _number() =>
      (digit().plus() & (char('.') | char(',')).optional() & (digit().star()))
          .flatten()
          .trim()
          .map((value) => double.parse(value.replaceAll(',', '.')));
}
