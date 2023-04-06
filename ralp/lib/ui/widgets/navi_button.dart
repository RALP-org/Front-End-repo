// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../util/ui/transitions.dart';

class NaviButton extends StatelessWidget {
  final String title;
  final String route;
  final Widget page;

  const NaviButton(this.title, this.page, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 58,
        width: 325,
        margin: const EdgeInsets.only(top: 45),
        child: TextButton(
          onPressed: () {
            Navigator.push(context, SlideRightRoute(page: page, route: route));
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 22.0, letterSpacing: 1.0, color: Color(0xff000000)),
          ),
        ),
      ),
    );
  }
}
