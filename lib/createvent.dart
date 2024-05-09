import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class CreateNewEvent extends StatefulWidget {
  const CreateNewEvent({super.key});

  @override
  State<CreateNewEvent> createState() => _CreateNewEventState();
}

class _CreateNewEventState extends State<CreateNewEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        title: const Text("build event", style: TextStyle(color: Colors.white),),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp,color: Colors.white,),
        ),
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
          margin:const EdgeInsetsDirectional.symmetric(horizontal: 20),
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
                          child:  CircleAvatar(
                            child: RandomAvatar('saytoonz11'),
                          ),
                        ),
                      ),
                    const  Text(
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
                  labelText: 'event title',
                ),
              ),
            const  SizedBox(
                height: 10,
              ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                child: FittedBox(
                  child: FloatingActionButton.extended(
                    heroTag: "select locathion from google map",
                    onPressed: () {},
                    label: const Text(
                      "select locathion from google map",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                  ),
                ),
              ),
            ),
          const  TextField(
               decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'location description',
                ),
            )
            ,const  SizedBox(
                height: 10,
              ),
              TextField(
                minLines: 3,
                maxLines: 10,
                decoration: InputDecoration(
                    labelText: "(body...)",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            const  SizedBox(
                height: 10,
              ),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 30,
                child: FittedBox(
                  child: FloatingActionButton.extended(
                    heroTag: "determine skills",
                    onPressed: () {},
                    label: const Text(
                      "determine skills",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    backgroundColor: const Color.fromARGB(255, 172, 87, 87),
                  ),
                ),
              ),
            ),
           const Text("skill#1,skill#2,...",style: TextStyle(decoration: TextDecoration.underline),),
            const  SizedBox(height: 20,),
            Container(
                height: 100,
                width: 100,
                child: Placeholder(),
              ),
            const  SizedBox(height: 5,),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 172, 87, 87),
                    ),
                    child: const Center(
                      child: Text(
                        "select image",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
