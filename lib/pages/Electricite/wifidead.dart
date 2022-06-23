import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:interyapp/body/autre/config/util.dart';
import 'package:lottie/lottie.dart';

deadwifi( BuildContext context,bool internet,Widget wid)=> Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        color: Colors.grey.shade100,
        height: MediaQuery.of(context).size.height-40,
        child: Column(
          children: [
             Container(
                 height: MediaQuery.of(context).size.height/2,
                 color: Colors.grey.shade100,
                 child: Lottie.asset('lotie/a1.json',width: double.infinity,height:  MediaQuery.of(context).size.height/2)),
                
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height/7,
                ),
                RichText(
                    maxLines: 2,
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Votre connexion internet est instable\n',
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                      TextSpan(
                          text: '            ou a ete interompue!!',
                          style: TextStyle(color: Colors.black, fontSize: 15))
                    ])),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                   ElevatedButton(onPressed: () async {
                      internet = await InternetConnectionChecker().hasConnection;
                      // final Color = internet ? Colors.green : Colors.red;
                      // final text = internet ? 'Connecte' : "Pas d'internet";
                      // showSimpleNotification(
                      //   Text(
                      //   '$text',
                      //   style: TextStyle(color: Colors.white, fontSize: 20),
                      // ),
                      //  background:
                      // Color,
                      // );
                      // expanded();
                      if (internet) {
                        // nextix(context);
                         nav(wid, context);
                      } else {
                        // nextix(context);
                         nav(deadwifi(context, internet, wid), context);
                        // Navigator.pop(context);
                      }
                    },
   child: Text('Actualiser',
   style: TextStyle(fontSize: 16,
   color: Colors.orange.shade400)
   ,),
   style:ButtonStyle(shape:MaterialStateProperty.all(
     RoundedRectangleBorder(
       side: BorderSide(
         color: Colors.orange.shade400, width: 2
       ),
       borderRadius: BorderRadius.circular(5)
     ),
   ),
    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical:10 ,horizontal: 15)),
    backgroundColor: MaterialStateProperty.all(Colors.white)
   ) ,
   )
              ],
              
            ),
          ],
        ),
      ),
    );