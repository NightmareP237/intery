import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/E-commerce/homeEcom.dart';
import 'package:lottie/lottie.dart';

class e_commerce extends StatefulWidget {
  const e_commerce({ Key? key }) : super(key: key);

  @override
  _e_commerceState createState() => _e_commerceState();
}
class _e_commerceState extends State<e_commerce> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2100),()=>nav(Homecom(), context,close: true));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spinner()
    );
  }
}
Widget spinner()=> Scaffold(
  body:   Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('lotie/c5.json',), 
              // Lottie.network('https://assets9.lottiefiles.com/packages/lf20_jsTRZT.json')
            ],
          )
        ),
);