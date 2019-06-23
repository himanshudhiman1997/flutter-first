import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xl_demo/background.dart';
import 'package:xl_demo/loginUi.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Background(),
            Login(),
          ],
        ));
  }
}

class SecondRoute extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Users list",
      home: Scaffold
        (
        appBar: AppBar(title: Text("Users list")),
        body: getListView(),
      ),
    );
  }
}

Widget getListView()
{
  var listView = ListView(
    children: <Widget>[

      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text("Lorem Ipsum, Age"),
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text("Lorem Ipsum, Age"),
      ),
      ListTile(
        leading: Icon(Icons.account_circle),
        title: Text("Lorem Ipsum, Age"),
      ),
    ],
  );
  return listView;
}