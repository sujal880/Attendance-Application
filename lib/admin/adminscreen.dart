import 'package:attendanceapp/admin/totalemp_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'leavesscreen.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Screen"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 50.h,),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LeavesScreen()));
            },
            leading: Icon(Icons.leave_bags_at_home),
            title: Text("Leaves Section"),
          ),
          ListTile(
            leading: Icon(Icons.inbox_outlined),
            title: Text("In Out Section"),
          ),
          ListTile(
            onTap:(){
             Navigator.push(context,MaterialPageRoute(builder: (context)=>TotalEmployees())) ;
            },
            leading: Icon(Icons.description),
            title: Text("Total Employess"),
          )

        ],),
      ),
    );
  }
}
