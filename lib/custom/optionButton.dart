import 'package:flutter/material.dart';
import 'package:readercrowd/composePage.dart';
import 'package:readercrowd/utils/constants.dart';
import 'package:readercrowd/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final double width;

  const OptionButton(
      {Key? key, required this.text, required this.icon, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: FlatButton(
          color: Colors.amber,
          splashColor: Colors.white.withAlpha(55),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => composePage(),
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: COLOR_WHITE,
              ),
              addHorizontalSpace(10),
              Text(
                text,
                style: TextStyle(color: COLOR_WHITE, fontSize: 17),
              )
            ],
          )),
    );
  }
}
