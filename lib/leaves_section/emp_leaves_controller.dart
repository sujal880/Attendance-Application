import 'package:attendanceapp/leaves_section/bloc/leaves_bloc.dart';
import 'package:attendanceapp/models/leavesmodel.dart';
import 'package:attendanceapp/pages/widgets/uihelper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmpLeavesController {
  final BuildContext context;
  EmpLeavesController({required this.context});

  uploadleaves() {
    final state = context.read<LeavesBloc>().state;
    final User = FirebaseAuth.instance.currentUser;
    String reason = state.reason;
    String description = state.description;

    if (reason == "" && description == "") {
      UiHelper.CustomSnackBar("Enter Required Fields", context);
    } else {
      LeavesModel newleave =
          LeavesModel(description: description, reason: reason);
      FirebaseFirestore.instance
          .collection("Employees")
          .doc(User!.email)
          .collection("Leaves")
          .doc(User.email)
          .set(newleave.toMap())
          .then((value) {
        UiHelper.CustomSnackBar("Leaves Uploaded", context);
      });
    }
  }
}
