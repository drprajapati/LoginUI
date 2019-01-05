import 'package:flutter/material.dart';
import 'cut_corner_border.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColor: Colors.yellowAccent,
          primaryColor: Colors.yellow,
          cursorColor: Colors.yellow,
          errorColor: Colors.yellow),
      home: MyHomePage(title: 'Login'),
      routes: <String, WidgetBuilder>{
        '/first_screen': (context) => new FirstClass('First'),
        '/second_screen': (context) => new SecondClass('Second')
      },
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
  final TextEditingController textEditingController =
      new TextEditingController();
  final TextEditingController textEditingControllerOne =
      new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black54,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                      child: Icon(Icons.account_circle,
                          color: Colors.yellowAccent, size: 180.0),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.yellow),
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          labelText: "Username",
                          labelStyle: new TextStyle(
                              color: Colors.yellow, fontSize: 18.0),
                          border: CutCornersBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                        controller: textEditingController,
                        validator: (value) {
                          if (value.isEmpty &&
                              textEditingController.text != "Darshan") {
                            return 'Enter valid email';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.yellow),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: textEditingControllerOne,
                        decoration: new InputDecoration(
                            labelText: "Password",
                            labelStyle: new TextStyle(
                                color: Colors.yellow, fontSize: 18.0),
                            border: CutCornersBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        validator: (value) {
                          if (value.length < 6 &&
                              textEditingControllerOne.text != "HelloDarshan") {
                            return 'Length of password should be more than 6';
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(180, 10, 0, 0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: FlatButton(
                              child: Text("Cancel"),
                              onPressed: () {},
                            ),
                          ),
                          RaisedButton(
                            child: Text("Login",
                                style: new TextStyle(color: Colors.black87)),
                            color: Colors.yellow,
                            splashColor: Colors.black26,
                            shape: BeveledRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0))),
                            elevation: 5.0,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                if ((textEditingController.text == "Darshan") &&
                                    (textEditingControllerOne.text ==
                                        "HelloDarshan")) {
                                  Navigator.of(context)
                                      .pushNamed('/first_screen');
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
