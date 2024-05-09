import 'package:flutter/material.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({super.key});

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  String? _dropdownValue = "months";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Calendar",style: TextStyle(fontFamily: "Schyler")),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("January-1",style: TextStyle(fontFamily: "Schyler")),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text("February-2"),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text("March-3"),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text("April-4"),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text("data"),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Text("May-5"),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      vertical: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.all(5),
                        color: Colors.amber,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 119, 167, 155),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back_sharp),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_sharp),
                ),
              ],
            ),
            const Text("2024"),
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                const Text("show in: "),
                DropdownButton(
                    value: _dropdownValue,
                    items: const [
                      DropdownMenuItem(
                        value: "months",
                        child: Text("monthes"),
                      ),
                      DropdownMenuItem(
                        value: "days",
                        child: Text("days"),
                      ),
                      DropdownMenuItem(
                        value: "years",
                        child: Text("years"),
                      ),
                    ],
                    onChanged: (V) {
                      setState(() {
                        _dropdownValue = V;
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
