import 'package:attendance_app/home_elements/attendance.dart';
import 'package:attendance_app/home_elements/settings.dart';
import 'package:attendance_app/home_elements/student.dart';
import 'package:attendance_app/home_elements/teacher.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final PageController _pageController = PageController();
  String _appBarTitle = "Students";

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _updateAppBar(int index) {
    setState(() {
      _currentPage = index;
      switch (index) {
        case 0:
          _appBarTitle = "Students";
          break;
        case 1:
          _appBarTitle = "Teachers";
          break;
        case 2:
          _appBarTitle = "Attendance";
          break;
        case 3:
          _appBarTitle = "Settings";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(_appBarTitle),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF000000),
          fontSize: 24,
        ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: _updateAppBar,
          children: const [
            StudentPage(),
            TeacherPage(),
            AttendancePage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Students',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Teachers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color(0xFFF27121),
        currentIndex: _currentPage,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
      ),
    );
  }
}
