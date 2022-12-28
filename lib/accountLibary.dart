import 'package:flutter/material.dart';

class accountLibary extends StatefulWidget {
  const accountLibary({Key? key}) : super(key: key);

  @override
  _accountLibaryState createState() => _accountLibaryState();
}

class _accountLibaryState extends State<accountLibary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.book),
            tooltip: 'Show Snackbar',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => accountLibary(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
