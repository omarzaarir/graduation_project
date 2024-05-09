import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 36, 161, 145),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: const Text("Notifications",style: TextStyle(color: Colors.white,)),
      ),
      body: ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        // shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("object");
            },
            child: ListTile(
              leading: SizedBox(
                height: 60,
                width: 60,
                child: CircleAvatar(),
              ),
              title:
                  Text("Notification# ${(index == null) ? "null" : "$index"}"),
              subtitle: Text("..."),
            ),
          );
        },
      ),
    );
  }
}
