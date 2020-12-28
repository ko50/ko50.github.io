import 'package:flutter/material.dart';
import 'package:portfolio/view/component/header/header_icon.dart';

class Header extends StatelessWidget {
  Widget get welcomeText => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'Hello World, My Name is ko!',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.pink[100],
        border:
            Border(bottom: BorderSide(width: 2.0, color: Colors.purple[900])),
      ),
      child: Column(
        children: [
          HeaderIcon(),
          welcomeText,
        ],
      ),
    );
  }
}
