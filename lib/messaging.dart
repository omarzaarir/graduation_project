import 'package:flutter/material.dart';
import 'package:graduation_project/chatscreen.dart';
import 'package:random_avatar/random_avatar.dart';

class MyMessaging extends StatefulWidget {
  const MyMessaging({super.key});

  @override
  State<MyMessaging> createState() => _MyMessagingState();
}

class _MyMessagingState extends State<MyMessaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 161, 145),
        title: const Text("messaging", style: TextStyle(color: Colors.white)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              child: FloatingActionButton.extended(
                heroTag: "new conversation",
                onPressed: () {},
                label: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: const Color.fromARGB(255, 172, 87, 87),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: const EdgeInsets.only(top: 50),
            controller: _scrollController,
            itemCount: messageList.length + 1,
            itemBuilder: (context, index) {
              if (index < messageList.length) {
                return ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Chatscreen(),
                    ),
                  ),
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: RandomAvatar(messageList[index]),
                  ),
                  title: Text(messageList[index]),
                  subtitle: const Text("helo"),
                );
              } else {
                return const SizedBox(
                    height: 1,
                    child: CircularProgressIndicator(
                      color: Color.fromARGB(255, 36, 161, 145),
                    ));
              }
            },
          ),
          const ConverType(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_getmore);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future _getmore() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isloading) {
      isloading = true;
      await Future.delayed(const Duration(seconds: 1));
      messageList.addAll([
        "omar basem",
        "saly B",
        "Skyward V",
        "Whispered ",
        "Clockwork Cavern",
        "Pixelated Pantheon",
        "Neon Nebula",
        "Ember Isles",
        "Dragonkin Dynasty",
        "Starfall Spire",
        "Starfall B",
        "Dragonkin D"
      ]);

      mounted ? setState(() {}) : ();
      isloading = false;
    }
  }

  bool isloading = false;
  final ScrollController _scrollController = ScrollController();
  List<String> messageList = [
    "omar basem1010",
    "zaarir G",
    "Symphony M",
    "Wilds C",
    "Cavern I",
    "Pantheon O",
    "Nebula Z",
    "Isles Q",
    "Dynasty H",
    "Spire P",
    "Spire W",
    "Dynasty C B"
  ];
}

class ConverType extends StatefulWidget {
  const ConverType({super.key});

  @override
  State<ConverType> createState() => _ConverTypeState();
}

class _ConverTypeState extends State<ConverType> {
  Color co = Colors.white;
  Color xo = const Color.fromARGB(255, 168, 168, 168);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.black)),
      ),
      padding: const EdgeInsets.all(5),
      // margin:const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  shape:const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  backgroundColor: Colors.lightBlue[100],
                  duration: const Duration(seconds: 10),
                  content: const Text(
                    "this is for quicke chats, is not substitute popular chat applications, and this will be stored on your phone only!",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            },
            icon: Icon(
              Icons.lightbulb_circle_outlined,
              color: Colors.red[900],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 168, 168, 168),
              ),
              color: co,
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  co = const Color.fromARGB(255, 168, 168, 168);
                  xo = Colors.white;
                });
              },
              child: const Text("communitys"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 168, 168, 168),
              ),
              color: xo,
              borderRadius: BorderRadius.circular(50),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  co = Colors.white;
                  xo = const Color.fromARGB(255, 168, 168, 168);
                });
              },
              child: const Text("events"),
            ),
          ),
        ],
      ),
    );
  }
}
