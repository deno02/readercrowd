import 'package:flutter/material.dart';

class bookdetail extends StatefulWidget {
  const bookdetail({Key? key}) : super(key: key);

  @override
  _bookdetailState createState() => _bookdetailState();
}

class _bookdetailState extends State<bookdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Book Detail'),
        centerTitle: true,
      ),
    );
  }
}
