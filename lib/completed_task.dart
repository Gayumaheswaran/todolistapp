import 'package:flutter/material.dart';

import 'add_task.dart';
void main()
{
  runApp(CompletedTask());
}
class CompletedTask extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ThirdApp(),
      debugShowCheckedModeBanner: false,

    );
  }
}
class ThirdApp extends StatefulWidget
{
  _ThirdAppState createState() => _ThirdAppState();
}

class _ThirdAppState  extends State<ThirdApp>
{
  @override
  Map<String,bool> values={
    'Take medicine before breakfast':true,
    'Do office work home 10 AM-7 PM':true,
    'Bring some groceries':true,

  };
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar:AppBar(
          title: Text("Completed List"),
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
    onPressed: (){
    Navigator.push(
    context, MaterialPageRoute(
    builder: (context) =>AddTask()),
    );
    },
    ),
    );
  }
}
