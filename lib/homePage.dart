import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("หน้าหลัก"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.album),
                  title: Text("Welcome"),
                  subtitle: Text("WE567"),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              children: [
                Container(
                  padding: const EdgeInsets.all(0.0),
                  color: const Color.fromRGBO(114, 165, 246, 1),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'profile');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/user.png"),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "โปรไฟล์",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  color: const Color.fromRGBO(80, 145, 120, 1),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'my_map');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/map.png"),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "แผนที่",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  color: const Color.fromRGBO(150, 145, 40, 1),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'video_presentation');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/multimedia.png"),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "วิดิโอแนะนำ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )),
                ),
                Container(
                  padding: const EdgeInsets.all(0.0),
                  color: const Color.fromRGBO(255, 130, 182, 51),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'my_age');
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("assets/images/schedule.png"),
                            height: 80.0,
                            width: 80.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "คำนวนอายุ",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
