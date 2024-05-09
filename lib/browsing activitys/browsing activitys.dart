import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:graduation_project/CalendarDays.dart';
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

  Widget Build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 100),
        opacity: hideFAB ? 1 : 0,
        child: Container(
          height: 170,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 165, 223, 180),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(7),
              bottomRight: Radius.circular(7),
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              ListTile(
                leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(66, 80, 80, 80),
                    child: RandomAvatar('saytoonz'),
                  ),
                ),
                title: Text(
                    "hello, ${LocalData.mydata.fname} ${LocalData.mydata.lname}"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Profile(),
                    ),
                  );
                },
              ),
              const Rating()
            ],
          ),
        ),
      ),
      appBar: hideFAB
          ? PreferredSize(
              preferredSize: const Size(0, 0),
              child: Container(
                color: const Color.fromARGB(255, 165, 223, 180),
              ))
          : PreferredSize(
              preferredSize: const Size(0, 0),
              child: Container(
                color: const Color.fromARGB(255, 36, 161, 145),
              ),
            ),
      body: NotificationListener<ScrollUpdateNotification>(
        onNotification: (notification) {
          // (_scrollController.position.pixels ==
          //         _scrollController.position.maxScrollExtent
          //     ? _loadMore()
          //     : ());
          // (notification.scrollDelta! <= 10 && notification.scrollDelta! >= -10)
          //     ? ()
          //     : isScrolling();
          return true;
        },
        child: ListView.builder(
            padding: const EdgeInsets.only(top: 180),
            physics: const BouncingScrollPhysics(),
            controller: _scrollController,
            itemCount: _list.length + 1,
            itemBuilder: (BuildContext context, int index) {
              // if (index < _list.length) {
              return
                  //         Container(
                  //   // height: 50,
                  //   margin: const EdgeInsets.all(5),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: const Color.fromARGB(255, 255, 255, 255),
                  //   ),
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //           builder: (context) => const ShowActivity(),
                  //         ),
                  //       );
                  //     },
                  //     child: activity(
                  //       isactivity: false,
                  //       index: index,
                  //     ),
                  //   ),
                  // );
                  //         // return _list[index];
                  //       } else {}
                  //       return const SizedBox(
                  //           height: 1,
                  //           child: CircularProgressIndicator(
                  //             color: Color.fromARGB(255, 36, 161, 145),
                  //           ),);
                  //     },

                  activity(
                isactivity: false,
                index: index,
              );
            }),
      ),
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: hidebottombar ? 1 : 35,
        // padding: EdgeInsets.all(4),
        margin: const EdgeInsets.only(bottom: 10, right: 20, left: 20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 36, 161, 145),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 104, 104, 104),
              offset: Offset(0, 20),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: !hidebottombar,
              child: IconButton(
                color: const Color.fromARGB(255, 255, 255, 255),
                icon: Icon(
                  Icons.create,
                  color: _selected,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const NewActivityNav(),
                  ).whenComplete(() {
                    setState(
                      () {
                        _selected = Colors.white;
                      },
                    );
                  });
                  setState(
                    () {
                      _selected = const Color.fromARGB(255, 172, 87, 87);
                    },
                  );
                },
              ),
            ),
            Visibility(
              visible: !hidebottombar,
              child: IconButton(
                color: const Color.fromARGB(255, 255, 255, 255),
                icon: const Icon(Icons.calendar_month),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // builder: (context) => const MyCalendar(),
                      builder: (context) => const MyCalendarInDays(),
                    ),
                  );
                },
              ),
            ),
            Visibility(
              visible: hidebottombar ? false : true,
              child: IconButton(
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
            ),
            Visibility(
              visible: hidebottombar ? false : true,
              child: IconButton(
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
            ),
            Visibility(
              visible: hidebottombar ? false : true,
              child: IconButton(
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
            ),
          ],
        ),
      ),
    );
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
      backgroundColor:const Color.fromRGBO(235, 235, 235, 1),
      
      bottomNavigationBar: Bottombat(conroler: _scrollController),
      body: SingleChildScrollView(
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
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: const BoxDecoration(
                            border: Border(
                                left: BorderSide(color: Colors.black12))),
                        child: InkWell(
                          onTap: () async {
                            await Clipboard.setData(
                                    const ClipboardData(text: "your text"))
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            'Copied to your clipboard !'))));
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.link,
                                color: Colors.white,
                              ),
                              Text("link",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 8))
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
                            "https://scontent-fra5-1.xx.fbcdn.net/v/t39.30808-6/349553905_896773864751244_5555397614319218621_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=_y3gM1BidhcQ7kNvgG6GRAH&_nc_ht=scontent-fra5-1.xx&oh=00_AfAXTZhjLwR9oAAcT2rWGeu6_5PE5foaqkvO2_3YJerY1A&oe=663D8839"),
                        backgroundColor: Colors.transparent,
                      ),
                      title: Text(
                          "hello, ${LocalData.mydata.fname} ${LocalData.mydata.lname}",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
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
      ),
    );
  }

  bool isloading = false;
}

class Bottombat extends StatefulWidget {
  const Bottombat({super.key, required this.conroler});

  final ScrollController conroler;
  @override
  State<Bottombat> createState() => _BottombatState();
}

class _BottombatState extends State<Bottombat> {
  bool hide = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: hide ? 1 : 35,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 36, 161, 145),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20),),
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
    // TODO: implement initState
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
      await Future.delayed(Duration(seconds: 5));
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
    }
  }

  bool isloading = false;
}

//  pexel api key : "ozhlunsYSuCTTNT1cpD5jwTlcqXsGz2mm4NxctJDDZfjZnoCE7LEDUo6"