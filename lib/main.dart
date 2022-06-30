import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mlpl_test/Models/TrainingEvents.dart';
import 'package:mlpl_test/Models/Training.dart';
import 'package:mlpl_test/Models/Events.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {

  final Map<String, dynamic> data =  {
    "Month":"March 2022",
    "training_events":[
      {
        "Date":"2022-03-08",
        "Day":"Tue",
        "Events":[
          {
            "id":142,
            "status":"High",
            "TE":{
              "tm_name":"CS"
            }
          }, {
            "id":143,
            "status":"Low",
            "TE":{
              "tm_name":"CS2"
            }
          }
        ]
      },
      {
        "Date":"2022-03-17",
        "Day":"Thu",
        "Events":[
          {
            "id":151,
            "status":null,
            "TE":{
              "tm_name":"MT"
            }
          }, {
            "id":152,
            "status":"Mid",
            "TE":{
              "tm_name":"MT2"
            }
          }
        ]
      }
    ]
  };
  late Training training;
  List<TrainingEvent> trainingEvents = [];
  List<Events> events = [];

  @override
  void initState(){
    super.initState();
    training = trainingFromJson(jsonEncode(data));
    trainingEvents = training.trainigEvents;
    events = trainingEvents[0].events;
    if (trainingEvents.isNotEmpty) {
      trainingEvents.forEach((trainingEvent) {
        getEvents(trainingEvent.date);
      });
    }
  }

  void getEvents(String date) {
    events = trainingEvents.singleWhere((element) => element.date == date).events;
    if (events.isNotEmpty) {
      for (var index = 0 ; index < events.length ; index++) {
        Events event = events[index];
        if (event.status != null) {
          String color = getColorOfStatus(event.status!);
          if (kDebugMode) {
            print("Event $index of $date status is ${event.status}, So Color is $color");
          }
        }
      }
    }
  }

  String getColorOfStatus(String status) {
    String color = '';
    switch(status) {
      case 'High': {
        color = 'Red';
        return color;
      }
      case 'Mid': {
        color = 'Yellow';
        return color;
      }
      case 'Low': {
        color = 'Blue';
        return color;
      }
    }
    return color;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test App'),
        ),
        body: Container()
    );
  }
}
