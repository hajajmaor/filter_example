// path: lib/components/dialog_on_add.dart
import 'package:flutter/material.dart';

import '../models/event_data.dart';

class DialogOnAdd extends StatelessWidget {
  const DialogOnAdd({
    super.key,
    required this.event,
  });

  final EventData event;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(event.title),
      content: Text(
          "The event `${event.title}`,\nAdded to your calendar (not really))"),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Close')),
      ],
    );
  }
}
