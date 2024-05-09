import 'package:flutter/material.dart';
import 'package:graduation_project/browsing%20activitys/browsing%20activitys.dart';
import 'package:graduation_project/createvent.dart';
import 'package:graduation_project/creatpost.dart';

class NewActivityNav extends StatefulWidget {
  const NewActivityNav({super.key});

  @override
  State<NewActivityNav> createState() => _NewActivityNavState();
}

class _NewActivityNavState extends State<NewActivityNav> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
        child: Text(
          "select one to create",
          style: TextStyle(
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      actions: [
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  width: 200,
                  child: FloatingActionButton.extended(
                    heroTag: "post",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreatNewPost(),
                        ),
                      );
                    },
                    label: const Text(
                      "post",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,width: 200,
                  child: FloatingActionButton.extended(
                    heroTag: "event",
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateNewEvent(),
                        ),
                      );
                    },
                    label: const Text(
                      "event",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
