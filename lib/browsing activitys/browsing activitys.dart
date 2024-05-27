import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/API/fetchdata.dart';
import 'package:graduation_project/CalendarDays.dart';
import 'package:graduation_project/crisis_alert.dart';
// import 'package:graduation_project/calendar.dart';
import 'package:graduation_project/messaging.dart';
import 'package:graduation_project/models/localdata.dart';
import 'package:graduation_project/newactivitynav.dart';
import 'package:graduation_project/notification.dart';
import 'package:graduation_project/profile.dart';
import 'package:graduation_project/search.dart';
import 'package:graduation_project/sharing widget/ratings.dart';
import 'package:graduation_project/sharing%20widget/activity.dart';
import 'package:graduation_project/show_activity.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class BrowsingActivitys extends StatefulWidget {
  const BrowsingActivitys({super.key});

  @override
  State<BrowsingActivitys> createState() => _BrowsingActivitysState();
}

class _BrowsingActivitysState extends State<BrowsingActivitys> {
  final _scrollController = ScrollController();
  List<String> _list = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  bool hidebottombar = false;
  bool hideFAB = true;
  static Color? _selected = Colors.white;

  @override
  void initState() {
    super.initState();
    // _scrollController.addListener(() {
    //   _scrollController.position.pixels + 1500 >
    //           _scrollController.position.maxScrollExtent
    //       ? _loadMore()
    //       : ();
    // });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: PreferredSize(
        preferredSize: const Size(0, 10),
        child: InkWell(
          onTap: () {
            _scrollController.animateTo(
              0,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
            );
          },
          child: Container(
            color: const Color.fromARGB(255, 36, 161, 145),
            child: const SafeArea(
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Color.fromARGB(225, 221, 221, 221),
                    height: 1,
                  )),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "GOHELP",
                    style: TextStyle(
                        fontSize: 8, color: Color.fromARGB(225, 221, 221, 221)),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Expanded(
                      child: Divider(
                    color: Color.fromARGB(225, 221, 221, 221),
                    height: 1,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(235, 235, 235, 1),
      bottomNavigationBar: Bottombat(conroler: _scrollController),
      body: FutureBuilder(
          future: Future.delayed(
            const Duration(seconds: 1),
          ),
          builder: (context, snapshot) {
            return snapshot.connectionState == ConnectionState.done
                ? SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 36, 161, 145),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white10,
                                ),
                                child: ListTile(
                                  trailing: Container(
                                    padding: const EdgeInsets.only(left: 5),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: Colors.black12))),
                                    child: InkWell(
                                      onTap: () async {
                                        await Clipboard.setData(
                                                const ClipboardData(
                                                    text: "your text"))
                                            .then((value) => ScaffoldMessenger
                                                    .of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Copied to your clipboard !'))));
                                      },
                                      child: const Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.link,
                                            color: Colors.white,
                                          ),
                                          Text("link",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8))
                                        ],
                                      ),
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(2),
                                  subtitle: const Text("Hebron",
                                      style: TextStyle(color: Colors.white)),
                                  leading: const CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        "https://images.pexels.com/photos/20068318/pexels-photo-20068318/free-photo-of-a-man-in-a-brown-jacket-standing-in-the-middle-of-a-street.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  title: Text(
                                    "hello, ${LocalData.mydata.fname} ${LocalData.mydata.lname}",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Profile(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const Rating()
                            ],
                          ),
                        ),
                        Mylistview(conroler: _scrollController, list: _list),
                      ],
                    ),
                  )
                : skeletonhpme();
          }),
      floatingActionButton: alert(conroler: _scrollController),
    );
  }
}

class Bottombat extends StatefulWidget {
  const Bottombat({super.key, required this.conroler});

  final ScrollController conroler;
  @override
  State<Bottombat> createState() => _BottombatState();
}

