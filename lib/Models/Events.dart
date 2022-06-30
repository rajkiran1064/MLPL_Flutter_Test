
import 'dart:convert';


class Events {
  String ? status;
  int ? id;
  Events({
    this.status,
    this.id
  });
  factory Events.fromJson(Map<String, dynamic> json) => Events(
    status: json['status'],
    id: json['id'],
  );
}
List<Events> eventsFromJson(List<dynamic> events) => List<Events>.from(events.map((e) => Events.fromJson(e)));
