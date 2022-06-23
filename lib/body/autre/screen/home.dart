import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/service/auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 late User user;
  AuthService auth = AuthService();
  Future <void> getUser() async{
    final userResult = await auth.user;
    setState(() {
      user = userResult!;
    });
  }
  @override
  void initState() {
    super.initState();
    getUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home", style: TextStyle(color: Colors.blue),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()async{await auth.signOut();}, icon: Icon(Icons.logout))
        ],
        backgroundColor: Colors.black12,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text("Welcome")),
             Center(child: Text("uid: "+user.uid)),
          ],
        ),
      ),
    );
  }
}
