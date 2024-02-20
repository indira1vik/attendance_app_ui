import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});
  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List userData = [];

  Future<void> getrecord() async {
    String uri = "http://10.0.2.2:92/practice_api/sample_view.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userData = jsonDecode(response.body);
      });
    } catch (ex) {
      print(ex);
    }
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(12),
              child: ListTile(
                title: Text(userData[index]["uname"]),
                subtitle: Text(userData[index]["uemail"]),
              ),
            );
          }),
    );
  }
}
