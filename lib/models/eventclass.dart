import 'package:flutter/material.dart';

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

