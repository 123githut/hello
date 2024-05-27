import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(TestApp());

class TestApp extends StatefulWidget {
  @override
  State<TestApp> createState() => _TestApp();
}

class _TestApp extends State<TestApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Material(
            child: Center(
                child: Column(
      children: [
        InkWell(
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('username', 'flutter_user');
          },
          child: Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
        ),
        InkWell(
          onTap: () async {
            final prefs = await SharedPreferences.getInstance();
            String? username = await prefs.getString('username');
            print("username==" + username!);
          },
          child: Container(
            color: Colors.yellow,
            height: 100,
            width: 100,
          ),
        )
      ],
    ))));
  }
}
