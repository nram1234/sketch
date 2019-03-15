import 'package:flutter/material.dart';
import 'Sketch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kids Sketch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Kids Sketch'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Offset> points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    final Container sketchArea = Container(
      margin: EdgeInsets.all(4.0),
      alignment: Alignment.topLeft,
      color: Colors.white,
      child: CustomPaint(
        painter: Sketch(points),
      ),
    );
    return Scaffold(
      appBar: AppBar(actions: <Widget>[IconButton(tooltip: "clear",icon:Icon(Icons.refresh) , onPressed: (){
points.clear();
      })],

        title: Text(widget.title),
      ),
      body: GestureDetector(
        onPanUpdate: (DragUpdateDetails details) {
          setState(() {
            RenderBox box = context.findRenderObject();
            Offset point = box.globalToLocal(details.globalPosition);
            point = point.translate(0.0,- AppBar().preferredSize.height);
            points = List.from(points)..add(point);
          });
        },
    onPanEnd: (DragEndDetails details){
          points.add(null);
    },child: sketchArea,  ),
    );
  }
}
