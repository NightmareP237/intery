import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/body/homepage.dart';
import 'package:interyapp/pages/Electricite/wifidead.dart';
import 'package:interyapp/pages/Livraison/test.dart';
import 'package:lottie/lottie.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class electric extends StatefulWidget {
  const electric({ Key? key }) : super(key: key);

  @override
  State<electric> createState() => _electricState();
}

class _electricState extends State<electric> {
  @override
  Widget build(BuildContext context) {
    int count=0;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'I N T E R Y',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(onPressed: (){
            nav(home(), context);
          }, icon: Icon(Icons.arrow_back)),
          actions: [
            Badge(
       position: BadgePosition.topEnd(top: 25, end: 5,),
      badgeContent: Text('${count}',style: TextStyle(color: Colors.white),),
      animationDuration: Duration(milliseconds: 500),
      animationType: BadgeAnimationType.slide,
      badgeColor: Colors.red,
      child: IconButton(
              onPressed: () {
                print('tap');
                // nav(livaison(), context);
              },
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ),
    )
          ],
        ),
        body:Container(
                    height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: double.infinity,
                  child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_nfs2quex.json'),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
              child: Container(
                  height: (MediaQuery.of(context).size.height/3.5),
                width: double.infinity,
                color: Colors.transparent,
                child: professionnel('SERVICE ELECTRIQUE', 'Pour vos problemes electriques\nVeuillez prendre rendez-vous', 'Suivant',),
              ),)
            ],
          ),
        )
    );
  }

Widget professionnel(String name ,String prof,String button,){
  bool internet=false;
  int count=0;
   void increment() {
    setState(() {
      count++;
    });
  }
   return  Container(
                          padding: EdgeInsets.all(10.0),
                          height: MediaQuery.of(context).size.height/3.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              color: Colors.orange.shade300,
                              width: .8,
                              style: BorderStyle.solid,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade300,
                                offset: Offset(0, 4),
                                blurRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        name,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        prof,
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.7),
                                            fontSize: 18),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              InkWell(
                                onTap: () async {
                                  increment();
                                 internet = await InternetConnectionChecker().hasConnection;
                      final Color = internet ? Colors.green : Colors.red;
                      final text = internet ? 'Connecte' : "Pas d'internet";
                     !internet? showSimpleNotification(
                        Text(
                        '$text',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                       background:
                      Color,
                      ):null;
                                    if (internet) {
                                      nav(villelivrer(), context);
                                    } else {
                                      deadwifi(context, internet, electric());
                                    }
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/13,
                                    decoration: BoxDecoration(
                                        color: Colors.orange.shade700,
                                        borderRadius: BorderRadius.circular(15.0)),
                                    child: Center(
                                        child: Text(
                                      button,
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    )),
                                  ),
                                ),
                            ],
                          ),
                        );
 }
}

//  buttonside('Devit', Colors.orange.shade200,context),
//                     buttonside('Obtenir', Colors.orange.shade200,context)