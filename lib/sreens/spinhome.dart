import 'package:flutter/material.dart';

nextix(context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
          child: Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ));
nexte(context) => showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) => Center(
          child: Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 5,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
        ));
