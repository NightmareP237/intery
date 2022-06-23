import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/Livraison/LivaiHome.dart';
import 'package:lottie/lottie.dart';
class liver extends StatefulWidget {
  const liver({ Key? key }) : super(key: key);

  @override
  _liverState createState() => _liverState();
}

class _liverState extends State<liver> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2100),()=>nav(livaison(), context,close: true));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spin(),
    );
  }
}
Widget spin()=> Scaffold(
  body:   Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('lotie/c5.json',), 
            ],
          )
        ),
);