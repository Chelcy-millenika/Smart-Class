import 'package:flutter/material.dart';
import 'package:fluttersignature/components/rounded_button.dart';
import 'package:fluttersignature/DrawMe.dart';
import 'package:fluttersignature/assignment.dart';
import 'package:fluttersignature/assignment_list.dart';
class AssignmentScreen extends StatefulWidget {
  static const String id = 'assignment_screen';
  @override
  _AssignmentScreenState createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
   List<Assignment>assignmentList=[Assignment(title:'SubjectName1',
    description:'Assignment Description'),Assignment(title:'SubjectName2',
    description:'Assignment Description')];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
          backgroundColor: Colors.deepOrange[900],
          title: Text('Assignments')
      ),
      floatingActionButton:FloatingActionButton(
        child:Icon(Icons.add),
          backgroundColor:Colors.deepOrange[900],
        onPressed: (){},
      ),
          body:Container(
        child:AssignmentList(assignmentList)

    ),
    );
  }
}
