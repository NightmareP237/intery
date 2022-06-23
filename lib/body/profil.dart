
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interyapp/body/autre/model/user.dart';

import 'autre/config/palette.dart';

class profiles extends StatefulWidget {
  const profiles({Key? key}) : super(key: key);

  @override
  _profilesState createState() => _profilesState();
}

class _profilesState extends State<profiles> {
   User? user=FirebaseAuth.instance.currentUser;
  UserSave loggedinuser=UserSave();
  final pickert = ImagePicker();
  late double size=MediaQuery.of(context).size.height;
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool trech = false;
  bool snack = true;
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
  TextEditingController montant = TextEditingController();
  TextEditingController code = TextEditingController();
  String result = '0';
  
 Widget list(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black26),
        child: ClipRect(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: Icon(icon,color: Colors.white),
            tileColor: Colors.white,
            title: Text(title,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),
            ),
            trailing: Container(
              
              width: 40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.white),
              child: Center(
                child: IconButton(onPressed:()=>shown(), icon: Icon(
                    Icons.edit,
                    size: 25,
                  color: Colors.orange.shade400,)),
              ),
            ),
          ),
        ),
      ),
    );
  }
   Widget list1(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black26),
        child: ClipRect(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: Icon(icon,color: Colors.white),
            tileColor: Colors.white,
            title: Text(title,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),),
            trailing: Container(
              
              width: 40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.white),
              child: Center(
                child: IconButton(onPressed:()=>showinput(context, title), icon: Icon(
                    Icons.edit,
                    size: 25,
                  color: Colors.orange.shade400,)),
              ),
            ),
          ),
        ),
      ),
    );
  }
   Widget list2(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.black26),
        child: ClipRect(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: Icon(icon,color: Colors.white),
            tileColor: Colors.white,
            title: Text(title,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w400),),
            trailing: Container(
              
              width: 40,height: 40,decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.white),
              child: Center(
                child: IconButton(onPressed:()=>showinput1(context, title), icon: Icon(
                    Icons.edit,
                    size: 25,
                  color: Colors.orange.shade400,)),
              ),
            ),
          ),
        ),
      ),
    );
  }
  // void calcul(double mont) {
  //   double finalresult = mont;
  //   mont = mont + mont;
  //   String calcul = finalresult.toStringAsFixed(2);
  //   setState(() {
  //     result = calcul;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange.shade400,elevation: 0,
      centerTitle: true,
      title:  Text(
                      'Profile',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),),
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.6,
                decoration: BoxDecoration(
                    color:Colors.orange.shade400,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(200, 30),
                      bottomRight: Radius.elliptical(200, 30),
                    )
                ),
                child: Column(
                  children: [
                    // SizedBox(height: MediaQuery.of(context).size.height/12,),
                    SizedBox(height: MediaQuery.of(context).size.height/50,),
                     Container(
                       height:MediaQuery.of(context).size.height/7,
                       width: MediaQuery.of(context).size.height/7,
                       child: Icon(
                         Icons.person,
                         size: 45,
                       ),
                       decoration: BoxDecoration(
                           shape: BoxShape.circle, color: Colors.white),
                     ),
                    SizedBox(height: MediaQuery.of(context).size.height/60,),
                     Text(
                       'Intery Services'.toUpperCase(),
                       style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontStyle: FontStyle.italic,
                           color: Colors.white),
                     ),
                    SizedBox(height: MediaQuery.of(context).size.height/80,),
                  ],
                ),

              ),
              Stack(
                children: [
                  Column(
                    children: [
                       SizedBox(height: MediaQuery.of(context).size.height/60,),
                      Text(
                        'Nom/Prenom: ${loggedinuser.UserName}',
                        style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                   SizedBox(height: MediaQuery.of(context).size.height/60,),
                      Text(
                        'E-mail: ${loggedinuser.Mail}',
                        style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    SizedBox(height: MediaQuery.of(context).size.height/70,),
                      Text(
                        'Mot de passe:${loggedinuser.Password}',
                        style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/70,),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  list(
                    'Ajouter une photo',
                    Icons.photo,
                  ),
                  list1(
                    'Changer de \nnom/prenom',
                    Icons.person,
                  ),
                  list2(
                    'Changer de \nmot de passe',
                    Icons.phone_android,
                  ),
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(vertical: 18, horizontal: 80),
                  //   child: Container(
                  //     child: ElevatedButton(
                  //       onPressed: () async {
                  //         setState(() => isLoading = true);
                  //         await Future.delayed(Duration(milliseconds: 350));
                  //         setState(() => isLoading = false);
                  //         setState(() => trech = true);
                  //         await Future.delayed(Duration(seconds: 5));
                  //         setState(() => trech = false);
                  //         showinput(context, 'Recharge du Compte')
                  //             .then((onvalue) {
                  //           if (snack) {
                  //             SnackBar mysnack = SnackBar(
                  //                 content: Text(
                  //                     'Recharge de ${onvalue} effectue avec success'));
                  //             Scaffold.of(context).showSnackBar(mysnack);
                  //           }
                  //         });
                  //       },
                  //       style: ElevatedButton.styleFrom(
                  //         textStyle: TextStyle(fontSize: 18),
                  //         minimumSize: Size.fromHeight(45),
                  //         shape: StadiumBorder(),
                  //       ),
                  //       child: trech
                  //           ? CircularProgressIndicator(
                  //               color: Colors.white,
                  //               strokeWidth: 3,
                  //             )
                  //           : Text(
                  //               'Recharge',
                  //               style: TextStyle(color: Colors.white),
                  //             ),
                  //     ),
                  //   ),
                  // )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

 
shown()  {
return showModalBottomSheet(
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
}  
  showinput<String>(BuildContext context, String title)  {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          bool valeur = false;
          bool isLoading = false;
          bool isdone = true;
          bool obs = true;

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              actionsOverflowDirection: VerticalDirection.up,
              title: Center(
                  child: Text(
                '${title}',
                style: TextStyle(fontSize: 18, color: AppColor.mainColor),
              )),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: montant,
                            decoration: InputDecoration(
                              prefixIconColor: Colors.orange,
                              fillColor: Colors.orange,
                              prefixIcon: Icon(
                                Icons.person_add,
                                color: Colors.orange,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              labelText: 'Non/Prenom',
                              hintText: 'Entrer votre nom/prenom',
                              labelStyle: TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Le champ est vide";
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height / 40,
                          // ),
                          // TextFormField(
                          //   controller: code,
                          //   // ignore: dead_code
                          //   obscureText: true,
                          //   keyboardType: TextInputType.visiblePassword,
                          //   decoration: InputDecoration(
                          //       fillColor: Colors.blue,
                          //       prefixIcon: IconButton(
                          //           onPressed: () {},
                          //           icon: Icon(
                          //             Icons.visibility,
                          //             color: Colors.blue,
                          //           )),
                          //       focusedBorder: UnderlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.blue)),
                          //       labelText: 'Code secret',
                          //       hintText: 'Entrer votre code secret',
                          //       labelStyle: TextStyle(
                          //         color: Colors.blue,
                          //       )),
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Le champ est vide";
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height / 40,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          double value = double.parse(montant.value.text);
                          double val = double.parse(montant.value.text);
                          // calcul(value);
                          montant.clear();
                          // FirebaseFirestore.instance.collection('users').add({
                          //   'montant': value,
                          //   'heure': DateTime.now(),
                          // });
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Modifier',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.orange.shade400,
                    ),
                    FlatButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.orange.shade400,
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }
  showinput1<String>(BuildContext context, String title)  {
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          bool valeur = false;
          bool isLoading = false;
          bool isdone = true;
          bool obs = true;

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              actionsOverflowDirection: VerticalDirection.up,
              title: Center(
                  child: Text(
                '${title}',
                style: TextStyle(fontSize: 18, color: AppColor.mainColor),
              )),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: montant,
                               keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIconColor: Colors.orange,
                              fillColor: Colors.orange,
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.orange,
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.orange)),
                              labelText: 'Telephone',
                              hintText: 'Entrer votre numero de telephone',
                              labelStyle: TextStyle(
                                color: Colors.orange,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Le champ est vide";
                              }
                              return null;
                            },
                          ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height / 40,
                          // ),
                          // TextFormField(
                          //   controller: code,
                          //   // ignore: dead_code
                          //   obscureText: true,
                          //   keyboardType: TextInputType.visiblePassword,
                          //   decoration: InputDecoration(
                          //       fillColor: Colors.blue,
                          //       prefixIcon: IconButton(
                          //           onPressed: () {},
                          //           icon: Icon(
                          //             Icons.visibility,
                          //             color: Colors.blue,
                          //           )),
                          //       focusedBorder: UnderlineInputBorder(
                          //           borderSide: BorderSide(color: Colors.blue)),
                          //       labelText: 'Code secret',
                          //       hintText: 'Entrer votre code secret',
                          //       labelStyle: TextStyle(
                          //         color: Colors.blue,
                          //       )),
                          //   validator: (value) {
                          //     if (value!.isEmpty) {
                          //       return "Le champ est vide";
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height / 40,
                          // ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          double value = double.parse(montant.value.text);
                          double val = double.parse(montant.value.text);
                          // calcul(value);
                          montant.clear();
                          // FirebaseFirestore.instance.collection('users').add({
                          //   'montant': value,
                          //   'heure': DateTime.now(),
                          // });
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Modifier',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.orange.shade400,
                    ),
                    FlatButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Annuler',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.orange.shade400,
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }
}
