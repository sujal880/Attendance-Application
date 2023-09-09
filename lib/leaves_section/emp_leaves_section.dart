import 'package:attendanceapp/leaves_section/bloc/leaves_bloc.dart';
import 'package:attendanceapp/leaves_section/bloc/leaves_events.dart';
import 'package:attendanceapp/leaves_section/bloc/leaves_state.dart';
import 'package:attendanceapp/leaves_section/emp_leaves_controller.dart';
import 'package:attendanceapp/pages/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeavesSection extends StatefulWidget {
  const LeavesSection({super.key});

  @override
  State<LeavesSection> createState() => _LeavesSectionState();
}

class _LeavesSectionState extends State<LeavesSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<LeavesBloc, LeavesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Add Leaves"),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  UiHelper.CustomTextField(
                      toHide: false,
                      text: "Reason of Leave",
                      iconData: Icons.home,
                      func: (value) {
                        context.read<LeavesBloc>().add(ReasonEvents(value));
                      }),
                  SizedBox(height: 25.h,),
                  UiHelper.CustomTextField(
                      toHide: false,
                      text: "Description of Leaves",
                      iconData: Icons.add,func: (value){
                        context.read<LeavesBloc>().add(DescriptionEvents(value));
                  }),
                  SizedBox(height: 25.h,),
                  UiHelper.CustomButton(() {
                    EmpLeavesController(context: context).uploadleaves();
                  }, "Mark Leaves")
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
