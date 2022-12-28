import 'package:flutter/material.dart';
import 'package:readercrowd/Data/accountComment.dart';

class accountCommentCard extends StatefulWidget {
  const accountCommentCard({Key? key}) : super(key: key);

  @override
  _accountCommentCardState createState() => _accountCommentCardState();
}

class _accountCommentCardState extends State<accountCommentCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(right: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            for (var i = 0; i < accountcomment_DATA.length; i++)
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 0, right: 10),
                                width: size.width / 2 + 70,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('${accountcomment_DATA[0]["time"]}',
                                        style: TextStyle(color: Colors.grey)),
                                    SizedBox(height: 10),
                                    Text(
                                      '${accountcomment_DATA[0]["comment"]}',
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      padding: EdgeInsets.zero,
                                      child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          onPressed: () {},
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text("read all",
                                                style: TextStyle(
                                                    color: Colors.amber),
                                                textAlign: TextAlign.center),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              Image.asset(
                                '${accountcomment_DATA[0]["image"]}',
                                height: 100,
                                width: 65,
                              ), // Image.ass
                            ],
                          ),
                        ),
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
