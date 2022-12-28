import 'package:flutter/material.dart';
import 'package:readercrowd/Data/likedData.dart';

class likeWidget extends StatefulWidget {
  int like;
  likeWidget({required this.like});
  @override
  _likeWidgetState createState() => _likeWidgetState();
}

class _likeWidgetState extends State<likeWidget> {
  int like = 0;
  void initState() {
    like = widget.like;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Liked by ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 23)),
                Text('$like',
                    style: TextStyle(color: Colors.grey, fontSize: 23))
              ],
            ),
            SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  for (var i = 0; i < like_DATA.length; i++)
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[500],
                            radius: 40,
                            child: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/image_2.jpg'),
                              radius: 60,
                            ),
                          ),
                          Text(
                            '${like_DATA[i]["name"]}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            '${like_DATA[i]["username"]}',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
          ],
        )));
  }
}
