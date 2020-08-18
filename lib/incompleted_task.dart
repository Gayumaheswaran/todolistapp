import 'package:flutter/material.dart';

import 'completed_task.dart';
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
      debugShowCheckedModeBanner: false,

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
  Map<String,bool> values={
    'Learn about HTTP':false,
  'Learn about Ternary operator':false,
  'Learn about Json':false,
  'Have a meeting at 12':false,
  };
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:AppBar(
        title: Text("TODO List"),
        centerTitle: true,
        elevation: 6.0,
      ),
          body: ListView(
            children: values.keys.map((String key)
            {
              return new CheckboxListTile(
              title:Text(key),
            value:values[key],
            onChanged:(bool value)
            {
              setState(()
              {
                values[key]=value;
              });
            },
              );
            }).toList(),
    ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
    onPressed: ()
    {
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) =>CompletedTask()),

      );

    },
    ),
    );
  }
}
