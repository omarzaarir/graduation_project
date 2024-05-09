import 'package:flutter/material.dart';

class EditingProfile extends StatefulWidget {
  const EditingProfile({super.key});

  @override
  State<EditingProfile> createState() => _EditingProfileState();
}

class _EditingProfileState extends State<EditingProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Container(
          height: 3,
          width: 100,
          color: const Color.fromARGB(255, 36, 161, 145),
        ),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Placeholder(),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 36, 161, 145),
                        ),
                        child: const Wrap(
                          children: [
                            Text(
                              "upload new profile picture",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type',
                        labelText: 'Search',
                        hoverColor: Colors.black,
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type',
                        labelText: 'Search',
                        hoverColor: Colors.black,
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    const TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Type',
                        labelText: 'Search',
                        hoverColor: Colors.black,
                        hintStyle: TextStyle(color: Colors.black),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("VCOIN be: ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromRGBO(255, 160, 0, 1))),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (v) {}),
                            const Text("private",
                                style: TextStyle(height: 2.3)),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      "-When set your Vcoin as private no one can see it-",
                      style: TextStyle(fontSize: 12, color: Colors.black38),
                      textAlign: TextAlign.left,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              padding: const EdgeInsets.only(
                                  bottom: 3, top: 3, left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black12,
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Text("cancel",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20)),
                            ),
                          ),
                          InkWell(
                            child: Container(
                              padding:const EdgeInsets.only(
                                  bottom: 3, top: 3, left: 5, right: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black12,
                                border: Border.all(color: Colors.black),
                              ),
                              child: const Text("save",
                                  style: TextStyle(
                                      color:  Colors.black, fontSize: 20)),
                            ),
                          ),
                        ],
                      ),
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
}
