import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/E-commerce/e_commerce.dart';
import 'package:interyapp/pages/Electricite/homeelec.dart';

class electricity extends StatefulWidget {
  const electricity({ Key? key }) : super(key: key);

  @override
  _electricityState createState() => _electricityState();
}

class _electricityState extends State<electricity> {
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