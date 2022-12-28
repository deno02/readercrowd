import 'package:flutter/material.dart';

import 'Data/library.dart';
import 'bookDetail.dart';

class librarySingle extends StatefulWidget {
  const librarySingle({Key? key}) : super(key: key);

  @override
  _librarySingleState createState() => _librarySingleState();
}

class _librarySingleState extends State<librarySingle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (var i = 0; i < library_DATA.length; i++)
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => bookdetail(),
                          ),
                        );
                      },
                      child: Image.asset(
                        '${library_DATA[i]["image"]}',
                        height: 150,
                        width: 100,
                      ),
                    ), //
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
