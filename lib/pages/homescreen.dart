import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../models/usermodel.dart';
import '../leaves_section/emp_leaves_section.dart';

class HomeScreen extends StatefulWidget {
  // final UserModel userModel;
  // final User firebaseuser;
  // HomeScreen({required this.userModel, required this.firebaseuser});
  @override
  State<HomeScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<HomeScreen> {
  final user=FirebaseAuth.instance.currentUser;
  bool isButtonActive = true;
  bool isButton1Active = true;
  String CheckIn = "--/--";
  String CheckOut = "--/--";
  String location = "";
  @override
  void initState() {
    super.initState();
    _getRecord();
  }

  void _getRecord() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("Employees")
          .where("${user!.uid}")
          .get();
      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection("Employees")
          .doc(user!.email)
          .collection("Time")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();
      setState(() {
        CheckIn = snap2['CheckIn'];
        CheckOut = snap2['CheckOut'];
      });
    } catch (e) {
      setState(() {
        CheckIn = "--/--";
        CheckOut = "--/--";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Attendance "),centerTitle: true,
        ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: width / 30),
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        child: Text(
                          'Welcome',
                          style:
                          TextStyle(color: Colors.black54, fontSize: width / 20),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width / 40),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${user!.email}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    alignment: Alignment.center,
                    child: Text(
                      "Today's Task",
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: width / 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 15, bottom: 32),
                      alignment: Alignment.centerLeft,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Check In",
                                      style: TextStyle(
                                          fontSize: width / 20, color: Colors.black54),
                                    ),
                                    Text(CheckIn,
                                        style: TextStyle(
                                            fontSize: width / 18,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              )),
                          Expanded(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Check Out",
                                        style: TextStyle(
                                            fontSize: width / 20, color: Colors.black54)),
                                    Text(CheckOut,
                                        style: TextStyle(
                                            fontSize: width / 18,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: DateTime.now().day.toString(),
                            style:
                            TextStyle(fontSize: width / 18, color: Colors.blue),
                            children: [
                              TextSpan(
                                  text:
                                  DateFormat(' MMMM yyyy').format(DateTime.now()),
                                  style: TextStyle(
                                      fontSize: width / 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ]),
                      )),
                  StreamBuilder(
                      stream: Stream.periodic(const Duration(seconds: 1)),
                      builder: (context, snapshot) {
                        return Container(
                          alignment: Alignment.center,
                          child: Text(
                            DateFormat('hh:mm:ss a').format(DateTime.now()),
                            style: TextStyle(
                                fontSize: width / 20, color: Colors.black54),
                          ),
                        );
                      }),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: GestureDetector(
                          onTap: isButtonActive
                              ? () {
                            checkIn();
                            setState(() {
                              isButtonActive = false;
                            });
                          }
                              : null,
                          child: isButtonActive
                              ? Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            child: Center(
                                child: Text(
                                  "Check In",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          )
                              : Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey),
                            child: Center(
                                child: Text(
                                  "Check In",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Card(
                        elevation: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)),
                        child: GestureDetector(
                          onTap: isButton1Active
                              ? () {
                            //checkout();
                            setState(() {
                              isButton1Active = false;
                            });
                          }
                              : null,
                          child: isButton1Active
                              ? Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.blue),
                            child: Center(
                                child: Text(
                                  "Check Out",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          )
                              : Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey),
                            child: Center(
                                child: Text(
                                  "Check Out",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Text(
                        'You have completed this day!',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  location != "" ? Text("Location") : SizedBox()
                ],
              ),
            ),
          ),
        drawer: Drawer(
          child: Column(children: [
            SizedBox(height: 90.h),
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person),
            ),
            SizedBox(height: 30.h,),
            ListTile(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>LeavesSection()));
              },
              leading: Icon(Icons.holiday_village),
              title: Text("Manage Leaves"),
              trailing: Icon(Icons.add),
            )
          ],),
        ),

      ),
    );
  }

  checkIn() async {
    print(DateFormat('hh:mm').format(DateTime.now()));
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("students")
          .where('id', isEqualTo: user!.email)
          .get();
      DocumentSnapshot snap2 = await FirebaseFirestore.instance
          .collection("students")
          .doc(user!.email)
          .collection("Time")
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
          .get();
      try {
        String CheckIn = snap2['CheckIn'];
        setState(() {
          CheckIn = DateFormat('hh:mm').format(DateTime.now());
          //CheckOut=DateFormat('hh:mm').format(DateTime.now());
        });
        await FirebaseFirestore.instance
            .collection("Employees")
            .doc(user!.email)
            .collection("Time")
            .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
            .update({
          'CheckIn': CheckIn,
          //'CheckOut':CheckOut
        });
      } catch (ex) {
        setState(() {
          CheckIn = DateFormat('hh:mm').format(DateTime.now());
          //CheckOut = DateFormat('hh:mm').format(DateTime.now());
        });
        await FirebaseFirestore.instance
            .collection("Employees")
            .doc(user!.email)
            .collection("Time")
            .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
            .set({
          'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
          'location': location
          //'CheckOut': DateFormat('hh:mm').format(DateTime.now())
        });
      }
    //  else {
    //   Timer(Duration(seconds: 3), () async {
    //     QuerySnapshot snapshot = await FirebaseFirestore.instance
    //         .collection("Employees")
    //         .where('id', isEqualTo: user!.email)
    //         .get();
    //     DocumentSnapshot snap2 = await FirebaseFirestore.instance
    //         .collection("Employees")
    //         .doc(user!.email)
    //         .collection("Time")
    //         .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
    //         .get();
    //     try {
    //       String CheckIn = snap2['CheckIn'];
    //       setState(() {
    //         CheckIn = DateFormat('hh:mm').format(DateTime.now());
    //         //CheckOut=DateFormat('hh:mm').format(DateTime.now());
    //       });
    //       await FirebaseFirestore.instance
    //           .collection("Employees")
    //           .doc(user!.email)
    //           .collection("Time")
    //           .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
    //           .update({
    //         'CheckIn': CheckIn,
    //         //'CheckOut':CheckOut
    //       });
    //     } catch (ex) {
    //       setState(() {
    //         CheckIn = DateFormat('hh:mm').format(DateTime.now());
    //         //CheckOut = DateFormat('hh:mm').format(DateTime.now());
    //       });
    //       await FirebaseFirestore.instance
    //           .collection("Employees")
    //           .doc(user!.email)
    //           .collection("Time")
    //           .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
    //           .set({
    //         'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
    //         //'CheckOut': DateFormat('hh:mm').format(DateTime.now())
    //       });
    //     }
    //   });
    // }
  }

  // checkout() async {
  //   print(DateFormat('hh:mm').format(DateTime.now()));
  //   if (UserModel.lat != 0) {
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance
  //         .collection("students")
  //         .where('id', isEqualTo: widget.userModel.email)
  //         .get();
  //     DocumentSnapshot snap2 = await FirebaseFirestore.instance
  //         .collection("students")
  //         .doc(widget.userModel.email)
  //         .collection("Time")
  //         .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
  //         .get();
  //     try {
  //       String CheckOut = snap2['CheckIn'];
  //       setState(() {
  //         CheckOut = DateFormat('hh:mm').format(DateTime.now());
  //       });
  //       await FirebaseFirestore.instance
  //           .collection("students")
  //           .doc(widget.userModel.email)
  //           .collection("Time")
  //           .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
  //           .update({
  //         //'CheckIn':CheckIn,
  //         'CheckOut': CheckOut
  //       });
  //     } catch (ex) {
  //       setState(() {
  //         //CheckIn = DateFormat('hh:mm').format(DateTime.now());
  //         CheckOut = DateFormat('hh:mm').format(DateTime.now());
  //       });
  //       await FirebaseFirestore.instance
  //           .collection("students")
  //           .doc(widget.userModel.email)
  //           .collection("Time")
  //           .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
  //           .set({
  //         'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
  //         'CheckOut': DateFormat('hh:mm').format(DateTime.now())
  //       });
  //     }
  //   } else {
  //     Timer(Duration(seconds: 3), () async {
  //       getLocation();
  //       QuerySnapshot snapshot = await FirebaseFirestore.instance
  //           .collection("students")
  //           .where('id', isEqualTo: widget.userModel.email)
  //           .get();
  //       DocumentSnapshot snap2 = await FirebaseFirestore.instance
  //           .collection("students")
  //           .doc(widget.userModel.email)
  //           .collection("Time")
  //           .doc(DateFormat('dd MMMM yyyy').format(DateTime.now()))
  //           .get();
  //       try {
  //         String CheckOut = snap2['CheckIn'];
  //         setState(() {
  //           CheckOut = DateFormat('hh:mm').format(DateTime.now());
  //         });
  //         await FirebaseFirestore.instance
  //             .collection("students")
  //             .doc(widget.userModel.email)
  //             .collection("Time")
  //             .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
  //             .update({
  //           //'CheckIn':CheckIn,
  //           'CheckOut': CheckOut
  //         });
  //       } catch (ex) {
  //         setState(() {
  //           //CheckIn = DateFormat('hh:mm').format(DateTime.now());
  //           CheckOut = DateFormat('hh:mm').format(DateTime.now());
  //         });
  //         await FirebaseFirestore.instance
  //             .collection("students")
  //             .doc(widget.userModel.email)
  //             .collection("Time")
  //             .doc(DateFormat(' dd MMMM yyyy').format(DateTime.now()))
  //             .set({
  //           'CheckIn': DateFormat('hh:mm').format(DateTime.now()),
  //           'CheckOut': DateFormat('hh:mm').format(DateTime.now())
  //         });
  //       }
  //     });
  //   }
  // }
}