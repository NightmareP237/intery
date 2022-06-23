import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter/painting.dart';
import 'package:get/get_connect/http/src/http/utils/body_decoder.dart';
import 'package:interyapp/animation/FadeAnimation.dart';
import 'package:interyapp/animation/animationbutton.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/body/homepage.dart';
import 'package:interyapp/body/navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int count=0;
  List<dynamic> workers = [
    [
      'Alfredo Schafer',
      'Plumber',
      'https://images.unsplash.com/photo-1506803682981-6e718a9dd3ee?ixlib=rb-0.3.5&q=80&fm=jpg&crop=faces&fit=crop&h=200&w=200&s=c3a31eeb7efb4d533647e3cad1de9257',
      4.8
    ],
    // [
    //   'Michelle Baldwin',
    //   'Cleaner',
    //   // 'https://uifaces.co/our-content/donated/oLkb60i_.jpg',
    //   4.6
    // ],
    // [
    //   'Brenon Kalu',
    //   'Driver',
    //   'https://uifaces.co/our-content/donated/VUMBKh1U.jpg',
    //   4.4
    // ]
  ];
 
 Widget professionnel(String name ,String prof,String img,String button){
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
                                      child: Image.network(
                                        img,
                                        width: 70,
                                      ),
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
                                onTap: () {showDialog(context: context,
                                 
                                builder: (context) =>  AlertDialog(
                                        title: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${name}',
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 20,fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        content: Container(
                                          height: MediaQuery.of(context).size.height/4.5,
                                          child: Column(
                                            children: [
                                              RichText(text: TextSpan(
                                                text:  'Ce profil correspond t-il a vos exigences?.',
                                                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Colors.black),
                                                children: [
                                                  TextSpan(
                                                    text: '\nChoisissez le sans tarder.',
                                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.green.shade400),
                                                  ),
                                                ]
                                              )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.height/30,),
                                               Container(
                                                 height: MediaQuery.of(context).size.height/10.5,
                                                 child: MyCustomWidget()
                                                 ,)
                                            ],
                                          ),
                                        ),
                                       )
                                );
                                increment();
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
                              )
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
            'Listes des profiles',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
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
                nav(navigate(), context);
              },
              icon: Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              ),
            ),
    )
          ],
          // leading: GestureDetector(
          //     onTap: () {
          //       Navigator.pushNamed(context, './login');
          //     },
          //     child: Padding(
          //       padding: const EdgeInsets.all(10.0),
          //       child: CircleAvatar(
          //         backgroundImage: NetworkImage(
          //             'https://uifaces.co/our-content/donated/NY9hnAbp.jpg'
          //             ),
          //       ),
          //     )),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          FadeAnimation(
              1,
              Padding(
                padding: EdgeInsets.only(left: 20.0, top: 10.0, right: 10.0),
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
                        professionnel( "Isabel Kirkland", "Cleaner",'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb','View Profile',),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "Isabel Kirkland", "Cleaner",'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb','View Profile',),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "Isabel Kirkland", "Cleaner",'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb','View Profile',),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "Isabel Kirkland", "Cleaner",'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb','View Profile',),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "Isabel Kirkland", "Cleaner",'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb','View Profile',),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                          professionnel( "Isabel Kirkland", "Cleaner",'https://images.pexels.com/photos/355164/pexels-photo-355164.jpeg?crop=faces&fit=crop&h=200&w=200&auto=compress&cs=tinysrgb','View Profile',),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
                        
                      ],
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 20,
          ),
          // FadeAnimation(
          //     1.3,
          //     Padding(
          //       padding: EdgeInsets.only(left: 20.0, right: 10.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Categories',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //           TextButton(
          //               onPressed: () {
          //                 Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => Scaffold(
          //                               appBar: AppBar(
          //                                 title: Text(
          //                                   'Categories',
          //                                   style: TextStyle(
          //                                     fontSize: 18,
          //                                     color: Colors.orange[200],
          //                                   ),
          //                                 ),
          //                               ),
          //                             )));
          //               },
          //               child: Text(
          //                 'View all',
          //               ))
          //         ],
          //       ),
          //     )),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   height: 300,
          //   child: GridView.builder(
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3,
          //         childAspectRatio: 1.0,
          //         crossAxisSpacing: 10.0,
          //         mainAxisSpacing: 10.0,
          //       ),
          //       physics: NeverScrollableScrollPhysics(),
          //       itemCount: services.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return FadeAnimation(
          //             (1.0 + index) / 4,
          //             serviceContainer(services[index].imageUrl,
          //                 services[index].name, index));
          //       }),
          // ),
          // SizedBox(
          //   height: 20,
          // ),
          // FadeAnimation(
          //     1.3,
          //     Padding(
          //       padding: EdgeInsets.only(left: 20.0, right: 10.0),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             'Top Rated',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //           TextButton(
          //               onPressed: () {},
          //               child: Text(
          //                 'View all',
          //               ))
          //         ],
          //       ),
          //     )),
          // Container(
          //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   height: 120,
          //   child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: workers.length,
          //       itemBuilder: (BuildContext context, int index) {
          //         return FadeAnimation(
          //             (1.0 + index) / 4,
          //             workerContainer(workers[index][0], workers[index][1],
          //                 workers[index][2], workers[index][3]));
          //       }),
          // ),
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
