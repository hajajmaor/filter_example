import 'package:filter_example/components/dialog_on_add.dart';
import 'package:filter_example/models/event_data.dart';
import 'package:flutter/material.dart';

class EventDataView extends StatelessWidget {
  final EventData event;
  const EventDataView({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.all(20),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 28),
      title: Text(event.title),
      subtitle: Text(event.location),
      trailing: IconButton.filledTonal(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return DialogOnAdd(event: event);
              });
        },
        icon: const Icon(Icons.add),
      ),
      children: [
        Text(event.date.toString()),
        const SizedBox(height: 8),
        Text(event.description),
      ],
    );
  }
}
