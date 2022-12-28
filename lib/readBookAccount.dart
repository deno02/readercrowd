import 'package:flutter/material.dart';
import 'package:readercrowd/Data/readBook.dart';
import 'package:readercrowd/bookDetail.dart';

class readBookWidget extends StatefulWidget {
  const readBookWidget({Key? key}) : super(key: key);

  @override
  _readBookWidgetState createState() => _readBookWidgetState();
}

class _readBookWidgetState extends State<readBookWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => bookdetail(),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.white70, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${readBook_DATA[0]["name"]} is currently reading',
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 10),
                    Text('${readBook_DATA[0]["bookname"]}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('${readBook_DATA[0]["author"]}'),
                  ],
                ),
                Image.asset(
                  '${readBook_DATA[0]["image"]}',
                  height: 80,
                  width: 50,
                ), // Image.ass
              ],
            ),
          ),
        ),
      ),
    );
  }
}
