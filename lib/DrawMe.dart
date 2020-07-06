import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:painter2/painter2.dart';
import 'dart:typed_data';
import 'DrawBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DrawMe extends StatefulWidget {
  static const String id = 'DrawMe';
  @override
  _DrawMeState createState() => _DrawMeState();
}

class _DrawMeState extends State<DrawMe> {
  final _auth=FirebaseAuth.instance;
  bool _finished;
  PainterController _controller;
  final count = 0;

  @override
  void initState() {
    super.initState();
    _finished = false;
    _controller = newController();
  }

  PainterController newController() {
    PainterController controller = PainterController();
    controller.thickness = 10.0;
    controller.backgroundColor = Colors.amber[50];
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> actions;
    if (_finished) {
      actions = <Widget>[
        IconButton(
          icon: Icon(Icons.content_copy),
          tooltip: 'New Painting',
          onPressed: () => setState(() {
            _finished = false;
            _controller = newController();
          }),
        ),
      ];
    } else {
      actions = <Widget>[
        IconButton(
          icon: Icon(Icons.undo),
          tooltip: 'Undo',
          onPressed: () {
            if (_controller.canUndo) _controller.undo();
          },
        ),
        IconButton(
          icon: Icon(Icons.redo),
          tooltip: 'Redo',
          onPressed: () {
            if (_controller.canRedo) _controller.redo();
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          tooltip: 'Clear',
          onPressed: () => _controller.clear(),
        ),
        IconButton(
            icon: Icon(Icons.check),
            onPressed: () async {
              setState(() {
                _finished = true;
              });
              Uint8List bytes = await _controller.exportAsPNGBytes();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.deepOrange[900],
                    title: Text('View your image'),
                  ),
                  body: Container(
                    child: Image.memory(bytes),
                  ),
                );
              }));
            }),
        IconButton(
          icon: Icon(Icons.close),
          tooltip: 'Logout',
          onPressed: () {
            _auth.signOut();
            SystemNavigator.pop();
          },
        ),
      ];
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange[900],
          title: Text('Draw Me'),
          actions: actions,
          bottom: PreferredSize(
            child: DrawBar(_controller),
            preferredSize: Size(MediaQuery.of(context).size.width, 25.0),
          ),
        ),
        body: Center(
            child:  Painter(_controller))
    );
  }
}

