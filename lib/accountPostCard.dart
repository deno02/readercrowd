import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'Data/accountPost.dart';
import 'interactionsPage.dart';

class accountPostCard extends StatefulWidget {
  const accountPostCard({Key? key}) : super(key: key);

  @override
  _accountPostCardState createState() => _accountPostCardState();
}

class _accountPostCardState extends State<accountPostCard> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (var i = 0; i < accountPost_DATA.length; i++)
              Container(
                padding: EdgeInsets.all(10),
                width: size.width,
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
                        elevation: 0,
                        shadowColor: Colors.black,
                        color: Colors.white,
                        child: SafeArea(
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${accountPost_DATA[i]["time"]}",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Text(
                                          '${accountPost_DATA[i]["subhead"]}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ), //Textstyle
                                        ),
                                        SizedBox(height: 5),
                                        Container(
                                          width: size.width - 60,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ReadMoreText(
                                                '${accountPost_DATA[i]["description"]}',
                                                trimLines: 5,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                colorClickableText: Colors.grey,
                                                trimMode: TrimMode.Line,
                                                trimCollapsedText: 'more',
                                                trimExpandedText: 'less',
                                              ),
                                              Text(
                                                '\n${accountPost_DATA[i]["bookname"]}',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                '${accountPost_DATA[i]["author"]}',
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(height: 15),
                                              SizedBox(height: 15),
                                              FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0, vertical: 0),
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          interactions(
                                                              like: 12,
                                                              comment: 15),
                                                    ),
                                                  );
                                                },
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      for (int i = 0;
                                                          i < 3;
                                                          i++)
                                                        Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 0),
                                                          child: CircleAvatar(
                                                            backgroundColor:
                                                                Colors.grey,
                                                            backgroundImage:
                                                                AssetImage(
                                                                    '${accountPost_DATA[i]["friendimage"]}'),
                                                            radius: 15,
                                                          ),
                                                        ),
                                                      Text(
                                                        ' ${accountPost_DATA[i]["like"]} likes - ${accountPost_DATA[i]["comments"]} comments',
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
