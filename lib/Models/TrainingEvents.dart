import 'dart:convert';
import 'package:mlpl_test/Models/Events.dart';

class TrainingEvent {
  String date;
  String day;
  List<Events> events;

  TrainingEvent({
    required this.events,
    required this.date,
    required this.day,
  });

  factory TrainingEvent.fromJson(Map<String, dynamic> json) => TrainingEvent(
      date: json['Date'],
      day: json['Day'],
      events: eventsFromJson(json['Events'])

  );
}


List<TrainingEvent> trainingEventsFromJson(List<dynamic> tevents) => List<TrainingEvent>.from(tevents.map((e) => TrainingEvent.fromJson(Map<String, dynamic>.from(e))));
