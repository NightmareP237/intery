
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:interyapp/sreens/spinhome.dart';

import 'body/homepage.dart';
import 'sreens/authentification.dart';

class inscrit extends StatefulWidget {
  const inscrit({Key? key}) : super(key: key);

  @override
  State<inscrit> createState() => _inscritState();
}

class _inscritState extends State<inscrit> {
  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  User? result = FirebaseAuth.instance.currentUser;

  void registerToFb() {
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      nexte(context);
      dbRef.set({
        "email": emailController.text,
        "password": passwordController.text
      }).then((res) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => home()),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  // authservices auth = authservices();
  String nom = '';
  String mail = '';
  String password = '';
  bool isEmpty = false;
  bool change = false;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  String mot = '';
  String cmot = '';
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    size: 25,
                    color: Colors.black,
                  )),
            ],
          ),
          title: Text(
            'Inscription',
            style: TextStyle(
              color: Colors.orange.shade300,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.4),
                              Colors.yellow.withOpacity(0.4),
                              Colors.orange.shade300,
                            ]),
                        image: DecorationImage(
                            image: AssetImage('login/authen.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        cursorWidth: 3,
                        maxLength: 25,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.orange.shade300,
                          ),
                          labelText: 'Profil',
                          fillColor: Colors.white,
                          hoverColor: Colors.white,
                          focusColor: Colors.white,
                          hintText: 'Entrer votre nom d\'utilsateur',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre nom d\'utilsateur';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        cursorWidth: 3,
                        maxLength: 35,
                        maxLines: 1,
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
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre E-mail';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.emailAddress,
                        cursorWidth: 3,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        obscureText: true,
                        maxLength: 20,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Colors.orange.shade300,
                          ),
                          labelText: 'mot de passe',
                          hintText: 'Entrer votre mot de passe',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          mot == value;
                          if (value == null || value.isEmpty) {
                            return 'Entrer votre mot de passe';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextFormField(
                        cursorWidth: 3,
                        obscureText: change ? true : false,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.vpn_key,
                            color: Colors.orange.shade300,
                          ),
                          suffixIcon: IconButton(
                              splashColor: Colors.orange.shade300,
                              onPressed: () {
                                setState(() {
                                  change = !change;
                                });
                              },
                              icon: Icon(
                                change
                                    ? Icons.visibility_off_sharp
                                    : Icons.visibility_sharp,
                                color: Colors.orange.shade300,
                                size: 22,
                              )),
                          labelText: 'confirmation',
                          hintText: 'confirmer votre mot de passe',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'confirmer votre mot de passe';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    MaterialButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          registerToFb();
                          print('inscription effectue avec sucess');
                        }
                      },
                      minWidth: MediaQuery.of(context).size.width * 0.6,
                      splashColor: Colors.white,
                      height: 60,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      color: Colors.orange.shade300,
                      child: Text('inscription'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          )),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
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
