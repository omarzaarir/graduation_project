import 'package:flutter/material.dart';
import 'package:graduation_project/goole_map.dart';

class ShowActivity extends StatefulWidget {
  const ShowActivity({super.key});

  @override
  State<ShowActivity> createState() => _ShowActivityState();
}

class _ShowActivityState extends State<ShowActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        title: const Text("activity", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              child: FittedBox(
                child: FloatingActionButton.extended(
                  heroTag: "join",
                  onPressed: () {},
                  label: Text(
                    "انضمام",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: const Column(
                children: [
                  Text(
                    "title",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      height: 0,
                      thickness: 2,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: ListTile(
                leading: Container(
                  height: 50,
                  width: 50,
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(66, 80, 80, 80),
                  ),
                ),
                title: const Text("Fname Lname"),
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "cxocxocxozxzxzowqowqowoqewewv vcovocrwxoc woewoewoc cvococvrewo vcovcoewo vocxvcovcotrtro  ",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 15)),
              ),
            ),
            Container(
              child: Placeholder(),
            ),
            Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("location"),
                  Container(
                    height: 30,
                    child: FittedBox(
                        child: FloatingActionButton.extended(
                      heroTag: "google map",
                      backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyGoogleMap(),
                            ),);
                      },
                      label: const Text(
                        "google map",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    )),
                  ),
                ],
              ),
            )),
            Container(
              child: const Column(
                children: [
                  Text(
                    "الخليل -المدينة (مستشفى عالية الحكومي)",
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(
                      color: Colors.black26,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text("10 الانضمامات"),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("43 التفاعلات"),
                  ),
                ],
              ),
            ),
            Container(
              height: 10,
              color: Color.fromARGB(255, 36, 161, 145),
            ),
          ],
        ),
      ),
    );
  }
}
