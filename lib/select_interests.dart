import 'package:flutter/material.dart';

class SelectInterests extends StatelessWidget {
  const SelectInterests({super.key});
  @override
  Widget build(BuildContext context) {
    intrested = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("What are you interested in?"),
      ),
      // backgroundColor: const Color.fromARGB(255, 36, 161, 145),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(
                    100,
                    (index) =>
                        Intrestwidget(intrestbody: "$index Intrestwidcxget")),
              ),
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        Center(
          child: InkWell(
            onTap: () {},
            child: Container(
              padding:
                  const EdgeInsets.only(bottom: 3, top: 3, left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12,
                border: Border.all(color: Colors.black),
              ),
              child: const Text("save",
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
        )
      ],
    );
  }
}

class Intrestwidget extends StatefulWidget {
  const Intrestwidget({super.key, required this.intrestbody});
  final String intrestbody;
  @override
  State<Intrestwidget> createState() => _IntrestwidgetState();
}

class _IntrestwidgetState extends State<Intrestwidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.black12,
        border: Border.all(color: Colors.black),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            value = !value;
          });
          value
              ? intrested.add(widget.intrestbody)
              : intrested.remove(widget.intrestbody);
          print(intrested);
        },
        child: Row(children: [
          Checkbox(
            shape: const CircleBorder(),
            activeColor: const Color.fromARGB(255, 230, 223, 223),
            checkColor: Colors.black,
            tristate: true,
            value: value,
            onChanged: (value) {},
          ),
          Text(
            widget.intrestbody,
          ),
        ]),
      ),
    );
  }
}

List<String> intrested = [];
