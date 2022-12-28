import 'package:flutter/material.dart';
import 'package:readercrowd/interactionsPage.dart';
import 'package:readmore/readmore.dart';

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;

  const RealEstateItem({Key? key, this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      child: Card(
        elevation: 50,
        shadowColor: Colors.black,
        color: Colors.white,
        child: SafeArea(
          child: SizedBox(
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green[500],
                    radius: 28,
                    child: const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/image_2.jpg"),
                      radius: 100,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${itemData["name"]}" +
                              " " +
                              "${itemData["surname"]}",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${itemData["time"]}",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${itemData["subhead"]}',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ), //Textstyle
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: size.width / 2 + 35,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReadMoreText(
                                '${itemData["description"]}',
                                trimLines: 5,
                                style: TextStyle(color: Colors.black),
                                colorClickableText: Colors.grey,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'more',
                                trimExpandedText: 'less',
                              ),
                              Text(
                                '\n${itemData["bookname"]}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${itemData["author"]}',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    itemData["etiket"].length, (index) {
                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      side: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      margin: EdgeInsets.all(2),
                                      child: Text(
                                        '${itemData["etiket"][index]}',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                              SizedBox(height: 15),
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => interactions(
                                          like: itemData["like"],
                                          comment: itemData["comments"]),
                                    ),
                                  );
                                },
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      for (int i = 0; i < 3; i++)
                                        Container(
                                          padding: EdgeInsets.only(left: 0),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            backgroundImage: AssetImage(
                                                '${itemData["image"]}'),
                                            radius: 15,
                                          ),
                                        ),
                                      Text(
                                        ' ${itemData["like"]} likes - ${itemData["comments"]} comments',
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
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_horiz,
                              size: 25, color: Colors.grey)),
                      SizedBox(height: size.height * 2 / 11),
                      Container(
                        child: Column(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.thumb_up_alt_outlined,
                                    size: 25, color: Colors.amber)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.add_comment_rounded,
                                    size: 25, color: Colors.amber)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.share,
                                    size: 25, color: Colors.amber)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
