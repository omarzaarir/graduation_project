import 'package:flutter/material.dart';
// import 'package:graduation_project/sharing%20widget/activity.dart';

class EventClass {
  String title;
  String body;
  DateTime dateTime;
  String location;
  List<String> skills;
  List<String> hashtags;
  int numberofvolunteersRequird;
  List<int> intrests, usersjoins;
  final String id;
  final int createrid;

  EventClass(
    this.title,
    this.body,
    this.dateTime,
    this.location,
    this.intrests,
    this.skills,
    this.usersjoins,
    this.hashtags,
    this.numberofvolunteersRequird,
    this.id,
    this.createrid,
  );

  factory EventClass.fromjsom(dynamic json) {
    return EventClass(
        json['title'],
        json['description'],
        json['start_datetime'],
        json['location'],
        json['interests'],
        [],
        json['current_volunteers'],
        [],
        json['required_voulnteers'],
        json['event_id'],
        json['creator_id']);
  }
}

class ActivityClass extends EventClass {
  Image image;
  int communityID;
  final String activityId;

  ActivityClass(
    super.title,
    super.body,
    super.dateTime,
    super.location,
    super.intrests,
    super.skills,
    super.usersjoins,
    super.hashtags,
    super.numberofvolunteersRequird,
    super.id,
    super.createrid,
    this.image,
    this.communityID,
    this.activityId,
  );
}

class PostClass extends EventClass {
  final int postId;

  PostClass(
    super.title,
    super.body,
    super.dateTime,
    super.location,
    super.intrests,
    super.skills,
    super.usersjoins,
    super.hashtags,
    super.numberofvolunteersRequird,
    super.id,
    super.createrid,
    this.postId,
  );
}

List<EventClass> activityscc(List<dynamic> body) {
  List<EventClass> e = [];
  print("object");
  for (var element in body) {
    e.add(EventClass.fromjsom(element));
  }
  return e;
}
