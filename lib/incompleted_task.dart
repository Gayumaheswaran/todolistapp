import 'package:flutter/material.dart';
void main()
{
  runApp(Incompleted());
}
class Incompleted extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondApp(),

    );
  }
}
class SecondApp extends StatefulWidget
{
  _SecondAppState createState() => _SecondAppState();
  }

class _SecondAppState  extends State<SecondApp>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text("TODO list"),
        centerTitle: true,
      ),
          body: Container(
        padding: EdgeInsets.all(20.0),
    ),
    );
  }
}

