import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:simple_animations/simple_animations.dart';
class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);
  @override
  Widget build(BuildContext context) {
    // final tween = MultiTrackTween([
    //   Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
    //   Track("translateY").add(
    //     Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
    //     curve: Curves.easeOut)
    // ]);

    // return ControlledAnimation(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builderWithChild: (context, child, animation) => Opacity(
    //     opacity: (animation as Map)["opacity"],
    //     child: Transform.translate(
    //       offset: Offset(0, animation["translateY"]), 
    //       child: child
    //     ),
    //   ),
    // );
     return PlayAnimation<double>(
      tween: Tween(begin: 0.0, end: 200.0),
      delay: const Duration(microseconds:500),
      curve: Curves.easeInOut,
      child: child,
      builder: (context, child, value) {
        return Transform.translate(
          offset: Offset(0,1), 
          child: child
        );
    });
  }
}



// class Page extends StatelessWidget {
//   const Page({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PlayAnimation<double>(
//       tween: Tween(begin: 0.0, end: 200.0),
//       duration: const Duration(seconds: 2),
//       curve: Curves.easeOut,
//       builder: (context, child, value) {
//         return Container(
//           width: value,
//           height: value,
//           color: Colors.pink,
//         );
//       },
//     );
//   }
// }