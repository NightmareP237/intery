import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:interyapp/body/autre/screen/wifi_off.dart';

class expanded extends StatefulWidget {
  const expanded({Key? key}) : super(key: key);

  @override
  _expandedState createState() => _expandedState();
}

class _expandedState extends State<expanded>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final internet = InternetConnectionChecker().hasConnection;
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        // ignore: non_constant_identifier_names
        if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        } else if (status == AnimationStatus.completed) {
          _animationController.repeat();
        }
      });

    _animationController.forward();

    Timer(Duration(seconds: 8), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen2()));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomPaint(
              painter: MyCustomPainter(_animation.value),
              child: Container(
                height: 50,
                width: 50,
                color: Colors.transparent,
                child: CircularProgressIndicator(
                  color: Colors.orange.shade400,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final double animationValue;
  MyCustomPainter(this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    for (int value = 0; value >= 0; value--) {
      circle(canvas, Rect.fromLTRB(0, 0, size.width, size.height),
          value + animationValue);
    }
  }

  void circle(Canvas canvas, Rect rect, double value) {
    Paint paint = Paint()
      ..color = Colors.orange.withOpacity((0.4).clamp(.0, 1));
    canvas.drawCircle(rect.center,
        sqrt((rect.width * .5 * rect.width * .5) * value / 4), paint);
  }

  @override
  bool shouldRepaint(MyCustomPainter oldelegate) {
    return true;
  }
}
