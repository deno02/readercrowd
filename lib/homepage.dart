import 'package:flutter/material.dart';
import 'package:readercrowd/composePage.dart';

import 'Data/sampleData.dart';
import 'custom/homepagecard.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class Item {
  const Item(this.icon, this.name);
  final String name;
  final Icon icon;
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    List icons = [
      const Item(
        Icon(
          Icons.add_box,
          color: const Color(0xFF167F67),
        ),
        'Save',
      ),
      const Item(
        Icon(
          Icons.add_box,
          color: Colors.orangeAccent,
        ),
        'Save',
      ),
      const Item(
        Icon(
          Icons.add_circle_outline,
          color: Colors.orangeAccent,
        ),
        'Follow',
      ),
      const Item(
        Icon(
          Icons.report,
          color: Colors.orangeAccent,
        ),
        'Report',
      ),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'ReaderCrowd',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_alert),
              color: Colors.black,
              tooltip: 'Bildirim',
              onPressed: () {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Bildirim')));
              },
            )
          ],
          centerTitle: true,
        ),
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstateItem(
                              itemData: RE_DATA[index],
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => composePage(),
              ),
            );
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.create_sharp),
        ),
      ),
    );
  }
}
