import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TotalEmployees extends StatefulWidget {
  const TotalEmployees({super.key});

  @override
  State<TotalEmployees> createState() => _TotalEmployeesState();
}

class _TotalEmployeesState extends State<TotalEmployees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Total Employees"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Employees").snapshots(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.active){
            if(snapshot.hasData){
              return ListView.builder(itemBuilder: (context,index){
                return ListTile(
                  leading: Icon(Icons.person),
                  title: Text("${snapshot.data!.docs[index]["empemail"]}"),
                  subtitle: Text("${snapshot.data!.docs[index]["empphone"]}"),
                );
              },itemCount: snapshot.data!.docs.length,);
            }
            else if(snapshot.hasError){
              return Center(child: Text("An Error Occured"),);
            }
            else{
              return Center(child: Text("No Data Found!!"),);
            }
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}
