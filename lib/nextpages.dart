
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:interyapp/connectionpage.dart';
import 'package:interyapp/inscription.dart';
import 'package:interyapp/sreens/authentification.dart';
import 'package:interyapp/sreens/background.dart';
import 'package:interyapp/sreens/spinhome.dart';

class previous extends StatefulWidget {
  const previous({Key? key}) : super(key: key);

  @override
  _previousState createState() => _previousState();
}

class _previousState extends State<previous> {
  authservices auth = authservices();
  bool opas = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(children: [
        backgroundimage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.589,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: button('connection', Colors.grey, Colors.black87)),
                  SizedBox(
                    height: 15,
                  ),
                  boost('inscription', Colors.orange.shade200, Colors.white),
                  SizedBox(
                    height: 15,
                  ),
                  anonyme('En un clic', Colors.blue.shade200, Colors.white),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                ]),
          ),
        ),
      ]),
    );
  }

  Widget button(String text, Color design, Color prestige) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => next()));
      },
      minWidth: MediaQuery.of(context).size.width * 0.7,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      color: design,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: prestige,
        ),
      ),
    ));
  }

  Widget boost(String text, Color design, Color prestige) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (conterxt) => inscrit()));
              });
            },
            minWidth: MediaQuery.of(context).size.width * 0.7,
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: design,
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: prestige,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget anonyme(String text, Color design, Color prestige) {
    return Container(
      child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        MaterialButton(
          onPressed: () async {
            nextix(context);
            final result = await auth.signAnonimous();
            if (result != null) {
              print('connection effectue avec sucess');
              print(result);
            } else {
              print('echec de coonection!!');
            }
          },
          minWidth: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: design,
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: prestige,
            ),
          ),
        )
      ]),
    );
  }
}
