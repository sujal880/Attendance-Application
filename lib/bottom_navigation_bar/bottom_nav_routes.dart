import 'package:attendanceapp/pages/calendar.dart';
import 'package:attendanceapp/pages/homescreen.dart';
import 'package:attendanceapp/pages/profile.dart';
import 'package:flutter/material.dart';

List<BottomNavigationBarItem> bottomNavItems = const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.calendar_month),
    label: 'Calendar',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];

List<Widget> bottomNavScreen = <Widget>[
  Calendar(),
  HomeScreen(),
  ProfileScreen()
];
