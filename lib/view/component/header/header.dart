import 'package:flutter/material.dart';
import 'package:portfolio/view/component/header/header_icon.dart';

class Header extends StatelessWidget {
  Widget get welcomeText => Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          'Hello World, My Name is ko!',
          style: TextStyle(
            color: Colors.black,
            fontSize: 37,
            fontWeight: FontWeight.w700,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48.0, bottom: 56.0),
      height: 500,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color(0xfffdfaff)],
        ),
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
