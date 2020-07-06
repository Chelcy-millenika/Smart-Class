import 'package:flutter/material.dart';
import 'package:fluttersignature/assignment.dart';
import 'package:fluttersignature/assignment_tile.dart';
class AssignmentList extends StatefulWidget{
  List<Assignment>assignmentList;
  AssignmentList(this.assignmentList);
  _AssignmentListState createState() => _AssignmentListState();
}

class _AssignmentListState extends State<AssignmentList> {

  Widget build(BuildContext context)
  {
    return ListView.builder(itemBuilder: (context,index) {
      return AssignmentTile(title: widget.assignmentList[index].title,description: widget.assignmentList[index].description,);},
        itemCount:widget.assignmentList.length);
  }
}