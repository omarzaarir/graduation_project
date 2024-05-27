import 'package:flutter/material.dart';
import 'package:graduation_project/models/eventclass.dart';
import 'package:graduation_project/models/mychatclass.dart';
import 'package:graduation_project/models/mydataclass.dart';
import 'package:graduation_project/models/notificatinclass.dart';

class LocalData {
  static List<EventClass> events = [];
  static List<MyChatClass> mychats = [];
  static late MyDataClass mydata;
  static List<NotificationClass> notifications = [];

  LocalData() {
    fillevent();
    fillmychat();
    fillmydata();
    fillnotifications();
  }

  static void addOnNotifications(NotificationClass notification) {
    notifications.add(notification);
  }

  static void addOnEvents(EventClass event) {
    events.add(event);
  }

  static void addOnMychate(MyChatClass mychat) {
    mychats.add(mychat);
  }
}

fillevent() {
  LocalData.events.addAll([
    PostClass("title", "body", DateTime.now(), "location2", [1, 2, 3, 4, 5, 6],
        ["skills"], [1, 2, 3, 4, 5], ["hashtags"], 1, "12", 2, 1),
    PostClass("title", "body", DateTime.now(), "location5", [1, 2, 3, 4, 5, 6],
        ["skills"], [1, 2, 3, 4, 5], ["hashtags9"], 1, "12", 2, 1),
    PostClass("title", "body", DateTime.now(), "location10", [1, 2, 3, 4, 5, 6],
        ["skills"], [1, 2, 3, 4, 5], ["hashtags"], 1, "12", 2, 1),
  ]);
}

fillmychat() {
  LocalData.mychats.addAll([
    MyChatClass(1, "title", DateTime.now(), [
      MembersClass("full Name", 1),
      MembersClass("omar zaarir", 2),
      MembersClass("qusay hicham", 3),
    ])
  ]);
}

fillmydata() {
  LocalData.mydata = MyDataClass(
      "omar",
      "zaarir",
      "token",
      "hebron-alsamu`-omganim",
      const Placeholder(
        color: Colors.blueAccent,
      ),
      "email@gmail.com",
      "my bio is deferint",
      105);
}

fillnotifications() {
  LocalData.notifications.addAll([
    NotificationClass(1, "body", 0),
    NotificationClass(2, "body1", 3),
    NotificationClass(3, "body21", 2),
    NotificationClass(4, "body3", 1),
  ]);
}
