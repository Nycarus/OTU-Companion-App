import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import '../model/event_model.dart';
import '../model/event.dart';

class EventStats extends StatefulWidget {
  final String title;
  final String userID;

  EventStats({Key key, this.title, this.userID}) : super(key: key);

  @override
  _EventStatsState createState() => _EventStatsState();
}

class _EventStatsState extends State<EventStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildEventStats(),
    );
  }

  Widget _buildEventStats() {
    EventModel _eventModel = EventModel();
    return FutureBuilder<QuerySnapshot>(
        future: widget.userID != null
            ? _eventModel.getUserEvents(widget.userID)
            : _eventModel.getAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: charts.BarChart(
                convertData(
                  snapshot.data.docs
                      .map((document) => Event.fromMap(document.data(),
                          reference: document.reference))
                      .toList()
                      .cast<Event>(),
                ),
                barGroupingType: charts.BarGroupingType.grouped,
                vertical: false,
                behaviors: [
                  new charts.ChartTitle("Event Names",
                      behaviorPosition: charts.BehaviorPosition.start),
                  new charts.ChartTitle("Number of participants",
                      behaviorPosition: charts.BehaviorPosition.bottom)
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  static List<charts.Series<Event, String>> convertData(List<Event> events) {
    if (events != null) {
      return [
        new charts.Series<Event, String>(
          id: "Event # of Participants",
          domainFn: (Event event, _) => event.name,
          measureFn: (Event event, _) => event.participants.length,
          data: events,
        )
      ];
    } else {
      return [];
    }
  }
}