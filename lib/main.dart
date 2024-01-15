import 'package:attendance_app/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.purple,
    ),
    debugShowCheckedModeBanner: false,
    home: const Login(),
    initialRoute: '/',
    routes: {
      '/login': (context) => const Login(),
    },
  ));
}
