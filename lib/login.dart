import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graduation_project/browsing%20activitys/browsing%20activitys.dart';
import 'package:graduation_project/models/currentuser/myuser.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

MyUser? myUser;

class _LoginState extends State<Login> {
  bool hidePass = true;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    myUser = MyUser(username, password);
    myUser!.authintication(
        {'email': myUser!.email, 'password': myUser!.pass}).then((value) {
      var c = jsonDecode(value);

      c['success']
          ? Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BrowsingActivitys(),
              ))
          : (print("object"));
    }

        // !value['success']
        //     ? Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => const BrowsingActivitys(),
        //         ))
        //     : ()
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(
          color: const Color.fromARGB(255, 36, 161, 145),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "find specific help on",
                style: TextStyle(
                  color: Color.fromARGB(150, 36, 161, 144),
                  fontSize: 20,
                ),
              ),
              const Text(
                "GOHELP",
                style: TextStyle(
                    letterSpacing: -8,
                    color: Color.fromARGB(255, 36, 161, 145),
                    fontSize: 80,
                    height: 1),
              ),
              const Text(
                "if have acount you can enter your user name and password then click on login, if not click on creat account to creat account.",
                style: TextStyle(
                  color: Colors.grey,
                  // fontSize: 80,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                child: TextField(
                  controller: _usernameController,
                  maxLines: 1,
                  minLines: 1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "enter your user name",
                    labelText: 'user name',
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
              Card(
                child: TextField(
                  controller: _passwordController,
                  maxLines: 1,
                  minLines: 1,
                  obscureText: this.hidePass,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        },
                        icon: Icon(
                          hidePass ? Icons.lock : Icons.lock_open,
                          color: Colors.black,
                        )),
                    border: InputBorder.none,
                    hintText: "enter your password",
                    labelText: 'password',
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 36, 161, 145),
                    elevation: 0,
                  ),
                  onPressed: () {
                    _login();
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const BrowsingActivitys(),
                    //     ));
                  },
                  child: const Text(
                    "login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                  )),
                  Text(" OR "),
                  Expanded(
                      child: Divider(
                    color: Colors.grey,
                  )),
                ],
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 36, 161, 145),
                    elevation: 0,
                  ),
                  onPressed: () {},
                  child: const Text(
                    "creat account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
