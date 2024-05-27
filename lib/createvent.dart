import 'dart:io';

import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:image_picker/image_picker.dart';

class CreateNewEvent extends StatefulWidget {
  const CreateNewEvent({super.key});

  @override
  State<CreateNewEvent> createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  File? pickimage;

  void selectimage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      var selected = File(image.path);
      setState(() {
        pickimage = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.green[100],
              child: RandomAvatar(
                "string",
                width: 30,
                height: 30,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              "create event",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: FittedBox(
                child: FloatingActionButton.extended(
                  heroTag: "share",
                  onPressed: () {},
                  label: const Text(
                    "share",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 5),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Card(
                      child: TextField(
                        maxLines: 1,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "title",
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        ),
                      ),
                    ),
                  ),
                  DropdownButton(
                      underline: Container(),
                      value: 1,
                      items: [
                        const DropdownMenuItem<int>(
                          value: 1,
                          child: Icon(Icons.public),
                        ),
                        const DropdownMenuItem(
                          value: 2,
                          child: Icon(
                            Icons.group,
                          ),
                        ),
                      ].toList(),
                      onChanged: (vc) {}),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Card(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "location description",
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                child: TextField(
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "event description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  selectimage();
                },
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: pickimage == null
                      ? const Card(
                          child: Column(
                            children: [
                              Icon(
                                Icons.image,
                                size: 150,
                                color: Color.fromARGB(150, 172, 87, 87),
                              ),
                              Text(
                                "select image",
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black54),
                          ),
                          child: Image.file(
                            fit: BoxFit.cover,
                            pickimage!,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Card(
                    color: const Color.fromARGB(255, 172, 87, 87),
                    child: InkWell(
                      onTap: () {},
                      child: const SizedBox(
                        height: 30,
                        child: Icon(
                          Icons.location_on_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "select locathion from google map",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Card(
                color: const Color.fromARGB(255, 172, 87, 87),
                child: InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    height: 30,
                    child: Center(
                      child: Text(
                        "determine skills",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              ListView(
                padding: const EdgeInsets.all(5),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: const [
                  Text("data1"),
                  Text("data2"),
                  Text("data3"),
                  Text("data1"),
                  Text("data2"),
                  Text("data3"),
                  Text("data1"),
                  Text("data2"),
                  Text("data3"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
