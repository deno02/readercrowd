import 'package:flutter/material.dart';

class composePage extends StatefulWidget {
  const composePage({Key? key}) : super(key: key);

  @override
  _composePageState createState() => _composePageState();
}

class _composePageState extends State<composePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 196, 43, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This post will be a...',
                style: TextStyle(
                    color: Color.fromRGBO(252, 241, 207, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            FlatButton(
              child: Text(
                "Comment",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print("Butona 1 Kez Tıklandı");
              },
              padding: EdgeInsets.all(20),
              textColor: Colors.black,
            ),
            FlatButton(
              child: Text(
                "Discussion",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print("Butona 1 Kez Tıklandı");
              },
              padding: EdgeInsets.all(20),
              textColor: Colors.black,
            ),
            FlatButton(
              child: Text(
                "Poll",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print("Butona 1 Kez Tıklandı");
              },
              padding: EdgeInsets.all(20),
              textColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
