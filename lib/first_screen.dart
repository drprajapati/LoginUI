import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class FirstClass extends StatefulWidget {
  String title;

  @override
  State<StatefulWidget> createState() {
    return FirstPageTest(title);
  }

  FirstClass(String s);
}

class FirstPageTest extends State<FirstClass> {
  bool _hasFlash = false;
  bool _isOn = false;
  double _intensity = 1.0;
  bool pressed = true;
  FirstPageTest(String title);

  @override
  initState() {
    super.initState();
    initPlatformState();
  }

  initPlatformState() async {
    bool hasFlash = await Lamp.hasLamp;
    print("Device has flash ? $hasFlash");
    setState(() {
      _hasFlash = hasFlash;
    });
  }

  @override
  Widget build(BuildContext context) {
    _intensityChanged(double intensity) {
      Lamp.turnOn(intensity: intensity);
      setState(() {
        _intensity = intensity;
      });
    }

    Future _turnFlash() async {
      _isOn ? Lamp.turnOff() : Lamp.turnOn(intensity: _intensity);
      var f = await Lamp.hasLamp;
      setState(() {
        _hasFlash = f;
        _isOn = !_isOn;
      });
    }

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.highlight, color: Colors.white)),
              Tab(
                  icon: Icon(
                Icons.format_color_fill,
                color: Colors.white,
              )),
              Tab(
                  icon: Icon(
                Icons.web,
                color: Colors.white,
              ))
            ],
          ),
          title: Text("Practicals", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black45,
          automaticallyImplyLeading: false,
          elevation: 2.0,
        ),
        body: TabBarView(children: [
          new Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text(
                      'Device has flash: $_hasFlash\n Flash is on: $_isOn'),
                  new Slider(
                      value: _intensity,
                      onChanged: _isOn ? _intensityChanged : null),
                  new RaisedButton(
                      onPressed: () async =>
                          await Lamp.flash(new Duration(seconds: 2)),
                      child: new Text("Flash for 2 seconds")),
                  new FloatingActionButton(
                    child: Icon(_isOn ? Icons.flash_off : Icons.flash_on),
                    backgroundColor: Colors.yellow,
                    foregroundColor: Colors.black54,
                    onPressed: _turnFlash,
                  ),
                ],
              ),
            ),
          ),
          new Container(
            color: pressed ? Colors.grey : Colors.yellow,
            child: Column(
              children: <Widget>[
                MaterialButton(
                    child: Text(
                      "Change Color to Yellow",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        pressed = !pressed;
                      });
                    })
              ],
            ),
          ),
          new Container(
            child: WebView(
              initialUrl: "https://flutter.io",
            ),
          ),
        ]),
      ),
    );
  }
}
