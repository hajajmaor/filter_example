import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<String> searchTermProvider =
    StateProvider<String>((ref) => '');
