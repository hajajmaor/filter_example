import 'package:faker/faker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/event_data.dart';

final FutureProvider<List<EventData>> eventDataProvider = FutureProvider(
  (ref) async {
    await Future.delayed(const Duration(seconds: 2));
    // return list of [EventData] with 40 items with dummy data
    // dont use generate with an index
    final faker = Faker(seed: 42);
    final List<EventData> eventList = List.generate(
      40,
      (_) => _createOneRecord(faker),
    );
    return eventList;
  },
);

EventData _createOneRecord(Faker faker) {
  String title = faker.lorem.sentence();
  String location = faker.address.city();
  String description = faker.lorem.sentences(3).join(".");

  // You can use a fixed date or generate random dates using faker if needed
  final date = faker.date.dateTime(minYear: 2022, maxYear: 2024);

  return EventData(
    title: title,
    location: location,
    description: description,
    date: date,
  );
}
