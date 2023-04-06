import 'package:flutter/cupertino.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  final String route;

  SlideRightRoute({required this.page, required this.route})
      : super(
          settings: RouteSettings(name: route),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-3, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
