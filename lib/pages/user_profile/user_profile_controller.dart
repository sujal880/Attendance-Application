import 'package:attendanceapp/bottom_navigation_bar/bottom_nav.dart';
import 'package:attendanceapp/models/usermodel.dart';
import 'package:attendanceapp/pages/signup/bloc/signup_bloc.dart';
import 'package:attendanceapp/pages/user_profile/bloc/user_bloc.dart';
import 'package:attendanceapp/pages/widgets/uihelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileController {
  final UserModel userModel;
  final User firebaseuser;

  final BuildContext context;
  UserProfileController({required this.context,required this.userModel,required this.firebaseuser});

  ProfileUpload() async {
    final state = context.read<UserBloc>().state;
    String name = state.empname;
    String desc = state.empdesc;

    if (name == "" || desc == "") {
      UiHelper.CustomSnackBar("Enter Required Fields", context);
    } else {
      final state1 = context.read<SignUpBloc>().state;
      UserModel newuser=UserModel(empemail: userModel.empemail, empid: userModel.empid, empphone: userModel.empphone, empdesc: desc, empname: name);
      FirebaseFirestore.instance.collection("Employees").doc(state1.email).set(newuser.toMap()).then((value) {
        UiHelper.CustomSnackBar("Data Uploaded", context);
      }).then((value){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>BottomNav()));
      });
    }
  }
}
