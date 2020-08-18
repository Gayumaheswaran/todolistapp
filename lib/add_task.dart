import 'package:flutter/material.dart';
import 'incompleted_task.dart';
void main()
{
  runApp(AddTask());
}
class AddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home:FourthApp(),
    );
  }
}

class FourthApp extends StatefulWidget
{
  _FourthAppState createState()=>_FourthAppState();
}


class _FourthAppState extends State<FourthApp>
{
  TextEditingController _task = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ADD Task'),
      ),
      body:
      Center(
      child: Form(
      key: _form,
      child: SingleChildScrollView(
        child: Column(
            children: <Widget>[
        Padding(
        padding: EdgeInsets.all(20.0),
        child: TextFormField(
          controller: _task,
          onFieldSubmitted:(_task){
            Navigator.of(context).pop(_task);
          },
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Enter your Task',
            enabledBorder: OutlineInputBorder(),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      RaisedButton(
    onPressed: ()
    {
     
      Navigator.push(
        context, MaterialPageRoute(
          builder: (context) =>Incompleted()),
      );
    },
    child: Text("Save"),
        elevation: 8.0,
    textColor: Colors.black,
    color: Colors.blueAccent,
      ),
        ],
    )
    )
    )
    )
);
  }
    
  }
