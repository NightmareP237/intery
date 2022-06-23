import 'dart:async';

import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/E-commerce/e_commerce.dart';

import 'available_car_screen.dart';

class AvailableCar extends StatefulWidget {
  const AvailableCar({ Key? key }) : super(key: key);

  @override
  _AvailableCarState createState() => _AvailableCarState();
}

class _AvailableCarState extends State<AvailableCar> {
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2100),()=>nav(AvailableCarScreen(), context,close: true));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spinner(),
    );
  }
}