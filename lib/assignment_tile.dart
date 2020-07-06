import 'package:flutter/material.dart';
import 'package:fluttersignature/components/rounded_button.dart';
import 'package:fluttersignature/DrawMe.dart';
class AssignmentTile extends StatelessWidget {
  final bool submit;
  final String title;
  final String description;
 // final Function longPressCallback;

  AssignmentTile(
      {this.submit=false,
        this.title,
        this.description,
        });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(description),
      trailing: RoundedButton(
          title: 'Submit',
          colour: Colors.deepOrange[900],
          onPressed: ()  {
            Navigator.pushNamed(context, DrawMe.id);
          }),
    );
  }
}