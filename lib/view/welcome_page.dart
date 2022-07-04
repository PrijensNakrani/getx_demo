import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  String? username;
  final box = GetStorage();
  getUserName() {
    final name = box.read('username');
    setState(() {
      username = name;
    });
  }

  @override
  void initState() {
    getUserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome $username ",
          textScaleFactor: 2,
        ),
      ),
    );
  }
}
