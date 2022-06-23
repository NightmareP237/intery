import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/service/auth.dart';

import 'body/autre/config/palette.dart';
import 'body/homepage.dart';
import 'sreens/spinhome.dart';

class forget extends StatefulWidget {
  const forget({Key? key}) : super(key: key);

  @override
  State<forget> createState() => _forgetState();
}
class _forgetState extends State<forget> {
  AuthService auth = AuthService();
  bool change = true;
  TextEditingController control = TextEditingController();
  final GlobalKey<FormState> _formSigninKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
              )),
          elevation: 0.0,
          toolbarHeight: 60,
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              'Verification',
              style: TextStyle(
                color: Colors.orange.shade300,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 7,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Text(
                    'mot de passe oublie ?\nconnectez-vous sans\n             tarder !',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.028,
                  ),
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
                          image: AssetImage('media/forgetpass.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Form(
                      key: _formSigninKey,
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail_sharp,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(35.0)),
                          ),
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'Entrer votre E-mail',
                          labelText: 'Email',
                          hintStyle: TextStyle(
                              fontSize: 14, color: Palette.textColor1),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Entrez votre adresse Email";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/35,
                  )
                ],
              ),
            ),
            MaterialButton(
              onPressed: () async {
                if (_formSigninKey.currentState!.validate()) {
                  nextix(context);
                  print("$control");
                  print('connection avec mail effectue avec sucess!!');
                  bool register = await auth.signInAnon();
                  _formSigninKey.currentState!.save();
                  if (register) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => home(),
                    ));
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                            title: Row(
                              children: [
                                Text(
                                  'mot de passe verifie!',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.check,
                                  size: 18,
                                  color: Colors.green,
                                )
                              ],
                            ),
                            content: Container(
                              width: 90,
                              height: 50,
                              color: Colors.green.shade100,
                              child: Center(
                                  child: Column(
                                children: [
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.green,
                                    size: 35,
                                  ),
                                  Text(
                                    'Verification Reussie!',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.green.shade500),
                                  )
                                ],
                              )),
                            )));
                  } else if (register != null) {
                    Navigator.of(context).pop();
                    if (!register) {
                      nextix(context);
                      Navigator.pop(context);
                      print('email ou mot de passe incorrect');
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                  title: Row(
                                    children: [
                                      Text(
                                        'Error',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 18),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.error_sharp,
                                        size: 18,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                  content: Text(
                                      'Adresse Email introuvable, veuillez vous inscrire!'),
                                  actions: [
                                    MaterialButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                      },
                                      textColor: Colors.orange.shade400,
                                      splashColor: Colors.orange.shade400,
                                      child: Text(
                                        'OK',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ]));
                    }
                  }
                }
              },
              minWidth: MediaQuery.of(context).size.width * 0.3,
              splashColor: Colors.white,
              height: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              color: Colors.grey.shade300,
              child: Container(
                  width: 90.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: Center(
                    child: Text('Envoyer',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500)),
                  )),
            ),
          ]),
        ),
      ),
    );
  }

  Widget expand() {
    return Column(children: [
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(0),
        child: TextFormField(
          cursorWidth: 3,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.orange.shade300,
            ),
            labelText: 'confirmer le mot de passe',
            hintText: 'saisissez votre mot de passe',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                print('ok');
              },
              child: Icon(
                Icons.visibility_off,
                color: Colors.grey.shade900,
                size: 20,
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      MaterialButton(
        onPressed: () {},
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
    ]);
  }
}
