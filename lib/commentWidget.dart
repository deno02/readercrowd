import 'package:flutter/material.dart';

class commentWidget extends StatefulWidget {
  int comment;
  commentWidget({required this.comment});
  @override
  _commentWidgetState createState() => _commentWidgetState();
}

class _commentWidgetState extends State<commentWidget> {
  int comment = 0;
  void initState() {
    comment = widget.comment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Comments ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
              Text('$comment',
                  style: TextStyle(color: Colors.grey, fontSize: 23))
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
