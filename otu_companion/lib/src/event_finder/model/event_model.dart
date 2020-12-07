import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'event.dart';

// Model that represents the CRUD functions, used lecture 07a_Cloud_Storage for assistance
class EventModel {
  // Future function of that returns a QuerySnapshot to get all events from the database
  Future<QuerySnapshot> getAll() async {
    return await FirebaseFirestore.instance.collection('events').get();
  }

  // Future function for getting all events the user is in (temporarily gets the ones they created)
  Future<QuerySnapshot> getUserEvents(String uid) async {
    return await FirebaseFirestore.instance
        .collection('events')
        .where('createdBy', isEqualTo: uid)
        .get();
  }

  // Future function to insert an event to the database
  Future<void> insert(Event event) async {
    CollectionReference events =
        FirebaseFirestore.instance.collection('events');
    events.add(event.toMap());
  }

  // Future function to update an event to the database
  Future<void> update(Event event) async {
    event.reference.update({
      'name': event.name,
      'description': event.description,
      'startDateTime': event.startDateTime,
      'endDateTime': event.endDateTime,
      'location': event.location,
    });
  }

  // Future function to delete an event from the database
  Future<void> delete(Event event) async {
    print('deleting event $event...');
    event.reference.delete();
  }
}
