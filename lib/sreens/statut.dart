import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interyapp/body/prehome.dart';

import '../coverpage.dart';
import 'authentification.dart';

class statut extends StatefulWidget {
  const statut({Key? key}) : super(key: key);

  @override
  _statutState createState() => _statutState();
}

class _statutState extends State<statut> {
  User? user;
  authservices auth = authservices();

  Future<void> getuser() async {
    final userResult = await auth.user;
    setState(() {
      user = userResult;
    });
  }
  @override
  Widget build(BuildContext context) {
    getuser();
    return user == null ? splash() : prehome();
  }
}
