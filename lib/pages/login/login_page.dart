import 'package:attendanceapp/pages/login/bloc/login_bloc.dart';
import 'package:attendanceapp/pages/login/bloc/login_events.dart';
import 'package:attendanceapp/pages/login/bloc/login_states.dart';
import 'package:attendanceapp/pages/login/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../signup/bloc/signup_events.dart';
import '../signup/signup.dart';
import '../widgets/uihelper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocBuilder<LoginBloc, LoginState>(
  builder: (context, state) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: mq.height * .3,
              width: mq.width * 1,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(60.w)),
                color: Colors.red,
              ),
              child: Icon(
                Icons.person,
                size: 70.h,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: mq.height * 0.1,
            ),
            Text("Login",
                style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 30.h,
            ),
            UiHelper.CustomContainer("Employee Id", Alignment.topLeft, 40.w),
            SizedBox(
              height: 5.h,
            ),
            UiHelper.CustomTextField(

                 text:"Enter Employee Id",iconData:  Icons.person, toHide: false,func: (value){
                   context.read<LoginBloc>().add(LoginEmailEvents(email: value));
            }),
            SizedBox(
              height: 20.h,
            ),
            UiHelper.CustomContainer("Password", Alignment.topLeft, 40.w),
            SizedBox(
              height: 5.h,
            ),
            UiHelper.CustomTextField( text:"Enter Your Password",
                iconData:Icons.password,toHide: true,func: (value){
              context.read<LoginBloc>().add(LoginPasswordEvents(password: value));
                }),
            SizedBox(height: 35.h),
            UiHelper.CustomButton(() {
              LoginController(context: context).login();
            }, "Log In"),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Don't have an Account?",style: TextStyle(fontSize: 16.sp,color: Colors.black),),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
                }, child: Text("Sign Up",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.normal,color: Colors.red),))
            ],)
          ],
        ),
      );
  },
),
    );
  }
}
