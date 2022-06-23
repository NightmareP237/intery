import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/E-commerce/e_commerce.dart';
import 'package:interyapp/pages/Electricite/homeelec.dart';

class revetir extends StatefulWidget {
  const revetir({ Key? key }) : super(key: key);

  @override
  _revetirState createState() => _revetirState();
}

class _revetirState extends State<revetir> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2100),()=>nav(electric(),
     context,close: true));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spinner(),
    );
  }
}