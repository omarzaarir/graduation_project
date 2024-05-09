import 'package:flutter/material.dart';

class PostDialoge extends StatefulWidget {
  const PostDialoge({super.key});

  @override
  State<PostDialoge> createState() => _PostDialogeState();
}

class _PostDialogeState extends State<PostDialoge> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(
          child: Text(
        "بحاجة وحدات دم مستعجلة",
        style: TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      )),
      content: Container(
        height: 100,
        child: Column(
          children: [
           const Divider(color: Colors.black),
            Container(height: 40,
              child: FittedBox(
                  child: FloatingActionButton.extended(icon:const Icon(Icons.report),backgroundColor:const Color.fromARGB(255, 172, 87, 87),
                onPressed: () {},
                label:const Text("reporting the post",style: TextStyle(color: Colors.white)),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
