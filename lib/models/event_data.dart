// path lib/models/event_data.dart
class EventData {
  final String title, location, description;
  final DateTime date;

  EventData({
    required this.title,
    required this.location,
    required this.description,
    required this.date,
  });

  @override
  String toString() {
    return 'EventData(title: $title, location: $location, description: $description, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventData &&
        other.title == title &&
        other.location == location &&
        other.description == description &&
        other.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        location.hashCode ^
        description.hashCode ^
        date.hashCode;
  }
}
