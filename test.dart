import 'package:intl/intl.dart';

void main() {
  //var s = '2020-10-01';
  var s = '2020-12-31';
  var d = DateTime.tryParse(s);
  print(s);
  print(d);
  if (d == null) return;
  //print(DateFormat.MMM().format(d));
  print('weekday: ${d.weekday}');

  var fmt_dd = DateFormat('dd');
  print(fmt_dd.format(d));

  var fmt_MMM = DateFormat('MMM');
  print(fmt_MMM.format(d));

  var fmt_M = DateFormat('M');
  print(fmt_M.format(d));

  var fmt_D = DateFormat('D');
  print(fmt_D.format(d));

  print('EEEE: ' + DateFormat('EEEE').format(d));
  print(weekNumber(d));

  var moonLanding = DateTime.parse("2020-08-20 20:18:04Z");
  print('moonLanding.weekday = ${moonLanding.weekday}');
  assert(moonLanding.weekday == 7);
  assert(moonLanding.weekday == DateTime.sunday);
}

int weekNumber(DateTime date) {
  int dayOfYear = int.parse(DateFormat("D").format(date));
  return ((dayOfYear - date.weekday + 10) / 7).floor();
}

///     Symbol   Meaning                Presentation       Example
///     ------   -------                ------------       -------
///     G        era designator         (Text)             AD
///     y        year                   (Number)           1996
///     M        month in year          (Text & Number)    July & 07
///     L        standalone month       (Text & Number)    July & 07
///     d        day in month           (Number)           10
///     c        standalone day         (Number)           10
///     h        hour in am/pm (1~12)   (Number)           12
///     H        hour in day (0~23)     (Number)           0
///     m        minute in hour         (Number)           30
///     s        second in minute       (Number)           55
///     S        fractional second      (Number)           978
///     E        day of week            (Text)             Tuesday
///     D        day in year            (Number)           189
///     a        am/pm marker           (Text)             PM
///     k        hour in day (1~24)     (Number)           24
///     K        hour in am/pm (0~11)   (Number)           0
///     z        time zone              (Text)             Pacific Standard Time
///     Z        time zone (RFC 822)    (Number)           -0800
///     v        time zone (generic)    (Text)             Pacific Time
///     Q        quarter                (Text)             Q3
///     '        escape for text        (Delimiter)        'Date='
///     ''       single quote           (Literal)          'o''clock'
