import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:interyapp/pages/Electricite/wifidead.dart';
import 'package:overlay_support/overlay_support.dart';

import 'LivaiHome.dart';

class villelivrer extends StatefulWidget {
  const villelivrer({ Key? key }) : super(key: key);

  @override
  State<villelivrer> createState() => _villelivrerState();
}

class _villelivrerState extends State<villelivrer> {
  @override
  Widget build(BuildContext context) {
var tai=MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/5,
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    nav(livaison(), context);
                  }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
                  Padding(padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/35,vertical: MediaQuery.of(context).size.height/18),
                  child: Container(
                    width: MediaQuery.of(context).size.height/3,
                    height:MediaQuery.of(context).size.height/12,
                  child: Center(
                    child: Text('I N T E R Y',
                    style: TextStyle(fontSize: 25,color: Colors.orange,fontWeight: FontWeight.bold))
                  ) ,
                  ),),
                   Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            color: Colors.black,
                            ),
                            child: Center(
                              child: Icon(Icons.notifications_active,color: Colors.white,),
                            ),
                          ),
                ],
              ),
              ),
              Container(
                height:tai.height-(MediaQuery.of(context).size.height/5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.orange.shade400,
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(20),
                   topRight: Radius.circular(20)
                 )
                ),
                child: Stack(
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(text: 'SERVICE DE LIVRAISON'
                              ,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700),
                              children:[
                              ]),
                            ),
                            SizedBox(height: 5,),
                          ],
                        ),),
                        
                      ],
                    ),
                    ),
                      Positioned(
                        top: 50,
                        left: 30,
                        right:30,
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Form(child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                            child: TextFormField(
                              cursorHeight: 3,
                              decoration: InputDecoration(
                                hintText: 'lieu de livraison',
                                fillColor: Colors.orange.shade200,
                                suffixIcon: Icon(Icons.search),
                              ),
                            ),
                          )),
                        ),
                      ),
                        Padding(padding: EdgeInsets.only(top: 110,left: 25,right: 25),
                            child:Container(
                              color: Colors.transparent,
                              width: double.infinity,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    professionnel('LIVRAISON', '24h/24\n-10% via Afarik', 'assets/afarik.png', 'Expedier', 'url')
                                   , professionnel('LIVRAISON', '24h/24\nvia Kamerphone', 'assets/camer.png', 'Expedier', 'url')
                                    ,professionnel('LIVRAISON', '24h/24\n-7% via Iziway', 'assets/iziway.jfif', 'Expedier', 'url')
                                    ,professionnel('LIVRAISON', '24h/24\n-5% via Glothelo', 'assets/logo_glo.png', 'Expedier', 'url')
                                   , professionnel('LIVRAISON', '24h/24\n-3% via SOLDERIS', 'assets/solde.jfif', 'Expedier', 'url')
                                   , professionnel('LIVRAISON', '24h/24\nvia Wely market', 'assets/welly.jfif', 'Expedier', 'url')
                                    ,professionnel('LIVRAISON', '24h/24\nvia Prem’ Market', 'assets/prem.jfif', 'Expedier', 'url')
                                  ],
                                ),
                              ),
                            ) ,
                                    )],
                  
                   ),
              ),
            ]
          ),
        ),
      ),
    );
  }
  Widget professionnel(String name ,String prof,String img,String button,String url){
  bool internet=false;
   return  Padding(
     padding: const EdgeInsets.symmetric(vertical:10.0),
     child: Container(
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
                                    // increment();
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
                                        // Browser(url);
                                      } else {
                                        deadwifi(context, internet, livaison());
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
                          ),
   );
 }
}

