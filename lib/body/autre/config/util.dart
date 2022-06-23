import 'package:flutter/material.dart';

class util{


}
 void nav(Widget navigate,BuildContext context,{bool close=false}){
    close? Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_)=>navigate),
     (route) => false):
      Navigator.push(context,
       MaterialPageRoute(builder: (context)=>navigate));
  }
  void sizeh(double height,BuildContext context){
    var size=MediaQuery.of(context).size.height/height;
  }
   void sizew(double wit,BuildContext context){
    var size=MediaQuery.of(context).size.height/wit;
  }
   Widget hosted(String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(
          color: Colors.white70,
          strokeWidth: 3,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }