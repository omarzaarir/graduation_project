import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class CrisisAlert extends StatefulWidget {
  const CrisisAlert({super.key});

  @override
  State<CrisisAlert> createState() => _CrisisAlertState();
}

class _CrisisAlertState extends State<CrisisAlert> {
  var items = [
    '100m',
    '500m',
    '1km',
    '2km',
    'destance',
  ];
  var dropdownvalue = "destance";
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
          "attracting the attention of neighbors",
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: RandomAvatar("string", height: 30, width: 30),
              title: Text("omar zaarir"),
              trailing: DropdownButton(
                  value: dropdownvalue,
                  items: items
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (e) {
                    setState(() {
                      dropdownvalue = e!;
                    });
                  }),
            ),
            const Card(
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "what is you want to tell your neighbor",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "this is tool for helping you to find emergency help and if you need serious help, dont using it in wrong way!",
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).canvasColor,
        onPressed: () {},
        child: const Column(
          children: [Icon(Icons.emergency_share_outlined), Text("send")],
        ),
      ),
    );
  }
}
// C:\Users\user\AppData\Local\Pub\Cache\binC:\Users\user\AppData\Local\Pub\Cache\bin