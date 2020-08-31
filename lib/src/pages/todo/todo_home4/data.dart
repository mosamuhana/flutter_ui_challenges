import 'package:intl/intl.dart';
import 'package:faker/faker.dart';

import 'models.dart';

List<Meeting> getMeetings(DateTime selectedDate) {
  final faker = new Faker();
  var a = DateFormat('MMM-dd-EEE').format(selectedDate).split('-');
  var month = a[0];
  var day = a[1];
  return [
    Meeting(
      month: month,
      day: day,
      timeFrom: '09:00 AM',
      timeTo: '09:30 AM',
      meetWith: faker.person.name(),
    ),
    Meeting(
      month: month,
      day: day,
      timeFrom: '09:30 AM',
      timeTo: '10:00 AM',
      meetWith: faker.person.name(),
    ),
    Meeting(
      month: month,
      day: day,
      timeFrom: '10:00 AM',
      timeTo: '10:30 AM',
      meetWith: faker.person.name(),
    ),
    Meeting(
      month: month,
      day: day,
      timeFrom: '09:00 AM',
      timeTo: '09:30 AM',
      meetWith: faker.person.name(),
    ),
    Meeting(
      month: month,
      day: day,
      timeFrom: '09:30 AM',
      timeTo: '10:00 AM',
      meetWith: faker.person.name(),
    ),
    Meeting(
      month: month,
      day: day,
      timeFrom: '10:00 AM',
      timeTo: '10:30 AM',
      meetWith: faker.person.name(),
    ),
  ];
}
