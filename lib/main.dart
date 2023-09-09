import 'package:attendanceapp/bottom_navigation_bar/bottom_nav_bloc.dart';
import 'package:attendanceapp/leaves_section/bloc/leaves_bloc.dart';
import 'package:attendanceapp/pages/login/bloc/login_bloc.dart';
import 'package:attendanceapp/pages/signup/bloc/signup_bloc.dart';
import 'package:attendanceapp/pages/user_profile/bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'auth/check_user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SignUpBloc()),
          BlocProvider(create: (context) => UserBloc()),
          BlocProvider(create: (context) => BottomNavBloc()),
          BlocProvider(create: (context) => LoginBloc()),
          BlocProvider(create: (context) => LeavesBloc())
        ],
        child: ScreenUtilInit(
          builder: (context, child) {
            return MaterialApp(
                title: 'Attendance App',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
                ),
                home: CheckUser());
          },
        ));
  }
}
