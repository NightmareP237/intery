import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class congratulations extends StatefulWidget {
  const congratulations({ Key? key }) : super(key: key);
  @override
  State<congratulations> createState() => _congratulationsState();
}

class _congratulationsState extends State<congratulations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
             height:MediaQuery.of(context).size.height,
             width: double.infinity,
             decoration: BoxDecoration(
             color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)
              )
             ),
             child: Lottie.asset('lotie/c1.json')
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/35, 
              //   right: MediaQuery.of(context).size.height/30, 
              //   left: MediaQuery.of(context).size.height/20),
              //   child: Text(
              //     'Felicitations!!',
              //     style: TextStyle(
              //       fontSize: 30,
              //       color: AppColor.mainColor,
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
          ],
        ),
        // height: MediaQuery.of(context).size.height-40,
        width: double.infinity,
      ),
    );
  }
  Widget autre()=> Center(child: Container(
               height: MediaQuery.of(context).size.height/5,
               width: MediaQuery.of(context).size.height/5,
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: Colors.green.shade100
               ),
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Container(
                    height: MediaQuery.of(context).size.height/10,
                 width: MediaQuery.of(context).size.height/10,
                  decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.green.shade600
                 ),
                 child: Center(
                   child:Icon(Icons.check,
                   size: 40,
                   color: Colors.white,
                   ) ,
                 )
                 ),
               ),
             ));
}

