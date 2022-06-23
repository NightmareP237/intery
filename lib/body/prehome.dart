import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interyapp/body/homepage.dart';
 class prehome extends StatefulWidget {
   const prehome({ Key? key }) : super(key: key);
 
   @override
   _prehomeState createState() => _prehomeState();
 }
 
 class _prehomeState extends State<prehome> {
   @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.symmetric(
            vertical: 0,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage(
                  'images/dark.png',
                ),
                fit: BoxFit.fitWidth,
                colorFilter:
                    ColorFilter.mode(Colors.black, BlendMode.softLight)),
          ),
        ),
      ),
    );
  }
}