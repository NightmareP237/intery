import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/cleaning.dart';

import 'E-commerce/e_commerce.dart';
class cleanning extends StatefulWidget {
  const cleanning({ Key? key }) : super(key: key);
  @override
  _cleanningState createState() => _cleanningState();
}

class _cleanningState extends State<cleanning> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2100),()=>nav(CleaningPage(), context,close: true));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spinner(),
    );
  }
}