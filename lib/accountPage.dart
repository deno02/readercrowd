import 'package:flutter/material.dart';
import 'package:readercrowd/accountlibrarysinglechild.dart';
import 'package:readercrowd/readBookAccount.dart';

import 'Data/accountData.dart';
import 'accountCommentCard.dart';
import 'accountLibary.dart';
import 'accountPostCard.dart';

class accountPage extends StatefulWidget {
  @override
  _accountPageState createState() => _accountPageState();
}

class _accountPageState extends State<accountPage>
    with TickerProviderStateMixin {
  late TabController _controller;
  late AnimationController _animationControllerOn;
  late AnimationController _animationControllerOff;
  late Animation _colorTweenBackgroundOn;
  late Animation _colorTweenBackgroundOff;
  late Animation _colorTweenForegroundOn;
  late Animation _colorTweenForegroundOff;
  int _currentIndex = 0;
  int _prevControllerIndex = 0;
  double _aniValue = 0.0;
  double _prevAniValue = 0.0;
  List _text = ['Overview', 'Libary', 'Posts', 'Comments'];
  Color _foregroundOn = Colors.white;
  Color _foregroundOff = Colors.black;
  Color _backgroundOn = Colors.amber;
  Color _backgroundOff = Colors.grey;
  ScrollController _scrollController = new ScrollController();
  List _keys = [];
  bool _buttonTap = false;

  @override
  void initState() {
    super.initState();
    for (int index = 0; index < _text.length; index++) {
      _keys.add(new GlobalKey());
    }
    _controller = TabController(vsync: this, length: _text.length);
    _controller.animation!.addListener(_handleTabAnimation);
    _controller.addListener(_handleTabChange);

    _animationControllerOff =
        AnimationController(vsync: this, duration: Duration(milliseconds: 75));
    _animationControllerOff.value = 1.0;
    _colorTweenBackgroundOff =
        ColorTween(begin: _backgroundOn, end: _backgroundOff)
            .animate(_animationControllerOff);
    _colorTweenForegroundOff =
        ColorTween(begin: _foregroundOn, end: _foregroundOff)
            .animate(_animationControllerOff);

    _animationControllerOn =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerOn.value = 1.0;
    _colorTweenBackgroundOn =
        ColorTween(begin: _backgroundOff, end: _backgroundOn)
            .animate(_animationControllerOn);
    _colorTweenForegroundOn =
        ColorTween(begin: _foregroundOff, end: _foregroundOn)
            .animate(_animationControllerOn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.book),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => accountLibary(),
                ),
              );
            },
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Show Snackbar',
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: Column(children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 63.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 70.0,
                      backgroundImage:
                          AssetImage('${account_DATA[0]['image']}'),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                        '${account_DATA[0]['name']} ' +
                            '${account_DATA[0]['surname']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                  ),
                  Text('${account_DATA[0]['username']} ',
                      style: TextStyle(color: Colors.grey)),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('${account_DATA[0]['about']} ',
                        style: TextStyle(color: Colors.black)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      children: [
                        follower('Following',
                            account_DATA[0]['following'].toString()),
                        SizedBox(width: 10),
                        follower('Followers',
                            account_DATA[0]['followers'].toString()),
                        SizedBox(width: size.width / 3),
                        ElevatedButton(
                          onPressed: () {},
                          child: Container(
                            child: Row(
                              children: [
                                Icon(Icons.edit, color: Colors.grey, size: 18),
                                Text(' Edit ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16))
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: BorderSide(
                              width: 2,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 15),
                height: 50.0,
                child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: _text.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          key: _keys[index],
                          padding: EdgeInsets.all(6.0),
                          child: ButtonTheme(
                              child: AnimatedBuilder(
                            animation: _colorTweenBackgroundOn,
                            builder: (context, child) => FlatButton(
                                color: _getBackgroundColor(index),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(7.0)),
                                onPressed: () {
                                  setState(() {
                                    _buttonTap = true;
                                    _controller.animateTo(index);
                                    _setCurrentIndex(index);
                                    _scrollTo(index);
                                  });
                                },
                                child: Text(
                                  _text[index],
                                  style: TextStyle(color: Colors.white),
                                )),
                          )));
                    })),
            Flexible(
                child: TabBarView(
              controller: _controller,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      readBookWidget(),
                      Container(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 10, top: 10),
                          child: Text(
                            'Library',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                      librarySingle(),
                      Container(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 10, top: 10),
                          child: Text(
                            'Posts',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                      accountPostCard(),
                      Container(
                          padding:
                              EdgeInsets.only(left: 20, bottom: 10, top: 10),
                          child: Text(
                            'Comments',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )),
                      accountCommentCard(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      readBookWidget(),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Posts'),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('Comments'),
                    ],
                  ),
                ),
              ],
            )),
          ]),
        ));
  }

  _handleTabAnimation() {
    _aniValue = _controller.animation!.value;

    if (!_buttonTap && ((_aniValue - _prevAniValue).abs() < 1)) {
      _setCurrentIndex(_aniValue.round());
    }

    _prevAniValue = _aniValue;
  }

  _handleTabChange() {
    if (_buttonTap) _setCurrentIndex(_controller.index);
    if ((_controller.index == _prevControllerIndex) ||
        (_controller.index == _aniValue.round())) _buttonTap = false;
    _prevControllerIndex = _controller.index;
  }

  _setCurrentIndex(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      _triggerAnimation();
      _scrollTo(index);
    }
  }

  _triggerAnimation() {
    _animationControllerOn.reset();
    _animationControllerOff.reset();

    // run the animations!
    _animationControllerOn.forward();
    _animationControllerOff.forward();
  }

  _scrollTo(int index) {
    double screenWidth = MediaQuery.of(context).size.width;
    RenderBox renderBox = _keys[index].currentContext.findRenderObject();
    double size = renderBox.size.width;

    double position = renderBox.localToGlobal(Offset.zero).dx;

    double offset = (position + size / 2) - screenWidth / 2;

    if (offset < 0) {
      renderBox = _keys[0].currentContext.findRenderObject();

      position = renderBox.localToGlobal(Offset.zero).dx;
      if (position > offset) offset = position;
    } else {
      renderBox = _keys[_text.length - 1].currentContext.findRenderObject();
      position = renderBox.localToGlobal(Offset.zero).dx;

      size = renderBox.size.width;

      if (position + size < screenWidth) screenWidth = position + size;

      if (position + size - offset < screenWidth) {
        offset = position + size - screenWidth;
      }
    }
    _scrollController.animateTo(offset + _scrollController.offset,
        duration: new Duration(milliseconds: 150), curve: Curves.easeInOut);
  }

  _getBackgroundColor(int index) {
    if (index == _currentIndex) {
      return _colorTweenBackgroundOn.value;
    } else if (index == _prevControllerIndex) {
      return _colorTweenBackgroundOff.value;
    } else {
      return _backgroundOff;
    }
  }

  Widget follower(String follow, String number) => Column(
        children: [
          Text(follow, style: TextStyle(color: Colors.grey)),
          Text(number,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      );
}
