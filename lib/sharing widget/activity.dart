import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graduation_project/models/localdata.dart';
import 'package:graduation_project/postDialog.dart';
import 'package:graduation_project/show_activity.dart';
import 'package:random_avatar/random_avatar.dart';
import 'package:shimmer/shimmer.dart';

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
                    child: Image.network(
                        "https://images.pexels.com/photos/2880507/pexels-photo-2880507.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"))
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
                // Expanded(
                //   child: Text("رام االله - بيرزيت التجمع عند دوار التوتة",
                //       style: TextStyle(fontSize: 10)),
                // ),
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
        borderRadius: BorderRadius.circular(10),border: Border.all(color: Color.fromARGB(8, 0, 0, 0))
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
            Container(margin:const EdgeInsets.only(bottom: 4,right: 4,left: 4),
              decoration:const BoxDecoration(
                border: Border(right: BorderSide(color: Colors.black26),left:BorderSide(color: Colors.black26) ,),
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
                border: Border.all(color: Colors.black)
              ),
              child: Column(
                children: [
                  const Text("title of activity",style: TextStyle(fontSize: 15),),
                  const Divider(
                    color: Colors.black,
                    height: 1,
                    endIndent: 10,
                    indent: 10,
                  ),
                  const Text(
                    textAlign: TextAlign.left,
                    "The Pexels API enables programmatic access to the full Pexels content library, including photos, videos. All content is available free of charge, and you are welcome to use Pexels content for anything you'd like, as long as it is within our",
                  style: TextStyle(fontSize: 11),),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                        fit: BoxFit.cover,
                        index.bitLength.isOdd
                            ? "https://images.pexels.com/photos/5029853/pexels-photo-5029853.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                            : "https://images.pexels.com/photos/70573/fireman-firefighter-rubble-9-11-70573.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
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
