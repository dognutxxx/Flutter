import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myaboutme/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late String msg = "";

  Future<dynamic> signIn() async {
    if (usernameController.text == '' || passwordController.text == '') {
      setState(() {
        msg = "ข้อมูลผู้ใช้งานไม่ถูกต้อง";
      });
    }
    if (usernameController.text == "harry" &&
        passwordController.text == "1234") {
      setPreferences(1);
    } else {
      setState(() {
        msg = "ข้อมูลผู้ใช้ไม่ถูกต้อง";
      });
    }
  }

  void setPreferences(res) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("userauthen", res);
    if (!context.mounted) return;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(
                    'assets/images/bitcoin.png',
                  ),
                  width: 100.00,
                  height: 100.00,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "My About Me App",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
                ),
              ),
              if (msg != '')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    msg,
                    style: TextStyle(color: Colors.red[800]),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: "Username"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.key),
                          border: InputBorder.none,
                          hintText: "Password"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                    onPressed: signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(25, 177, 252, 1),
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          )),
        )));
  }
}
