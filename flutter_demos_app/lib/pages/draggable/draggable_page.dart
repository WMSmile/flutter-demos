import 'package:flutter/material.dart';

import 'package:flutter_demos_app/widgets/draggable_widget.dart';

class DraggablePage extends StatefulWidget {
  @override
  _DraggablePageState createState() => _DraggablePageState();
}

class _DraggablePageState extends State<DraggablePage> {
  Color _draggableColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("draggable page",)
        ),
        body: Stack(
          children: <Widget>[
            DraggableWidget(
              offset: Offset(80.0, 80.0),
              widgetColor: Colors.tealAccent,
            ),
            DraggableWidget(
              offset: Offset(180.0, 80.0),
              widgetColor: Colors.redAccent,
            ),
            Center(
              child: DragTarget(onAccept: (Color color) {
                _draggableColor = color;
              }, builder: (context, candidateData, rejectedData) {
                return Container(
                  width: 200.0,
                  height: 200.0,
                  color: _draggableColor,
                );
              }),
            )
          ],
        ));
  }
}