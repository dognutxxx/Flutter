import 'package:flutter/material.dart';
import 'package:myaboutme/blog.dart';
import 'package:myaboutme/homePage.dart';
import 'package:myaboutme/login.dart';
import 'package:myaboutme/myAge.dart';
import 'package:myaboutme/myMap.dart';
import 'package:myaboutme/myPort.dart';
import 'package:myaboutme/profile.dart';
import 'package:myaboutme/videoPresentation.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyHomePage(title: "My about time"),
        routes: <String, WidgetBuilder>{
          'profile': (BuildContext context) => const Profile(),
          'video_presentation': (BuildContext context) =>
              const VideoPresentation(),
          'my_map': (BuildContext context) => const MyMap(),
          'my_age': (BuildContext context) => const MyAge(),
          'my_port': (BuildContext context) => const MyPort(),
          'blog': (BuildContext context) => const Blog(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int userId = 0;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  Future<void> checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences
        .getInstance(); //เพื่อเช็คว่ามีการเก็บ cached ชั่วคราวไว้ไหม
    final int userid = prefs.getInt('userauthen')!;
    setState(() {
      userId = userid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<bool>(
      builder: (context, snapshot) {
        if (userId >= 1) {
          return const HomePage();
        } else {
          return const Login();
        }
      },
      future: null,
    ));
  }
}
