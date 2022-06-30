import 'dart:convert';
import 'package:mlpl_test/Models/TrainingEvents.dart';

class Training {
  String month;
  List<TrainingEvent> trainigEvents;

  Training({
    required this.month,
    required this.trainigEvents
  });

  factory Training.fromJson(Map<String, dynamic> json) => Training(
      month: json['Month'],
      trainigEvents: trainingEventsFromJson(json['training_events'])
  );
}

Training trainingFromJson(String str) => Training.fromJson(jsonDecode(str));
