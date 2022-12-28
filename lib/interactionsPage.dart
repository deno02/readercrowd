import 'package:flutter/material.dart';
import 'package:readercrowd/likeWidget.dart';

import 'commentWidget.dart';

class interactions extends StatefulWidget {
  int like;
  int comment;
  interactions({required this.like, required this.comment});

  @override
  _interactionsState createState() => _interactionsState();
}

class _interactionsState extends State<interactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Interactions',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            likeWidget(like: widget.like),
            SizedBox(height: 15),
            commentWidget(comment: widget.comment),
          ],
        ),
      ),
    );
  }
}