class _BottombatState extends State<Bottombat> {
  bool hide = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: hide ? 1 : 35,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 36, 161, 145),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(
              Icons.create,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const NewActivityNav(),
              );
            },
          ),
          IconButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyCalendarInDays(),
                ),
              );
            },
          ),
          IconButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Search(),
                ),
              );
            },
          ),
          IconButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyMessaging(),
                ),
              );
            },
          ),
          IconButton(
            color: const Color.fromARGB(255, 255, 255, 255),
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Notifications(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.conroler.addListener(isScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    widget.conroler.removeListener(isScrolling);
  }

  Future<void> isScrolling() async {
    if (widget.conroler.position.userScrollDirection ==
            ScrollDirection.forward &&
        hide) {
      hide = false;
      setState(() {});
    }
    if (widget.conroler.position.userScrollDirection ==
            ScrollDirection.reverse &&
        !hide) {
      hide = true;
      setState(() {});
    }
  }
}

class Mylistview extends StatefulWidget {
  const Mylistview({super.key, required this.conroler, required this.list});

  final List<String> list;
  final ScrollController conroler;
  @override
  State<Mylistview> createState() => _MylistviewState();
}

class _MylistviewState extends State<Mylistview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: widget.list.length + 1,
      itemBuilder: (context, index) {
        if (index < widget.list.length) {
          return activity(
            isactivity: index.isOdd ? true : false,
            index: index,
          );
        } else {
          return Shimmer.fromColors(
              baseColor: Colors.black12,
              highlightColor: Colors.white,
              child: const Center(
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      color: Color.fromARGB(225, 221, 221, 221),
                      height: 1,
                    )),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "loading",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Expanded(
                        child: Divider(
                      color: Color.fromARGB(225, 221, 221, 221),
                      height: 1,
                    )),
                  ],
                ),
              ));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    widget.conroler.addListener(() {
      widget.conroler.position.pixels ==
              widget.conroler.position.maxScrollExtent
          ? _loading()
          : ();
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.conroler.removeListener(_loading);
  }

  Future<void> _loading() async {
    if (!isloading) {
      isloading = true;
      await Future.delayed(Duration(seconds: 1));
      widget.list.addAll([
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
      ]);
      setState(() {
        widget.list;
      });
      isloading = false;
      try {
        // _loadinglocal();
        FechData.homeLoding();
      } catch (e) {}
    }
  }

  Future<void> _loadinglocal() async {
    try {
      var client = http.Client();
      var c = Uri.http('127.0.0.1:5000');
      var response = await client.get(
        c,
      );
      print(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  bool isloading = false;
}

class alert extends StatefulWidget {
  const alert({super.key, required this.conroler});
  final ScrollController conroler;
  @override
  State<alert> createState() => _alertState();
}

class _alertState extends State<alert> {
  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.conroler.addListener(isScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    widget.conroler.removeListener(isScrolling);
  }

  Future<void> isScrolling() async {
    if (widget.conroler.position.userScrollDirection ==
            ScrollDirection.forward &&
        hide) {
      hide = false;
      setState(() {});
    }
    if (widget.conroler.position.userScrollDirection ==
            ScrollDirection.reverse &&
        !hide) {
      hide = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: hide ? 0 : 30,
      height: 30,
      child: FloatingActionButton(
        backgroundColor: Colors.white,
        // backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CrisisAlert(),
            ),
          );
        },
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: hide ? 0 : 1,
          child: const Icon(
            Icons.crisis_alert_sharp,
            color: Color.fromARGB(255, 218, 15, 0),
          ),
        ),
      ),
    );
  }
}

class skeletonhpme extends StatelessWidget {
  const skeletonhpme({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(92, 36, 161, 144),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.white10,
                  highlightColor: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white10,
                    ),
                    child: ListTile(
                      trailing: Container(
                        padding: const EdgeInsets.only(left: 5),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(color: Colors.black12))),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.link,
                              color: Colors.white,
                            ),
                            Text("link",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8))
                          ],
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(2),
                      subtitle: const Text("... ...",
                          style: TextStyle(color: Colors.white)),
                      leading: const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      ),
                      title: Container(
                        height: 5,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Shimmer.fromColors(
                      baseColor: Colors.white10,
                      highlightColor: Colors.white24,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 2),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 100,
                        width: double.infinity,
                      ),
                    ),
                    const Center(
                      child: Column(
                        children: [
                          Text("welcome , we are prepare app for you",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          Text("pls wait!",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Shimmer.fromColors(
            baseColor: Colors.white10,
            highlightColor: Colors.white,
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 5,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 5,
                    width: double.infinity,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 5,
                    width: 300,
                    color: Colors.black,
                  ),
                  const Icon(
                    Icons.image,
                    size: 200,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//  pexel api key : "ozhlunsYSuCTTNT1cpD5jwTlcqXsGz2mm4NxctJDDZfjZnoCE7LEDUo6"