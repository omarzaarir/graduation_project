import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/editing_profile%20.dart';
import 'package:graduation_project/login.dart';
import 'package:graduation_project/models/localdata.dart';
import 'package:graduation_project/select_interests.dart';
import 'package:graduation_project/sharing%20widget/activity.dart';
import 'package:graduation_project/sharing%20widget/ratings.dart';
import 'package:random_avatar/random_avatar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(
          color: const Color.fromARGB(255, 36, 161, 145),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 70),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                            fit: BoxFit.cover,
                            "https://images.pexels.com/photos/17102047/pexels-photo-17102047/free-photo-of-couple-kissing-son-on-field.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      ),
                      Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Container(
                              decoration: const BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 36, 161, 145),
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                )
                              ]),
                              child: const Rating())),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Text(
                              "Omar zaarir",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "member in GOHLP team, CS-BZU, mobile developer.",
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () async {
                            await Clipboard.setData(const ClipboardData(
                                    text:
                                        "https://www.facebook.com/Omar.Zaror.1999"))
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Copied to your clipboard !'))));
                          },
                          child: const Row(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.link,
                                color: Colors.blue,
                              ),
                              Text("my facebook profile",
                                  style: TextStyle(color: Colors.blue))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // const Rating(),
                  const Postorevent(),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: i + 1,
                    itemBuilder: (context, index) {
                      if (index < i) {
                        return activity(
                          isactivity: true,
                          index: index,
                        );
                      } else {
                        return const SizedBox(
                            height: 1, child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(87, 255, 255, 255),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_sharp),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(87, 255, 255, 255),
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Wrap(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                padding: const EdgeInsets.only(top: 10),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 3,
                                        width: 100,
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: const ColoredBox(
                                          color:
                                              Color.fromARGB(255, 36, 161, 145),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              context: context,
                                              isScrollControlled: true,
                                              useSafeArea: true,
                                              builder: (_) {
                                                return const FractionallySizedBox(
                                                  heightFactor: 0.75,
                                                  child: EditingProfile(),
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 36, 161, 145),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "edit profile",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const SelectInterests(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 36, 161, 145),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "edit skills",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: InkWell(
                                          onTap: () {
                                            if (myUser != null) {
                                              myUser?.logout().then((value) =>
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Login(),
                                                      ),
                                                      (route) => false));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.grey,
                                                      content: Text(
                                                          "logout successed,we wait you for help us more.")));
                                            } else {
                                              // return "{'message': 'you are already logout!!', 'success': false}";
                                              Navigator.pushAndRemoveUntil(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login(),
                                                  ),
                                                  (route) => false);
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                      backgroundColor:
                                                          Colors.grey,
                                                      content: Text(
                                                          "seccione end!")));
                                              print("is null");
                                            }
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 300,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 36, 161, 145),
                                            ),
                                            child: const Center(
                                              child: Text(
                                                "logout",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // ),
                        );
                      },
                      icon: const Icon(Icons.app_registration),
                      color: const Color.fromARGB(255, 172, 87, 87),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(loading);
  }

  bool isloading = false;
  final _scrollController = ScrollController();
  int i = 20;
  Future<void> loading() async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!isloading) {
        isloading = true;
        await Future.delayed(Duration(seconds: 5));
        mounted
            ? setState(() {
                i = i + 20;
              })
            : ();
        isloading = false;
      }
    }
  }
}

class Postorevent extends StatefulWidget {
  const Postorevent({super.key});

  @override
  State<Postorevent> createState() => _PostoreventState();
}

class _PostoreventState extends State<Postorevent> {
  Color co = Colors.white;
  Color xo = const Color.fromARGB(255, 168, 168, 168);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: co,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  co = const Color.fromARGB(255, 168, 168, 168);
                  xo = Colors.white;
                });
              },
              icon: const Text("Event"),
            ),
          ),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
              ),
              color: xo,
            ),
            child: IconButton(
              style: const ButtonStyle(),
              onPressed: () {
                setState(() {
                  co = Colors.white;
                  xo = const Color.fromARGB(255, 168, 168, 168);
                });
              },
              icon: const Text("Posts"),
            ),
          ),
        ),
      ],
    );
  }
}
