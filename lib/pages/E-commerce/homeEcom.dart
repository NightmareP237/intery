// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:interyapp/animation/FadeAnimation.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/body/homepage.dart';
import 'package:interyapp/pages/Electricite/wifidead.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:url_launcher/url_launcher.dart';

class Homecom extends StatefulWidget {
  const Homecom({Key? key}) : super(key: key);
  @override
  _HomecomState createState() => _HomecomState();
}
class _HomecomState extends State<Homecom> {
  int count=0;
  List<dynamic> workers = [
    [
      'Alfredo Schafer',
      'Plumber',
      'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257',
      4.8
    ],
  ];
 Future<void> Browser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    // }else{
    //   await launch(url);
    //   print(launch(url));
    }
  }
  bool internet = false;
 Widget professionnel(String name ,String prof,String img,String button,String url){
   return  Container(
                          padding: EdgeInsets.all(20.0),
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
                                  ClipRRect(
                                      borderRadius: BorderRadius.circular(15.0),
                                      child:Image(image: AssetImage(img,),width:70,)
                                      ),
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
                                      Browser(url);
                                    } else {
                                      deadwifi(context, internet, Homecom());
                                    }
                                    print('${name}');
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text(
            'I N T E R Y',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
          leading:IconButton(onPressed: () {
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
        body: SingleChildScrollView(
            child: Column(children: [
          FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 0.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Populaires',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              'Voir plus',
                              style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w600),
                            ),
                            SizedBox(width: 5,),
                                Icon(Icons.person_add,color: Colors.orange,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
          FadeAnimation(
              1.2,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: MediaQuery.of(context).size.height/1.3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                        professionnel( "AFARIK SARL", "E-commerce\n-15% de reduction",'assets/afarik.png','Visiter le site','https://www.afarik.com/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "KAMERPHONE", "Phone-market\n-25% de reduction",'assets/camer.png','Visiter le site','https://kmerphone.com/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "iziway SARL", "E-commerce\n-20% de reduction",'assets/iziway.jfif','Visiter le site','https://iziway.cm/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "Prem’ Market", "E-commerce\n-30% de reduction",'assets/prem.jfif','Visiter le site','https://prem-market.com/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "Glotelho SARL", "E-commerce\n-20% de reduction",'assets/logo_glo.png','Visiter le site','https://glotelho.cm/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "SOLDERIS", "E-commerce\n-20% de reduction",'assets/solde.jfif','Visiter le site','https://solderis.com/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                            professionnel( "Sassayez.com", "E-commerce\n-15% de reduction",'assets/sasa.png','Visiter le site','https://sasayez.biz/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                            professionnel( "Wely market", "E-commerce\n-25% de reduction",'assets/welly.jfif','Visiter le site','https://www.welymarket.com/'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                            professionnel( "LiMarket", "E-commerce\n-30% de reduction",'assets/limarket.jfif','Visiter le site','https://www.limarket.net/seller_product/list/ASI76GYP'),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
        ])
        ,)
        ,
        floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Colors.grey,
          tooltip: 'Home',
          elevation: 4,
          child: Icon(Icons.home,size: 30,color: Colors.white,),
          onPressed: ()=>showDialog(context: context,
                                 
                                builder: (context) =>  AlertDialog(
                                        title: 
                                            Center(
                                              child: Text(
                                                'Attention',
                                                style: const TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,fontWeight: FontWeight.bold),
                                          
                                        ),
                                            ),
                                        content: RichText(text: TextSpan(
                                          text:  'Voullez-vous annuler votre demande et revenir a la page d\'accueil ?',
                                          style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),
                                        )
                                        ),
                                        actions: [
                                          Row(
                                                   mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                   children: [
                                                     TextButton(onPressed: (){
                                                       nav(home(), context);
                                                     }, child: Text('Oui',
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.orange.shade400),
                                                     ),),
                                                     TextButton(onPressed: (){
                                                       Navigator.of(context).pop();
                                                     }, child: Text('Non',
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600,color: Colors.orange.shade400),
                                                     )
                                                     )
                                                   ],
                                                 )
                                        ],
                                       )
                                )
        ),
    ));
  }

  serviceContainer(String image, String name, int index) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          border: Border.all(
            color: Colors.blue.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(image, height: 45),
                SizedBox(
                  height: 20,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 15),
                )
              ]),
        ),
      ),
    );
  }

  workerContainer(String name, String job, String image, double rating) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 3.25,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade200,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(image)),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      job,
                      style: TextStyle(fontSize: 15),
                    )
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      rating.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 20,
                    )
                  ],
                )
              ]),
        ),
      ),
    );
  }

  void increment() {
    setState(() {
      count++;
    });
  }
}
