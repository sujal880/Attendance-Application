import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeavesScreen extends StatefulWidget {
  const LeavesScreen({super.key});

  @override
  State<LeavesScreen> createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  final User = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee Leaves"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Employees")
            .doc(User!.email)
            .collection("Leaves")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${index + 1}"),
                    title: Text(
                        "${snapshot.data!.docs[index]["${User!.email}"].toString()}"),
                    subtitle: Text(
                        "${snapshot.data!.docs[index]["reason"].toString()}"),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("An Error Occured!!"),
              );
            } else {
              return Center(
                child: Text("Data Not Found!!"),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
