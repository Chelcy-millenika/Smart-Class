import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:painter2/painter2.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
class ColorPickerButton extends StatefulWidget {
  final PainterController _controller;

  ColorPickerButton(this._controller);

  @override
  _ColorPickerButtonState createState() => new _ColorPickerButtonState();
}

class _ColorPickerButtonState extends State<ColorPickerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_iconData, color: _color),
      tooltip: 'Change draw color',
      onPressed: () => _pickColor(),
    );
  }

  void _pickColor() {
    Color pickerColor = _color;
    Navigator.of(context)
        .push(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Pick color'),
              ),
              body: Container(
                  alignment: Alignment.center,
                  child: ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: (Color c) => pickerColor = c,
                  )));
        }))
        .then((_) {
      setState(() {
        _color = pickerColor;
      });
    });
  }

  Color get _color => widget._controller.drawColor;

  IconData get _iconData => Icons.brush;

  set _color(Color color) {
    widget._controller.drawColor = color;
  }
}