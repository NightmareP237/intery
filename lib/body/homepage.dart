import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:interyapp/animation/FadeAnimation.dart';
import 'package:interyapp/body/autre/service/database.dart';
import 'package:interyapp/body/menu.dart';
import 'package:interyapp/pages/E-commerce/e_commerce.dart';
import 'package:interyapp/pages/Electricite/electrity.dart';
import 'package:interyapp/pages/Electricite/wifidead.dart';
import 'package:interyapp/pages/Livraison/splashlivaison.dart';
import 'package:interyapp/pages/driver/screens/available/spincar.dart';
import 'package:interyapp/pages/plombery/plombery.dart';
import 'package:interyapp/pages/revetement/revetir.dart';
import 'package:interyapp/pages/spinclean.dart';

import 'navigator.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  @override
  _homeState createState() => _homeState();
}
class _homeState extends State<home> {
  authservices auth = authservices();
  Future<void> getuser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    final userResult = await DBServices().getUser(user!.uid);
  //  setState(() {
  //     user = userResult; 
  //  });
        // print('connect to  '+user.uid);
  }
  

@ override
  bool change = true;
  void changed() {
    setState(() {
      col=!col;
    });
  }
 bool internet = false;
  bool col = true;
  List<Widget> page = [
    electricity(),
    cleanning(),
    AvailableCar(),
    plombery(),
    e_commerce(),
    liver(),
    revetir()
  ];
    int selectedService =-1;
   late int position=0;
  @override
  Widget items(
      int index, String categorie, String image, Icon icon) {
        late String img=image;
    return Padding(
        padding: const EdgeInsets.all(0),
        child: InkWell(
          onTap: () {            
            setState(() {
          if (selectedService == index)
            selectedService = -1;
          else{
            selectedService = index;
          }
            position=index;
        });
          },
          child: Container(
            width: MediaQuery.of(context).size.height / 2.4,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              gradient: LinearGradient(colors: [
                Colors.black54,
                Color(0xfef5e6ef)
              ],begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(img,),fit:BoxFit.cover ),
                    ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                        //  icon,
                         icon,
                         icon,
                         icon,
                         Icon(Icons.star,color: Colors.white,),
                          SizedBox(width: MediaQuery.of(context).size.width/2.9,),
                          IconButton(onPressed: (){
                            changed();
                             print(col);
                          }, icon:Icon(Icons.favorite,color: col ? Colors.white :Colors.red,))
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.height * 0.18,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(3)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                categorie,
                                style: TextStyle(fontSize: 17, color: Colors.white),
                              ),
                            ),
                            Icon(Icons.arrow_right_alt,size: 35,color: Colors.white,),
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
          )
        ));
  }
  @override
  Widget build(BuildContext context) {
    getuser();
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: menu(),
      body: CustomScrollView(
    slivers: [
      SliverAppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => navigate()));
                });
              },
              icon: Icon(
               FontAwesomeIcons.search,
               color: Colors.white,
              )),
          SizedBox(width:10,),

        ],
        expandedHeight: 0,
        pinned: true,
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'I N T E R Y',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
      ),
       SliverToBoxAdapter(
        child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/35, 
              right: MediaQuery.of(context).size.height/30, 
              left: MediaQuery.of(context).size.height/20),
              child: Text(
                'Quels services souhaitez-vous?',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.grey.shade900,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:MediaQuery.of(context).size.height/20,
            vertical: MediaQuery.of(context).size.height/45
            ),
          child: FadeAnimation(1.5,
             Card(
               borderOnForeground: true,
               elevation: 10,
               color: Colors.grey.shade200,
               child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.orange.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: items(0, '   Electricite', 'https://image.shutterstock.com/z/stock-photo-light-bulb-with-wood-house-on-the-table-a-symbol-for-construction-creative-light-bulb-idea-power-1420610747.jpg',
                 Icon(Icons.star,size: 20,color: Colors.yellowAccent.shade700,)),
                             ),
             ),
          ),
        ),
      ),
       SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal:MediaQuery.of(context).size.height/20,vertical:
             MediaQuery.of(context).size.height/45),
          child: Card(
            elevation: 10,
               color: Colors.grey.shade200,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: items(1, '   Service d\'entretien', 'https://image.shutterstock.com/z/stock-photo-housekeeping-and-cleaning-service-concept-cheerful-african-american-couple-with-spray-detergents-1686704662.jpg', Icon(Icons.star,size: 20,color: Colors.yellowAccent.shade700,)),
            ),
          ),
        ),
      ),
       SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height/20,vertical: MediaQuery.of(context).size.height/45),
          child: Card(
            elevation: 10,
               color: Colors.grey.shade200,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(20)
               ), child: items(2, '   Location automobile','https://image.shutterstock.com/z/stock-photo-young-beautiful-black-teenage-driver-holding-car-keys-driving-her-new-car-151083941.jpg', Icon(Icons.star,size: 20,color: Colors.yellowAccent.shade700,)),
            ),
          ),
        ),
      ),
       SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height/20,vertical: MediaQuery.of(context).size.height/45),
          child: Card(
            elevation: 10,
               color: Colors.grey.shade200,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: items(3, '   Service de plomberie', 'https://media.istockphoto.com/photos/young-black-male-plumber-sitting-on-the-floor-fixing-a-bathroom-sink-picture-id1065440380?k=6&m=1065440380&s=612x612&w=0&h=84_laKpRAb54jLhrzesobMhqOWEAvd9leA9i6yFxzFs=', Icon(Icons.star,size: 20,color: Colors.yellowAccent.shade700,)),
            ),
          ),
        ),
      ),
       SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height/20,vertical: MediaQuery.of(context).size.height/45),
          child: Card(
            elevation: 10,
               color: Colors.grey.shade200,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: items(4, '   E-Commerce','https://image.shutterstock.com/z/stock-photo-happy-young-black-african-woman-customer-shopper-holding-credit-card-using-cell-phone-mobile-app-2055003335.jpg', Icon(Icons.star,size: 20,color: Colors.yellowAccent.shade700,)),
            ),
          ),
        ),
      ),
       SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height/20,vertical: MediaQuery.of(context).size.height/45),
          child: Card(
            elevation: 10,
               color: Colors.grey.shade200,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: items(5, '   Service de livraison', 'https://image.shutterstock.com/z/stock-photo-courier-delivery-black-man-driver-driving-delivery-car-1167692635.jpg', Icon(Icons.star,size: 20,color: Colors.yellowAccent.shade700,)),
            ),
          ),
        ),
      ),
       SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.height/20,vertical: MediaQuery.of(context).size.height/45),
          child: Card(
            elevation: 10,
               color: Colors.grey.shade200,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.orange.shade200,
                  borderRadius: BorderRadius.circular(20)),
              child: items(6, '   Revetement murale', 'https://image.shutterstock.com/z/stock-photo-small-paint-cans-of-many-colors-in-a-wooden-box-1702869892.jpg', Icon(Icons.star,size: 20,color: Colors.yellowAccent.shade700,)),
            ),
          ),
        ),
      ),
    ],
      ),
      floatingActionButton:selectedService >= 0? FloatingActionButton(
            onPressed: () async {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) { page[position];}
              //   ),
              // );
              internet= await InternetConnectionChecker().hasConnection;
              Navigator.push(context, MaterialPageRoute(builder: (context)=> internet ? page[position]:deadwifi(context, internet, page[position])));
              print(page[position]);
            },
            child: Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            ),
            backgroundColor: Colors.orange,
          ):null
    );
  }

  void loadimage() {
    // String url='https://image.shutterstock.com/shutterstock/photos/1420610747/display_1500/stock-photo-light-bulb-with-wood-house-on-the-table-a-symbol-for-construction-creative-light-bulb-idea-power-1420610747.jpg';
    // http.get(url);
  }
}

class authservices {
}
