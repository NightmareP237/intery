import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class navigate extends StatefulWidget {
  const navigate({Key? key}) : super(key: key);

  @override
  _navigateState createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  final db=FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  // .doc(FirebaseAuth.instance.currentUser!.uid)
                  // .collection('coins')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((DocumentSnapshot document) {
                   Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'E-mail: ${data['email'].toString()}',
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                          Text("\n${data['password']}")
                        ],
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
     
    )
    );
  }
}
