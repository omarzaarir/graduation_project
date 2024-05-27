import 'package:flutter/material.dart';
import 'package:graduation_project/sharing%20widget/activity.dart';
import 'package:random_avatar/random_avatar.dart';

class Toprank extends StatefulWidget {
  const Toprank({super.key});

  @override
  State<Toprank> createState() => _ToprankState();
}

class _ToprankState extends State<Toprank> {
  final ScrollController _controller = ScrollController();
  GlobalKey vcointop5 = GlobalKey();
  GlobalKey activitytop5 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_sharp),
          color: Colors.white,
        ),
        title: const Text(
          "5 Top Rank",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(vcointop5.currentContext!,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: const Text("Vcoin",
                      style: TextStyle(
                          // fontSize: 30,
                          fontFamily: "Schyler",
                          color: Colors.amber)),
                ),
                TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(activitytop5.currentContext!,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: const Text("Avtivitys"),
                ),
                TextButton(
                  onPressed: () {
                    Scrollable.ensureVisible(activitytop5.currentContext!,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 500));
                  },
                  child: const Text("Avtivitys"),
                ),
              ],
            ),
            Card(
              key: vcointop5,
              color: const Color.fromARGB(255, 236, 236, 236),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      "Vcoin top 5",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Schyler",
                          color: Colors.amber),
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          margin: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 2),
                          child: ListTile(
                            leading:
                                RandomAvatar("string", height: 50, width: 50),
                            title: const Text("omar zaarir"),
                            subtitle: const Text("Hebron"),
                            trailing: const Text("400"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Card(
              key: activitytop5,
              color: const Color.fromARGB(255, 236, 236, 236),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const Text("Activitys top 5",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Schyler",
                            color: Colors.white)),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return activity(
                          isactivity: true,
                          index: 2,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Offset _getposition(GlobalKey key){
  //   RenderObject? object=key.currentContext!.findRenderObject();
  //   object.
  //   key.currentContext!.findRenderObject()!.;
  //  return renderBox.localToGlobal(Offset.zero);

  // }
}
