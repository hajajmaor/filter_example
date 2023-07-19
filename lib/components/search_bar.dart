import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/search_term_provider.dart';

PreferredSizeWidget searchBar(WidgetRef ref) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(48),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: const InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          ref.read(searchTermProvider.notifier).state = value;
        },
      ),
    ),
  );
}
