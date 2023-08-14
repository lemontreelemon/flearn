
import 'package:flutter/cupertino.dart';

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;

  CustomPageRoute({RouteSettings? settings, required Widget this.child}) :super(
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => child,
    // transitionsBuilder: (context, animation, secondaryAnimation, child) =>
    //     SlideTransition(
    //       position: Tween(
    //           begin: Offset(1.0, 0.0),
    //           end: Offset.zero
    //       ).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
    //       child: SlideTransition(
    //         position: Tween(
    //             begin: Offset.zero,
    //             end: Offset(-1.0, 0.0)
    //         ).animate(CurvedAnimation(parent: animation, curve: Curves.linear)),
    //         child: child,
    //       ),
    //     ),
    // transitionDuration: Duration(microseconds: 300)
  );
}