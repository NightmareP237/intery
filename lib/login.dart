import 'package:flutter/material.dart';
import 'package:interyapp/body/autre/config/palette.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/body/homepage.dart';
import 'package:interyapp/forgetword.dart';
import 'package:interyapp/sreens/spinhome.dart';
import 'package:provider/provider.dart';

import 'body/autre/service/auth.dart';

class LoginSignupScreen extends StatefulWidget {
  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  AuthService auth = AuthService();
  bool change = false;
  // ignore: non_constant_identifier_names
  TextEditingController UserName = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController EmailTel = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Password = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Mail = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Pass = TextEditingController();
  bool isSignupScreen = true;
  bool isMale = true;
  bool isRememberMe = false;
  final GlobalKey<FormState> _formSigninKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formSignupKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("login/peoplewelcome.png"),
                    fit: BoxFit.fitHeight)),
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.black.withOpacity(.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.13,
                    ),
                    Text(
                      isSignupScreen
                          ? "Bienvenue a Intery,"
                          : "Heureux de vous revoir !",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[300],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Inscrivez vous et continuez !"
                          : "Connectez vous et continuez !",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          // buildBottomHalfContainer(false),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen
                ? 170
                : 225, // faire deplace vers le bas le contenu du container
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen
                  ? 330
                  : 250, // Agrandir le contenu de l'inscription
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "CONNECTION",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 65,
                                  color: Colors.orange,
                                ),
                              // MaterialButton(
                              //   onPressed: () {
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => expanded()));
                              //   },
                              //   textColor: Colors.orange.shade400,
                              //   splashColor: Colors.orange.shade400,
                              //   child: Text(
                              //     'page suivante',
                              //     style: TextStyle(
                              //       fontSize: 15,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "INSCRIPTION",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 65,
                                  color: Colors.orange,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (!isSignupScreen) buildSigninSection(),
                    if (isSignupScreen) buildSignupSection(),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
          Positioned(
            top: MediaQuery.of(context).size.height - 150,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                // Text(
                //   isSignupScreen
                //       ? "Autres modes d'inscription :"
                //       : "Autres modes de connection :",
                //   style: TextStyle(
                //     fontSize: 17,
                //     fontWeight: FontWeight.bold,
                //     color: Colors.orange.shade300,
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // buildTextButton(Icons.facebook, "Facebook",
                      //     Palette.facebookColor, home()),
                      // buildTextButton(Icons.golf_course, "Google",
                      //     Palette.googleColor, home()),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formSigninKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail_sharp,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Entrer votre E-mail',
                    labelText: 'Email',
                    hintStyle:
                        TextStyle(fontSize: 14, color: Palette.textColor1),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Entrez votre adresse Email";
                    }
                    return null;
                  },
                  controller: Mail,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  obscureText: change ? true : false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "**********",
                    labelText: 'mot de passe',
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
                          size: 18,
                        )),
                    hintStyle:
                        TextStyle(fontSize: 14, color: Palette.textColor1),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Entrer votre mot de passe";
                    }
                    return null;
                  },
                  controller: Pass,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Row(
                  //   children: [
                  //     Checkbox(
                  //       value: isRememberMe,
                  //       activeColor: Palette.textColor,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           isRememberMe = !isRememberMe;
                  //         });
                  //       },
                  //     ),
                  //     Text("Se souvenir",
                  //         style: TextStyle(
                  //             fontSize: 16,
                  //             color: Colors.orange.shade300,
                  //             fontWeight: FontWeight.bold))
                  //   ],
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.height * 0.068),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => forget()));
                      },
                      child: Text("mot de passe oublie?",
                          style: TextStyle(
                              fontSize: 15, color: Colors.orange.shade300)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Container(
        child: Form(
          key: _formSignupKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.account_box,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Speudo',
                    hintStyle:
                        TextStyle(fontSize: 14, color: Palette.textColor1),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Choississez un nom d'utilisateur";
                    }
                    return null;
                  },
                  controller: UserName,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email_sharp,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "E-mail ou Telephone",
                    hintStyle:
                        TextStyle(fontSize: 14, color: Palette.textColor1),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Le champ est vide";
                    }
                    return null;
                  },
                  controller: EmailTel,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock_outline,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Palette.textColor1),
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: "mot de passe",
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
                        size: 18,
                      ),
                    ),
                    hintStyle:
                        TextStyle(fontSize: 14, color: Palette.textColor1),
                  ),
                  controller: Password,
                  validator: (value) => value!.isEmpty
                      ? "Champ vide"
                      : value.length < 7
                          ? "Le mot de passe n'est pas securise"
                          : null,
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          "En cliquant sur le bouton 'S'inscrire' vous acceptez Nos ",
                      style: TextStyle(color: Palette.textColor2),
                      children: [
                        TextSpan(
                          //recognizer: ,
                          text: "termes & conditions",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor, Widget Connect) {
    return TextButton(
      onPressed: () {
        setState(() {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Connect));
        });
      },
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 495 : 495,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 7),
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? MaterialButton(
                  onPressed: () async {
                    if (isSignupScreen) {
                      if (_formSignupKey.currentState!.validate()) {
                        if (RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(EmailTel.text)) {
                          nextix(context);
                          bool register = await auth.signUp(
                            this.UserName.text,
                            this.EmailTel.text,
                            this.Password.text,
                          );
                          if (register) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => home(),
                            ));
                          }
                          if (!register) {
                            Navigator.of(context).pop();
                            print('echec de reconnaissance de linscription');
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                        title: Row(
                                          children: [
                                            Text(
                                              'Error',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18),
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
                                            'Veuillez verifier votre connection internet et reessayez plutart!!'),
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
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(EmailTel.text)) {
                          print('echec de la mauvaise saisit de lemail');
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                      title: Row(
                                        children: [
                                          Text(
                                            'Error',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
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
                                      content: RichText(
                                          text: TextSpan(
                                              text:
                                                  ' Svp,Veuillez entrer une adresse Email valide respectant les normes tel que: ',
                                              style: TextStyle(
                                                  color: Colors.black),
                                              children: [
                                            TextSpan(
                                                text: 'exampleIntery@gmail.com',
                                                style: TextStyle(
                                                    color: Colors.red.shade400))
                                          ])),
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
                        // else{
                        //   print("Lancement de l'authentification par Telephone");
                        //     bool register = await auth.signUp(this.UserName.text ,this.EmailTel.text , this.Password.text,);

                        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => OTPScreen(EmailTel.text)));
                        // }
                        _formSignupKey.currentState!.save();
                      }
                    } else {
                      if (_formSigninKey.currentState!.validate()) {
                        nextix(context);
                        print("$Mail $Pass");
                        print('connection effectue avec sucess!!');
                        bool register = await auth.signIn(Mail.text, Pass.text);
                        _formSigninKey.currentState!.save();
                        if (register) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => home(),
                          ));
                        } else if (register != null) {
                          Navigator.of(context).pop();
                          if (!register)
                            print('email ou mot de passe incorrect');
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                      title: Row(
                                        children: [
                                          Text(
                                            'Error',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
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
                                          'Mot de passe ou Adresse Email incorrect, svp veuillez reessayez avec des donnes valides!!'),
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
                                        ),                                    ]));
                        }
                      }
                    }
                  },
                  child: Container(
                    width: 250.0,
                    height: 150.0,
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
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                )
              : Center(),
        ),
      ),
    );
  }
}
