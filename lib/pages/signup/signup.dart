import 'package:attendanceapp/pages/signup/signupcontroller.dart';
import 'package:attendanceapp/pages/user_profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/uihelper.dart';
import 'bloc/signup_bloc.dart';
import 'bloc/signup_events.dart';
import 'bloc/signup_states.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context).size;
    return BlocBuilder<SignUpBloc, SignUpStates>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
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
                height: mq.height * 0.060,
              ),
              Text("Sign Up",
                  style:
                      TextStyle(fontSize: 26.sp, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomContainer("Employee Id", Alignment.topLeft, 40.w),
              SizedBox(
                height: 5.h,
              ),
              UiHelper.CustomTextField(
                  text: "Enter Employee Id",
                  iconData: Icons.person,
                  toHide: false,
                  func: (value) {
                    context.read<SignUpBloc>().add(EmailEvents(value));
                  }),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomContainer("Password", Alignment.topLeft, 40.w),
              SizedBox(
                height: 5.h,
              ),
              UiHelper.CustomTextField(
                  text: "Enter Your Password",
                  iconData: Icons.password,
                  toHide: true,
                  func: (value) {
                    context.read<SignUpBloc>().add(PasswordEvents(value));
                  }),
              SizedBox(
                height: 20.h,
              ),
              UiHelper.CustomContainer("Phone", Alignment.topLeft, 40.w),
              SizedBox(
                height: 5.h,
              ),
              UiHelper.CustomTextField(
                  text: "Enter Your Phone Number",
                  iconData: Icons.phone,
                  toHide: true,
                  func: (value) {
                    context.read<SignUpBloc>().add(PhoneNumberEvents(value));
                  }),
              SizedBox(height: 35.h),
              UiHelper.CustomButton(() {
                SignUpController(context: context).signUp();
              }, "Sign Up"),
            ],
          ),
        ),
      );
    });
  }
}
