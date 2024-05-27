import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/models/localdata.dart';
import 'package:graduation_project/postDialog.dart';
import 'package:graduation_project/show_activity.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class activity extends StatelessWidget {
  activity({super.key, this.isactivity = true, this.index = 0});
  bool isactivity;
  int index = 0;
  Widget o = RandomAvatar("string", height: 50, width: 50);
  @override
  Widget build(BuildContext context) {
    return isactivity ? Eventupdated(context) : Post(context);
  }

  Widget Event(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 150,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                // clipBehavior: Clip.antiAliasWithSaveLayer,
                // borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  width: 300,
                ),
                // Image.network(
                //     "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
              ),
              // child: RandomAvatar('saytoonz'),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          RandomAvatar('saytoonz', height: 50, width: 50),
                          const SizedBox(
                            width: 1,
                          ),
                          const Text("FName LName"),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => const PostDialoge(),
                            );
                          },
                          child: const Icon(Icons.more_horiz)),
                    ],
                  ),
                ),
                const Expanded(
                  flex: 4,
                  child: Text(
                    "vnvn cvcnvcnvcnv  cnvncv nczxzxz xzxzxz zxzx xzxzx xzzxz zxzxz xzxz ",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                const Expanded(
                  flex: 2,
                  child: Center(
                      child: Column(
                    children: [
                      Text(
                        "الموقع",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        "رام االله - بيرزيت التجمع عند دوار التوتة",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  )),
                ),
                const Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "12",
                        style: TextStyle(fontSize: 10),
                      ),
                      Text(
                        "11",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget Post(BuildContext context) {
    String t = "string $index";

    return Container(
      margin: const EdgeInsets.only(top: 0, bottom: 3, right: 3, left: 3),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(8, 0, 0, 0))),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShowActivity(),
            ),
          );
        },
        child: Column(
          children: [
            ListTile(
              title: Text("${LocalData.mydata.fname} ${LocalData.mydata.lname}",
                  style: const TextStyle(fontSize: 15)),
              leading: RandomAvatar(t, height: 50, width: 50),
              subtitle: const Text("hebron"),
              trailing: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const PostDialoge(),
                  );
                },
                child: const Icon(Icons.more_horiz),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 4, right: 4, left: 4),
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black26),
                  left: BorderSide(color: Colors.black26),
                ),
              ),
              child: const Text(
                textAlign: TextAlign.center,
                "To ensure that an image fits within a Container and can be zoomed in if it exceeds the container's size, you can use a combination of InteractiveViewer and FittedBox widgets in Flutter. Here's how you can achieve this To ensure that an image fits within a Container and can be zoomed in if it exceeds the container's size, you can use a combination of InteractiveViewer and FittedBox widgets in Flutter. Here's how you can achieve this",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Eventupdated(BuildContext context) {
    String t = "string $index";
    return Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: const Color.fromARGB(55, 36, 161, 144),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ShowActivity(),
            ),
          );
        },
        child: Column(
          children: [
            ListTile(
              title: Text("${LocalData.mydata.fname} ${LocalData.mydata.lname}",
                  style: const TextStyle(fontSize: 15)),
              leading: RandomAvatar(t, height: 50, width: 50),
              subtitle: const Text("hebron"),
              trailing: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const PostDialoge(),
                  );
                },
                child: const Icon(Icons.more_horiz),
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.only(top: 0, bottom: 2, right: 3, left: 3),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  const Text(
                    "title of activity",
                    style: TextStyle(fontSize: 15),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 1,
                    endIndent: 10,
                    indent: 10,
                  ),
                  const Text(
                    textAlign: TextAlign.left,
                    "The Pexels API enables programmatic access to the full Pexels content library, including photos, videos. All content is available free of charge, and you are welcome to use Pexels content for anything you'd like, as long as it is within our",
                    style: TextStyle(fontSize: 11),
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                        // Placeholder(),
                        // Image.asset(fit: BoxFit.cover, "Images/volunteer.jpg"),
                        ActivityImage(),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        "رام االله - بيرزيت (جامعة بيرزيت)",
                        style: TextStyle(fontSize: 10),
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityImage extends StatefulWidget {
  const ActivityImage({super.key});

  @override
  State<ActivityImage> createState() => _ActivityImageState();
}

class _ActivityImageState extends State<ActivityImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isConnection(),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.data!
                ? Image.network(
                    fit: BoxFit.cover,
                    "https://images.pexels.com/photos/70573/fireman-firefighter-rubble-9-11-70573.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Stack(
                        children: [
                          Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.black12,
                              highlightColor: Colors.white,
                              child: const Icon(
                                Icons.image,
                                size: 100,
                              ),
                            ),
                          ),
                          Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          )
                        ],
                      );
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      // isConnection();
                      return const Column(
                        children: [
                          Text("problem on connection with server"),
                          Text("try in other time"),
                        ],
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("lose connection with internet!"),
                      InkWell(
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(blurRadius: 2)],
                                color: const Color.fromARGB(255, 105, 105, 105),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                "Tap to retry !",
                                style: TextStyle(color: Colors.white),
                              )),
                          onTap: () => setState(() {})),
                    ],
                  )
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
      },
    );
  }

  Future<bool> isConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } catch (c) {
      return false;
    }
  }
}
