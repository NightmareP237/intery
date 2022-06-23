import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/E-commerce/e_commerce.dart';
import 'package:interyapp/pages/plombery/plomberhome.dart';

class plombery extends StatefulWidget {
  const plombery ({ Key? key }) : super(key: key);

  @override
  _plomberyState createState() => _plomberyState();
}

class _plomberyState extends State<plombery> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2100),()=>nav(plomber(),
     context,close: true));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spinner(),
    );
  }
}