import 'package:filter_example/components/event_data_view.dart';
import 'package:filter_example/providers/data_to_show_provider.dart';
import 'package:filter_example/providers/search_term_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'components/search_bar.dart';
import 'models/event_data.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<EventData> events = ref.watch(dataToShowProvider);
    final seatchTerm = ref.watch(searchTermProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Example'),
        bottom: searchBar(ref),
      ),
      body: events.isEmpty
          ? seatchTerm.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const Center(
                  child: Text('No events found'),
                )
          : ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final EventData event = events[index];
                return EventDataView(
                  event: event,
                  key: ValueKey(event),
                );
              },
            ),
    );
  }
}
