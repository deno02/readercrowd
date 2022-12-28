import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:readercrowd/startPages/loginPage.dart';

class getStarted extends StatefulWidget {
  @override
  _getStartedState createState() => _getStartedState();
}

class _getStartedState extends State<getStarted>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 25,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/images/logo.png'),
            radius: 50,
          ),
          Container(
            height: 400,
            child: Center(
              child: Lottie.asset('assets/animation/books.json'),
            ),
          ),
          Text(
            'Share your reads.',
            style: TextStyle(fontSize: 22),
          ),
          Text(
            'Get introduced to a new book.',
            style: TextStyle(fontSize: 22),
          ),
          Text(
            'Join the crowd.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50, //height of button
            width: 250,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      alignment: Alignment.bottomCenter,
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 600),
                      reverseDuration: Duration(milliseconds: 600),
                      type: PageTransitionType.bottomToTop,
                      child: loginPage(),
                      childCurrent: loginPage()),
                );
              },
              child: Text(
                'Get Started',
                style: TextStyle(fontSize: 17),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
