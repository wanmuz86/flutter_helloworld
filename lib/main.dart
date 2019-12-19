import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Hello World'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {

    setState(() {

      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
  void _decrementCounter(){
    setState((){
      _counter--;
    });
  }
  void _reset(){
    setState((){
      _counter = 0;
    });
  }
  void _showToast() {
    Fluttertoast.showToast(
        msg: "Hello World",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
            'I try to add another text',
        ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(child:
            Text('Increment'),
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _incrementCounter,
            ),
            RaisedButton(
              color: Colors.green,
              textColor: Colors.white,
                child:
            Text('Decrement'),
              onPressed: _decrementCounter,
      ),
            RaisedButton(child:
            Text('Reset'),
              color:Colors.red,
              textColor: Colors.white,
              onPressed: _reset,
            ),
            RaisedButton(
              child:Text("Show toast!"),
              color:Colors.yellow,
              textColor: Colors.black,
              onPressed: _showToast,
            ),
            RaisedButton(
              child:Text("Show Alert"),
              color:Colors.grey,
              textColor: Colors.black,
              onPressed: () => _onAlertButtonPressed(context)
            )
          ],
        ),
      ),

    );
  }

  _onAlertButtonPressed(BuildContext context) {

    Alert(context: context, type:AlertType.warning,title:"Warning!",
    desc:"Something is wrong!",buttons:[
      DialogButton(
        child: Text("OK"),
      ),
          DialogButton(
              child:Text("Cancel")
          )
        ]);
  }
}
