import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/incompleted_task.dart';

 void main()
 {
   runApp(MyApp());
 }
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     // TODO: implement build
     return MaterialApp(
       home: FirstApp(),
       debugShowCheckedModeBanner: false,
     );
   }
 }
class FirstApp extends StatefulWidget {
   @override
  _FirstAppState createState() => _FirstAppState();
}
class _FirstAppState extends State<FirstApp> {

   var email;
   var password;

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body:
      Center(
        child: Form(
            key: _form,
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("TODO LIST APP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            color:Colors.blueAccent,
                              fontSize: 20.0,
                              fontWeight:FontWeight.bold,
                              fontStyle: FontStyle.italic
                        )
                        ),
                      ),
                    ),
                      SizedBox(height:8.0),

                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: _email,
                          validator: (String email) {
                            String pattern = r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';
                            RegExp regExp = new RegExp(pattern);
                            if (email.length == 0)
                              return 'email id required';
                            else if (!regExp.hasMatch(email))
                              return 'invalid Mail';
                            else
                              return null;
                          },
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                            enabledBorder: OutlineInputBorder(),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                    SizedBox(height: 5.0),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        validator: (String password)
                        {
                          if(password.length==0)
                            return 'password is required';
                        },
                        obscureText: true,
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'password',
                          enabledBorder: OutlineInputBorder(),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    RaisedButton(
                        onPressed: () {
                           if (_form.currentState.validate()) {
                             var obj= new HttpService();
                             var result;
                             obj.GetRequest();
                             //result = obj.PostRequest();
                           // if(result['message']=='Authorized') {
                               Navigator.push(
                                 context, MaterialPageRoute(
                                   builder: (context) => Incompleted()),
                               );
                               print("authorised");
                             }
                         //  }
                            else {
                               NotifyAlert(context);
                             }
                           //}
                        },
                        child: Text("Login"),
                        textColor: Colors.black,
                        color: Colors.blueAccent,
                    ),
                  ],
                ),
              ),
            )
      ),
    );
  }
}
class HttpService {
  void GetRequest() async {
    var response = await http.get(
        "http://117.193.64.41:10001/get/todo/654321");
    print(response.body);
    Map result = jsonDecode(response.body);
  }

  PostRequest() async {
    var response = await http.post("http://117.193.64.41:10001/login",
        body: json.encode({"email": "gayathri@3edge.in",
          "password": "gayathri"})
    );
    print(response.body);

    return response.body;
  }
}
 void NotifyAlert(BuildContext context)
 {
   var alertDialog=AlertDialog(
     content: Text("wrong email or password"),
   );
    showDialog(context: context,
    builder: (BuildContext context)
        {
          return alertDialog;
        }
    );
 }
