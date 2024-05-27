import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class Chatscreen extends StatefulWidget {
  const Chatscreen({super.key});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          // leading: RandomAvatar("string", height: 30, width: 30),
          title: Text("omar zaarir"),
          subtitle: Text("11:23pm"),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              reverse: true,
              itemCount: 100,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: index.isEven
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(index.isOdd ? 0 : 10),
                        bottomRight: Radius.circular(index.isEven ? 0 : 10),
                        topLeft: const Radius.circular(10),
                        topRight: const Radius.circular(10),
                      ),
                    ),
                    color: index.isEven
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.background,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: (MediaQuery.sizeOf(context).width / 2) + 60,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            index.isOdd
                                ? const Text(
                                    "member",
                                    style: TextStyle(
                                        color: Colors.black38, fontSize: 10),
                                  )
                                : const SizedBox(),
                            const Text(
                              "message0000000 00000 0000000 0000000 00000000000",
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "16:40pm",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                index.isEven
                                    ? const Icon(
                                        Icons.check_circle_sharp,
                                        size: 15,
                                      )
                                    : const SizedBox()
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: TextField(
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.emoji_emotions)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.image)),
                          ],
                        ),
                        border: InputBorder.none,
                        hintText: "message",
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                    ),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.send))
              ],
            )
          ],
        ),
      ),
    );
  }
}
