import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/body/autre/service/database.dart';
import 'package:interyapp/body/profil.dart';
import 'package:interyapp/sreens/authentification.dart';
import 'package:interyapp/sreens/spinhome.dart';
import 'package:interyapp/widgets/util.dart';
import 'package:provider/provider.dart';

import 'autre/model/user.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}
class _menuState extends State<menu> {
  @override
  User? user=FirebaseAuth.instance.currentUser;
  UserSave loggedinuser=UserSave();
  final result=FirebaseAuth.instance.currentUser!.uid;
  authservices auth = authservices();
  Future<void> getuser() async {
    User? user = await auth.user;
    final userResult = await DBServices().getUser(user!.uid);
    setState(() {
      user = userResult;
    });
    print('connect to'+userResult);
  }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance.collection('users')
    .doc(user!.uid)
    .get()
    .then((value){
     this.loggedinuser=UserSave.fromJson(value.data());
    setState(() {
    });
    });
  }
  final pickert = ImagePicker();
  Widget build(
    BuildContext context) {
    return Container(
      color: Colors.black54,
      width: MediaQuery.of(context).size.width * 0.72,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Stack(
                children: [
                Center(
                  child: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                    top: 39,
                    left: 13,
                    child: IconButton(
                        onPressed: () async {
                          final data = await showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                    color: Colors.white,
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Center(
                                            child: Text(
                                              'photo de profil',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            height: 18,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              CircleAvatar(
                                                radius: 35,
                                                child: IconButton(
                                                    iconSize: 30,
                                                    onPressed: () async {
                                                      final result =
                                                          await pickert.getImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery);
                                                      Navigator.of(context).pop(
                                                          File(result!.path));
                                                    },
                                                    icon:
                                                        Icon(Icons.camera_alt)),
                                              ),
                                              Container(
                                                width: 18,
                                              ),
                                              CircleAvatar(
                                                radius: 35,
                                                child: IconButton(
                                                    iconSize: 30,
                                                    onPressed: () async {
                                                      final result =
                                                          await pickert.getImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera);
                                                      Navigator.of(context).pop(
                                                          File(result!.path));
                                                    },
                                                    icon: Icon(Icons.image)),
                                              )
                                            ],
                                          )
                                        ]));
                              });
                          print(data);
                        },
                        splashRadius: 25,
                        splashColor: Colors.black,
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        )))
              ]),
            ),
            accountName: Text('${loggedinuser.UserName}', style: configtext),
            accountEmail: Text('${loggedinuser.Mail}', style: configtext),
          ),
          Column(
            children: [
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: ListTile(
                  onTap: null,
                  leading: Icon(
                    Icons.home,
                    color: col,
                  ),
                  title: Text(
                    'Accueil',
                    style: TextStyle(color: col),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              MaterialButton(
                onPressed: null,
                child: ListTile(
                  onTap: (){
                    nav(profiles(), context);
                  },
                  leading: Icon(
                    Icons.person,
                    color: col,
                  ),
                  title: Text(
                    'Profile',
                    style: TextStyle(color: col),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              MaterialButton(
                onPressed: null,
                child: ListTile(
                  onTap: null,
                  leading: Icon(
                    Icons.settings,
                    color: col,
                  ),
                  title: Text(
                    'Parametre',
                    style: TextStyle(color: col),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              MaterialButton(
                onPressed: null,
                child: ListTile(
                  onTap: null,
                  leading: Icon(
                    Icons.room_preferences,
                    color: col,
                  ),
                  title: Text(
                    'Service Client',
                    style: TextStyle(color: col),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              MaterialButton(
                onPressed: () {},
                child: ListTile(
                  onTap: null,
                  leading: Icon(
                    Icons.help,
                    color: col,
                  ),
                  title: Text(
                    'Aide et Politique de confidentialite',
                    style: TextStyle(color: col),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              MaterialButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            'Deconnection',
                            style: configtext,
                          ),
                          content: Text('Voulez-vous vous deconnecter ?'),
                          actions: [
                            MaterialButton(
                              onPressed: () async {
                                nextix(context);
                                Navigator.pop(context);
                                await auth.signout();
                              },
                              textColor: Colors.orange.shade400,
                              child: Text(
                                'Oui',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            MaterialButton(
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                              textColor: Colors.orange.shade400,
                              child: Text(
                                'Non',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ],
                        );
                      });
                },
                textColor: col,
                splashColor: col2,
                color: Colors.orange.shade300,
                child: ListTile(
                  onTap: null,
                  leading: Icon(
                    Icons.exit_to_app,
                    color: col,
                  ),
                  title: Text(
                    'Deconnection',
                    style: TextStyle(color: col),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
