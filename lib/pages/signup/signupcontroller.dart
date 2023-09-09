import 'dart:developer';
import 'package:attendanceapp/models/usermodel.dart';
import 'package:attendanceapp/pages/user_profile/user_profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/uihelper.dart';
import 'bloc/signup_bloc.dart';

class SignUpController {
  final BuildContext context;
  SignUpController({required this.context});
  signUp() async {
    final state = context.read<SignUpBloc>().state;
    String email = state.email;
    String password = state.password;
    String phonenumber = state.phonenumber;
    if (email == "" && password == "" && phonenumber == "") {
      UiHelper.CustomSnackBar("Enter Required Fields", context);
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (ex) {
        UiHelper.CustomSnackBar(ex.code.toString(), context);
      }
      if (usercredential != null) {
        String uid = await usercredential.user!.uid;
        UserModel newuser = UserModel(
          empemail: email,
          empid: uid,
          empphone: phonenumber,
          empdesc: "",
          empname: "",
        );
        FirebaseFirestore.instance
            .collection("Employees")
            .doc(email)
            .set(newuser.toMap())
            .then((value) {
          log("User Created!!");
          UiHelper.CustomSnackBar("Welcome $email", context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserProfileScreen(
                        userModel: newuser,
                        firebaseuser: usercredential!.user!,
                      )));
        });
      }
    }
  }
}
