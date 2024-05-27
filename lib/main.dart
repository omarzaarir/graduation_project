import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/CalendarDays.dart';
import 'package:graduation_project/browsing%20activitys/browsing%20activitys.dart';
import 'package:graduation_project/calendar.dart';
import 'package:graduation_project/firebase_options.dart';
import 'package:graduation_project/login.dart';
import 'package:graduation_project/models/localdata.dart';
import 'package:graduation_project/profile.dart';
import 'package:graduation_project/search.dart';
import 'package:graduation_project/select_interests.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  LocalData mylocaldatastructure = LocalData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GOHELP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // return Login();
    return BrowsingActivitys();
  }
}
