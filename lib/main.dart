import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: themeData,
    home: MyApp(),
  ));
}

final ThemeData themeData = ThemeData(
  canvasColor: Colors.lightGreenAccent,
  accentColor: Colors.redAccent,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            onPressed: () {
              Navigator.push(context, PageTwo());
            },
            child: Text("Go to Page Two")),
      ),
    );
  }
}

class PageTwo extends MaterialPageRoute<Null> {
  PageTwo()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).canvasColor,
              elevation: 1.0,
            ),
            body: Center(
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, PageThree());
                },
                child: Text("Go to Page Three"),
              ),
            ),
          );
        });
}

class PageThree extends MaterialPageRoute<Null> {
  PageThree()
      : super(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Page Three"),
              backgroundColor: Theme.of(context).accentColor,
              elevation: 2.0,
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    })
              ],
            ),
            body: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(Navigator.defaultRouteName));
                },
                child: Text("Go Home Page"),
              ),
            ),
          );
        });
}
