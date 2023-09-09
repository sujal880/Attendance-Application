import 'dart:developer';

import 'package:attendanceapp/bottom_navigation_bar/bottom_nav.dart';
import 'package:attendanceapp/pages/widgets/uihelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../admin/adminscreen.dart';
import 'bloc/login_bloc.dart';

class LoginController{
  final BuildContext context;
  LoginController({required this.context});
  login()async{
    final state=context.read<LoginBloc>().state;
    String email=state.email;
    String password=state.password;
    if(email==""|| password==""){
      UiHelper.CustomSnackBar("Enter Required Fields", context);
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          route();
        });
      }
      on FirebaseAuthException catch(ex){
        UiHelper.CustomSnackBar(ex.code.toString(), context);
      }
    }
  }

  route()async{
    User? user=FirebaseAuth.instance.currentUser;
    var check=FirebaseFirestore.instance.collection("Employees").doc(user!.email).get().then((DocumentSnapshot documentSnapshot){
      if(documentSnapshot.exists){
        if(documentSnapshot.get("empemail")=="admin1@gmail.com"){
          log("Admin Log In");
          return Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminScreen()));
        }
        else{
          log("User Login");
          return Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
        }
      }
      else{
        UiHelper.CustomSnackBar("No Data Found!!", context);
      }
    });

  }
}