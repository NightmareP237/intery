import 'dart:ffi';

import 'package:flutter/material.dart'
;

class reservation extends StatefulWidget {
  const reservation({ Key? key }) : super(key: key);

  @override
  State<reservation> createState() => _reservationState();
}

class _reservationState extends State<reservation> {
  @override
  Widget build(BuildContext context) {
    bool change=true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Reservation',style: 
        TextStyle(fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white
        ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height/30,
              horizontal: MediaQuery.of(context).size.height/25 ),
              child: Container(
                height:  MediaQuery.of(context).size.height/1.4,
                width: double.infinity,
                color: Colors.orange.shade100,
                child: Column(
                  children: [
                    SizedBox(height: 6,),
                    Padding(padding:
                     EdgeInsets.all(10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Depart',style: TextStyle(
                           color: Colors.black87,
                           fontSize: 15,
                           fontWeight: FontWeight.w500,

                         ),),
                         Text('Douala'
                         ,style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.w700,
                           
                         ),)
                       ],
                     ),
                     ),
                     SizedBox(height: 6,),
                    Padding(padding:
                     EdgeInsets.all(10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Arrivée',style: TextStyle(
                                                      color: Colors.black87,
                           fontSize: 15,
                           fontWeight: FontWeight.w500,

                         ),),
                         Text('Yaounde'
                         ,style: TextStyle(
                           color: Colors.black,
                           fontSize: 18,
                           fontWeight: FontWeight.w700,
                           
                         ),)
                       ],
                     ),
                     ),
                     SizedBox(height: 6,),
                    Padding(padding:
                     EdgeInsets.all(10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Date et heure',style: TextStyle(
                                                      color: Colors.black87,
                           fontSize: 15,
                           fontWeight: FontWeight.w500,

                         ),),
                         Text('Douala'
                         ,style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.w700,
                           
                         ),)
                       ],
                     ),
                     ),
                     SizedBox(height: 6,),
                    Padding(padding:
                     EdgeInsets.all(10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Prix du kg',style: TextStyle(
                           fontSize: 15,
                           fontWeight: FontWeight.w500,
                           color: Colors.black87,

                         ),),
                         Text('500.0 FCFA'
                         ,style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.w700,
                           
                         ),)
                       ],
                     ),
                     ),
                     SizedBox(height: 6,),
                    Padding(padding:
                     EdgeInsets.all(10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Poid tatal en kg',style: TextStyle(
                                                     color: Colors.black87,
                           fontSize: 15,
                           fontWeight: FontWeight.w500,

                         ),),
                         Text('Douala'
                         ,style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.w700,
                           
                         ),)
                       ],
                     ),
                     ),
                     SizedBox(height: 6,),
                    Padding(padding:
                     EdgeInsets.all(10),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Total',style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.w500,

                         ),),
                         Text('Douala'
                         ,style: TextStyle(
                           color: Colors.black,
                           fontSize: 15,
                           fontWeight: FontWeight.w700,
                           
                         ),)
                       ],
                     ),
                     ),
                     Container(
                       height: 30,
                       color: Colors.white,
                       child: Center(
                         child: Text('mode de paiement',
                         style: TextStyle(color:
                          Colors.orange.shade400,fontSize:
                           18,fontWeight: 
                           FontWeight.w600),),
                       ),
                     )
                  ],
                ),
              ),
            ),
             InkWell(
               onTap: () {
                showDialog(context: context, builder:(_)=> SimpleDialog(
                  title: Center(
                    child: Text('Paiement reussi',
                    style: TextStyle(color: Colors.green.shade500,fontWeight:
                     FontWeight.bold,fontSize: 15)
                     ,),
                  ),
                   children: [
                     Container(
                       width: 150,
                       height: 150,
                       child: Image(image: AssetImage('lotie/success.gif')),
                     )
                   ],
                )
                );
                   change=!change;
                   print(change);
               
               },
               child: Container(
                height: MediaQuery.of(context).size.height/15,
                width: MediaQuery.of(context).size.width/1.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                color: Colors.orange
                ),
                child: Center(child:  Text('Valider',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,fontWeight: FontWeight.bold)
                  ,))
                  ),
                         ),
          ],
        ),

      ),
    );
  }
}