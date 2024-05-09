import 'package:flutter/material.dart';

class MyMessaging extends StatefulWidget {
  const MyMessaging({super.key});

  @override
  State<MyMessaging> createState() => _MyMessagingState();
}

class _MyMessagingState extends State<MyMessaging> {
  Color co = Colors.white;
  Color xo = const Color.fromARGB(255, 168, 168, 168);
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
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
            padding: EdgeInsets.only(top: 50),
            controller: _scrollController,
            itemCount: messageList.length + 1,
            itemBuilder: (context, index) {
              if (index < messageList.length) {
                return ListTile(
                  leading: SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(),
                  ),
                  title: Text(messageList[index]),
                  subtitle: Text("..."),
                );
              } else {
                return Container(
                    height: 1,
                    child: CircularProgressIndicator(
                      color: const Color.fromARGB(255, 36, 161, 145),
                    ));
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 168, 168, 168),
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
                    icon: const Text("communitys"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 168, 168, 168),
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
                    icon: const Text("events"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_getmore);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  Future _getmore() async {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isloading) {
      isloading = true;
      // final timer = Duration(seconds: 5);
      await Future.delayed(Duration(seconds: 5));
      // timer;

      messageList.addAll([
        "omar basem1010",
        "zaarir ahmad10101",
        "Skyward Symphony10101",
        "Whispered Wilds10101",
        "Clockwork Cavern0101",
        "Pixelated Pantheon10101",
        "Neon Nebula10101",
        "Ember Isles10101",
        "Dragonkin Dynasty10101",
        "Starfall Spire10101",
        "Starfall Spire1",
        "Dragonkin Dynasty2"
      ]);

      mounted ? setState(() {}) : ();
      isloading = false;
    }
  }

  bool isloading = false;
  ScrollController _scrollController = ScrollController();
  List<String> messageList = [
    "omar basem1010",
    "zaarir ahmad10101",
    "Skyward Symphony10101",
    "Whispered Wilds10101",
    "Clockwork Cavern0101",
    "Pixelated Pantheon10101",
    "Neon Nebula10101",
    "Ember Isles10101",
    "Dragonkin Dynasty10101",
    "Starfall Spire10101",
    "Starfall Spire1",
    "Dragonkin Dynasty2"
  ];
}
