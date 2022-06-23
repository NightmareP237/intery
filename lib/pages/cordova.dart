// import 'dart:async';
// import 'dart:ffi';

// import 'package:craking/sreens/future.dart';
// import 'package:craking/widgets/util.dart';
// import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(cordova());
// }

// class cordova extends StatefulWidget {
//   const cordova({ Key? key }) : super(key: key);

//   @override
//   _cordovaState createState() => _cordovaState();
// }

// class _cordovaState extends State<cordova> {
//   @override
//    int second=00;
//     int minute=00;
//     int heure=00;
//     @override
    
//   Widget build(BuildContext context) {
//     // Timer.periodic(Duration(microseconds: 20), (timer) { 
      
//     // });
// void count(){
//  setState(() {
//       second++;
//  });
// }
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar:AppBar(title: Text('Chronometre',),
//         centerTitle: true,
//         elevation: 0,
//         ),
//         body: Column(
//           children: [
//             Container(
//               height: 280,
//               width: double.infinity,
//              decoration: BoxDecoration(color: Colors.blue,
//              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40) )),
//              child:Column(children:[
//                SizedBox(),
//                Padding(padding: EdgeInsets.all(30),
//                child: Text('Lancer votre \n Chronometre',style: TextStyle(color: Colors.white,fontSize: 19),)
//                ),
//                Padding(padding: EdgeInsets.symmetric(horizontal: 30),
//                child: Text('Temps:',style: TextStyle(color: Colors.white,fontSize: 35),),),
//                Padding(padding: EdgeInsets.all(10)
//                ,child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Container(
//                      decoration: BoxDecoration(
//                        color: Colors.black54,
//                        borderRadius: BorderRadius.circular(30)
//                      ),
//                      child: Padding(padding: EdgeInsets.symmetric(horizontal: 40,vertical: 30),
//                      child: Row(
//                        children: [
//                          Text('0${heure}:',style: TextStyle(color: Colors.white,fontSize: 40),),
//                          Text('0${minute}:',style: TextStyle(color: Colors.white,fontSize: 40),),
//                          Text('${second}',style: TextStyle(color: Colors.white,fontSize: 40),),
//                        ],
//                      ),),
//                    )
//                  ],
//                ),),     
//              ],
//             ),
//       ),
//       SizedBox(height: 100,),
//      Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: [
//         RaisedButton(onPressed: (){
//       final Timer yooo =Timer.periodic(Duration(seconds: 1), (timer) { 
//      setState(() {
//         count();
//      });
//     });
//    setState(() {
//       final DateTime e=DateTime.parse(yooo.toString());
//     if (e==60) {
//       minute++;
//     }
//    });
//         },
//          color: Colors.green,
//          child:Padding(
//            padding: const EdgeInsets.all(4.0),
//            child: Text('start',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//          ) ,),
//          SizedBox(width: 20,),
//          RaisedButton(onPressed:()=> Timer.run(() {
        
//          }),
//          color: Colors.red,
//          child:Padding(
//            padding: const EdgeInsets.all(8.0),
//            child: Text('stop',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//          ) ,),
//           SizedBox(width: 20,),
//          RaisedButton(onPressed: (){
//            setState(() {
//              second==0;
//            });
//          },
//          color: Colors.blue,
//          child:Padding(
//            padding: const EdgeInsets.all(4.0),
//            child: Text('restart',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//          ) ,),
          
//        ],
//      )
//           ],
//         ),
//       )
//     );
//   }
// }