import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/congratulate.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class MyCustomWidget extends StatefulWidget {
  
 MyCustomWidget();
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController(
        
      );
  void _doSomething() async {
    Timer(
      Duration(seconds: 3),
      () {
        _btnController.success();
        Timer(Duration(seconds: 1), (){
        nav(congratulations(), context);
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RoundedLoadingButton(
          color: Colors.orange.shade700,
          
          child: Text('OK', style: TextStyle(color: Colors.white,fontSize: 18)),
          controller: _btnController,
          onPressed: _doSomething,
        ),
      ),
    );
  }
}
