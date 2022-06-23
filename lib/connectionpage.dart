import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:core';

import 'forgetword.dart';
import 'sreens/authentification.dart';
import 'sreens/spinhome.dart';

class next extends StatefulWidget {
  next({Key? key}) : super(key: key);
  @override
  State<next> createState() => _nextState();
}

class _nextState extends State<next> {
  @override
  String nom = '';
  String mail = '';
  bool isEmpty = false;
  bool change = false;
  authservices auth = authservices();
  String email = '', pass = '';
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size taille = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            elevation: 0.0,
            toolbarHeight: 60,
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Text(
                'Connection',
                style: TextStyle(
                  color: Colors.orange.shade300,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.yellow.withOpacity(0.4),
                              Colors.orange.shade200,
                            ]),
                        image: DecorationImage(
                            image: AssetImage('login/authenlite.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        cursorWidth: 3,
                        maxLength: 35,
                        cursorColor: Colors.orange.shade300,
                        cursorRadius: Radius.circular(5),
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.mail,
                            color: Colors.orange.shade300,
                          ),
                          labelText: 'Email',
                          hintText: 'Entrer votre E-mail',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 2,
                            ),
                          ),
                        ),
                        onChanged: (e) => email = e,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre E-mail';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        cursorWidth: 3,
                        obscureText: change ? true : false,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.orange.shade300,
                          ),
                          labelText: 'mot de passe',
                          hintText: 'Entrer votre mot de passe',
                          suffixIcon: IconButton(
                              splashColor: Colors.orange.shade300,
                              onPressed: () {
                                setState(() {
                                  change = !change;
                                });
                              },
                              icon: Icon(
                                change
                                    ? Icons.visibility_sharp
                                    : Icons.visibility_off_sharp,
                                color: Colors.orange.shade300,
                                size: 22,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        onChanged: (e) => pass = e,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre mot de passe';
                          }

                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          nextix(context);
                          print(email + '    ' + pass);
                          print('connection effectue avec sucess!!');
                          bool inscrit = await auth.signin(email, pass);
                          if (inscrit != null) {
                            Navigator.of(context).pop();
                            if (!inscrit) {
                              print('email ou mot de passe incorrect');
                            }
                          }
                        }
                      },
                      minWidth: MediaQuery.of(context).size.width * 0.6,
                      splashColor: Colors.white,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.orange.shade300,
                      child: Text('connection'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.022,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: InkWell(
                        splashColor: Colors.orange.shade300,
                        child: Text(
                          'mot de passe oublie?',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Colors.orange.shade300,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => forget()));
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.018,
                    )
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
//  Padding(
//               padding: const EdgeInsets.only(top: 10, left: 10),
//               child: Row(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isMale = true;
//                       });
//                     },
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 30,
//                           height: 30,
//                           margin: EdgeInsets.only(right: 8),
//                           decoration: BoxDecoration(
//                               color: isMale
//                                   ? Palette.textColor2
//                                   : Colors.transparent,
//                               border: Border.all(
//                                   width: 1,
//                                   color: isMale
//                                       ? Colors.transparent
//                                       : Palette.textColor1),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Icon(
//                             Icons.account_box,
//                             color: isMale ? Colors.white : Palette.iconColor,
//                           ),
//                         ),
//                         Text(
//                           "Male",
//                           style: TextStyle(color: Palette.textColor1),
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isMale = false;
//                       });
//                     },
//                     child: Row(
//                       children: [
//                         Container(
//                           width: 30,
//                           height: 30,
//                           margin: EdgeInsets.only(right: 8),
//                           decoration: BoxDecoration(
//                               color: isMale
//                                   ? Colors.transparent
//                                   : Palette.textColor2,
//                               border: Border.all(
//                                   width: 1,
//                                   color: isMale
//                                       ? Palette.textColor1
//                                       : Colors.transparent),
//                               borderRadius: BorderRadius.circular(15)),
//                           child: Icon(
//                             Icons.account_box,
//                             color: isMale ? Palette.iconColor : Colors.white,
//                           ),
//                         ),
//                         Text(
//                           "Female",
//                           style: TextStyle(color: Palette.textColor1),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),