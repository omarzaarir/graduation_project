import 'package:flutter/material.dart';

class MyChatClass {
  int id;
  String title;
  late DateTime createDate;
  List<MembersClass> members;
  late List<MessagesClass> messages;

  MyChatClass(this.id, this.title, this.createDate, this.members);
}

class MembersClass {
  late Image image;
  String fullName;
  int id;

  MembersClass(this.fullName, this.id);

}

class MessagesClass {
  int id;
  String body;
  DateTime createDate;

  MessagesClass(this.id, this.body, this.createDate);
}
