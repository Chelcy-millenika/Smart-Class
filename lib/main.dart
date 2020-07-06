import 'DrawMe.dart';
import 'package:flutter/material.dart';
import 'package:fluttersignature/screens/welcome_screen.dart';
import 'package:fluttersignature/screens/login_screen.dart';
import 'package:fluttersignature/screens/registration_screen.dart';
import 'package:fluttersignature/screens/assignments_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     initialRoute: WelcomeScreen.id,
    routes: {
       WelcomeScreen.id: (context) => WelcomeScreen(),
          LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
      AssignmentScreen.id: (context) => AssignmentScreen(),
        DrawMe.id: (context) => DrawMe(),
      },
     //home: DrawMe(),
    );
  }
}


