import 'package:attendanceapp/pages/login/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/homescreen.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return Check();
  }

  Check() {
    final User = FirebaseAuth.instance.currentUser;
    if (User != null) {
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
