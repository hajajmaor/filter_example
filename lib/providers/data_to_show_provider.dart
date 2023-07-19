import 'package:filter_example/models/event_data.dart';
import 'package:filter_example/providers/search_term_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data_provider.dart';

final Provider<List<EventData>> dataToShowProvider = Provider((ref) {
  final List<EventData> allEvents = ref.watch(eventDataProvider).value ?? [];
  final String searchTerm = ref.watch(searchTermProvider);

  if (searchTerm.isEmpty) {
    return allEvents;
  }

  return allEvents.where((event) {
    return event.title.toLowerCase().contains(searchTerm.toLowerCase()) ||
        event.location.toLowerCase().contains(searchTerm.toLowerCase()) ||
        event.description.toLowerCase().contains(searchTerm.toLowerCase());
  }).toList();
});
