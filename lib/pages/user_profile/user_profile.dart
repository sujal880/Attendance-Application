import 'dart:io';
import 'package:attendanceapp/models/usermodel.dart';
import 'package:attendanceapp/pages/user_profile/bloc/user_bloc.dart';
import 'package:attendanceapp/pages/user_profile/bloc/user_events.dart';
import 'package:attendanceapp/pages/user_profile/user_profile_controller.dart';
import 'package:attendanceapp/pages/widgets/uihelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UserProfileScreen extends StatefulWidget {
  final UserModel userModel;
  final User firebaseuser;
  UserProfileScreen({required this.userModel,required this.firebaseuser});
  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Your Pic"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80.h),
            UiHelper.CustomContainer("Employee Name", Alignment.topLeft, 35.w),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomTextField(
                text: "Enter Your Name",
                iconData: Icons.person,
                toHide: false,
                func: (value) {
                  context.read<UserBloc>().add(EmployName(empname: value));
                }),
            SizedBox(height: 40.h),
            UiHelper.CustomContainer(
                "Employee Desicnation", Alignment.topLeft, 35.w),
            SizedBox(
              height: 10.h,
            ),
            UiHelper.CustomTextField(
                text: "Enter Your Desicnation",
                iconData: Icons.description,
                toHide: false,
                func: (value) {
                  context
                      .read<UserBloc>()
                      .add(EmployDesicnation(empdesc: value));
                }),
            SizedBox(height: 60.h),
            UiHelper.CustomButton(() {
              UserProfileController(context: context,userModel: widget.userModel,firebaseuser: widget.firebaseuser).ProfileUpload();
            }, "Get Started")
          ],
        ),
      ),
    );
  }
}
