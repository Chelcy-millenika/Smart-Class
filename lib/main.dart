import 'package:flutter/material.dart' show AlertDialog, BuildContext, Canvas, Colors, Container, CustomPaint, CustomPainter, Dialog, DragEndDetails, DragUpdateDetails, FloatingActionButton, GestureDetector, Icon, IconButton, Icons, MaterialApp, Navigator, Offset, Paint, RenderBox, Scaffold, Size, State, StatefulWidget, StrokeCap, Text, Widget, runApp, showDialog;
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

void main() => runApp(new MaterialApp(
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color = Colors.black;
  List<Offset> _points = <Offset>[];
  Color selectedColor;
  List<Signature> painterList = [];

  // static const Radius zero = Radius.circular(0.0),
Future createcolordialog(BuildContext context)
{
  return showDialog(context: context,
  builder:(context){
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      child: Container(
        height: 250,
        width: 500,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MaterialColorPicker(
            onColorChange: (Color color) {
              selectedColor=color;
              Navigator.of(context).pop();
    setState(() {
      color = selectedColor;
    painterList
        .add(Signature(points: _points.toList(), brushColor: color));
    _points.clear();


    });
            },
              selectedColor: selectedColor,
              elevation: 2,

          ),
        ),
      )
    ));
  });
}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SlidingUpPanel(
          minHeight:500.0,
        maxHeight: 50.0,
        color: Colors.cyanAccent[100],
          panelSnapping:false,
        borderRadius: BorderRadius.circular(8),
        panel:IconButton(
          icon:Icon(Icons.color_lens),
            onPressed: () {
              createcolordialog(context);
            }
        ),
        //
        //),
          body: new Container(
          child: new GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              setState(() {
                RenderBox object = context.findRenderObject();
                Offset _localPosition =
                    object.globalToLocal(details.globalPosition);
                _points = new List.from(_points)..add(_localPosition);
              });
            },
            onPanEnd: (DragEndDetails details) => _points.add(null),
            child: new CustomPaint(
              painter: new Signature(points: _points,brushColor: selectedColor,signatures: painterList),
              size: Size.infinite,
            ),
          ),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        backgroundColor: Colors.cyanAccent[400],
        splashColor: Colors.tealAccent[100],
        child: new Icon(Icons.clear),
        onPressed: () => _points.clear(),
      ),
    );
  }
}

class Signature extends CustomPainter {
  List<Offset> points;
  Color brushColor=Colors.teal;
  List<Signature> signatures;
  Signature({this.points,this.brushColor,this.signatures=const[]});

  @override
  void paint(Canvas canvas, Size size) {
    for (Signature painter in signatures) {
      painter.paint(canvas, size);
    }
    Paint paint = new Paint()
      ..color = brushColor
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }}
  }

  @override
  bool shouldRepaint(Signature oldDelegate) => oldDelegate.points != points;
}

