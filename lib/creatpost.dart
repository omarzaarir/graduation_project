import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class CreatNewPost extends StatefulWidget {
  const CreatNewPost({super.key});

  @override
  State<CreatNewPost> createState() => _CreatNewPostState();
}

class _CreatNewPostState extends State<CreatNewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp,color: Colors.white,),
        ),
        title: const Text("create post", style: TextStyle(color: Colors.white),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              child: FittedBox(
                child: FloatingActionButton.extended(
                  heroTag: "share",
                  onPressed: () {},
                  label: const Text(
                    "مشاركة",
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
          margin: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          child: CircleAvatar(child: RandomAvatar('saytoonz'),),
                        ),
                      ),
                      const Text(
                        "Fname Lname",
                      )
                    ],
                  ),
                  DropdownButton(
                      value: 1,
                      items: [
                        const DropdownMenuItem<int>(
                          child: Text("public"),
                          value: 1,
                        ),
                        const DropdownMenuItem(
                          child: Text("private"),
                          value: 2,
                        ),
                      ].toList(),
                      onChanged: (vc) {})
                ],
              ),
              const TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'post title',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                minLines: 3,
                maxLines: 10,
                decoration: InputDecoration(
                    labelText: "(body)/n ...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: '#HASHTAGS',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
