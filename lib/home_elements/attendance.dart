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
    String uri = "http://10.0.2.2:92/attendance_api/view_teacher.php";
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
              margin:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ListTile(
                  title: Text(userData[index]["tchr_name"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Education: ${userData[index]["tchr_edu"]}"),
                      Text("Phone no: ${userData[index]["tchr_ph_one"]}"),
                      Text("Email: ${userData[index]["tchr_email"]}"),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}


// void StudentCard(){
//   Card(
//               margin: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: ListTile(
//                   title: Text(userData[index]["std_name"]),
//                   subtitle: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("School: ${userData[index]["std_school"]}"),
//                       Text("Father: ${userData[index]["std_father_name"]}"),
//                       Text("Mother: ${userData[index]["std_mother_name"]}"),
//                       Text(
//                         "Address: ${userData[index]["std_door"]}, ${userData[index]["std_street"]}, ${userData[index]["std_village"]}, ${userData[index]["std_taluk"]}, ${userData[index]["std_dist"]} - ${userData[index]["std_pin"]}",
//                         style: const TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             );
// }